{
  description = ''
    Plataforma PEA Pescarte
  '';

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    rec {
      devShells = {
        "${system}".default = pkgs.mkShell {
          name = "pescarte";
          buildInputs = with pkgs; [
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
