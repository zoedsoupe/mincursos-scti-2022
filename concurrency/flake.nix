{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    copper.url = "github:zoedsoupe/copper";
  };

  outputs = { self, nixpkgs, copper }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        overlays = [ copper.overlays.default ];
        config.allowUnfree = true;
      };
    in
    rec {
      devShells = {
        "${system}".default = pkgs.mkShell {
          name = "pescarte";
          packages = with pkgs; [
            gnumake
            gcc
            readline
            openssl
            zlib
            libxml2
            curl
            libiconv
            elixir
            glibcLocales
            pkgs.copper
          ] ++ lib.optional stdenv.isLinux [
            inotify-tools
            gtk-engine-murrine
          ] ++ lib.optional stdenv.isDarwin [
            darwin.apple_sdk.frameworks.CoreServices
            darwin.apple_sdk.frameworks.CoreFoundation
          ];
        };
      };
    };
}
