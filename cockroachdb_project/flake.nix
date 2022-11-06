{
  inputs = {
    copper.url = "github:zoedsoupe/copper";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
  };

  outputs = { self, nixpkgs, copper }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        overlays = [ copper.overlays.default ];
        config.allowUnfree = true;
      };

      pythonDrv = pkgs.python310.withPackages (p: with p; [
        psycopg2
      ]);
    in rec {
      devShells."${system}".default = pkgs.mkShell {
        name = "cockrochdb_project";
        packages = with pkgs; [
          wget gcc pythonDrv cockroachdb pkgs.copper
        ];
        shellHook = ''
        mkdir -p certs;

        if ! [ -n "$(ls -A ./certs 2>/dev/null)" ]; then
          ${pkgs.cockroachdb}/bin/cockroach cert create-ca \
            --certs-dir=certs \
            --ca-key=$PWD/ca.key \
            --allow-ca-key-reuse

          ${pkgs.cockroachdb}/bin/cockroach cert create-node \
            localhost \
            $(${pkgs.hostname}/bin/hostname) \
            --certs-dir=certs \
            --ca-key=$PWD/ca.key

          ${pkgs.cockroachdb}/bin/cockroach cert create-client \
            root \
            --certs-dir=certs \
            --ca-key=$PWD/ca.key
        fi

        chmod +x start_db.sh
        '';
      };
    };
}
