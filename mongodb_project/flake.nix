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
        pymongo
      ]);
    in rec {
      devShells."${system}".default = pkgs.mkShell {
        name = "mongodb_project";
        buildInputs = with pkgs; [
          wget gcc pythonDrv mongodb pkgs.copper
        ];
        shellHook = "mkdir -p .database; chmod +x start_db.sh";
      };
    };
}
