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
    in rec {
      devShells."${system}".default = pkgs.mkShell {
        name = "sqlite_project";
        buildInputs = with pkgs; [
          wget gcc python310 sqlite pkgs.copper
        ];
      };
    };
}
