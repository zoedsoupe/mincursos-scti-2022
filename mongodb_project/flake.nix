{
  inputs = {
    copper.url = "github:zoedsoupe/copper";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        overlays = [ inputs.copper.overlays."${system}".default ];
        config.allowUnfree = true;
      };

      pythonDrv = pkgs.python310.withPackages (p: with p; [
        pymongo
      ]);
    in rec {
      devShells."${system}".default = pkgs.mkShell {
        name = "mongodb_project";
        buildInputs = with pkgs; [
          wget gcc pythonDrv mongodb copper
        ];
        shellHook = "mkdir -p .database; chmod +x start_db.sh";
      };
    };
}
