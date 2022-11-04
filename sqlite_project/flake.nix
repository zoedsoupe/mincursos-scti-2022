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
    in rec {
      devShells."${system}".default = pkgs.mkShell {
        name = "sqlite_project";
        buildInputs = with pkgs; [
          wget gcc python310 sqlite copper
        ];
      };
    };
}
