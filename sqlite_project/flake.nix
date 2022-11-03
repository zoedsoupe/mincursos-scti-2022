{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in rec {
      devShells = {
        "${system}".default = pkgs.mkShell {
          name = "sqlite_project";
          buildInputs = with pkgs; [
            wget gcc sqlite python310
          ];
        };
      };
    };
}
