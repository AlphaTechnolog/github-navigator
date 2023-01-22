{
  description = "GitHub Navigator with selenium and python";

  inputs = {
    nixpkgs.url = github:nixos/nixpkgs;
    flake-utils.url = github:numtide/flake-utils;
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        system = "x86_64-linux";
        overlays = [
          (final: prev: {
            github-navigator = pkgs.python3Packages.buildPythonApplication rec {
              pname = "github-navigator";
              version = "0.1.0";

              src = ./.;

              propagatedBuildInputs = with pkgs; [
                python3Packages.selenium
                geckodriver
              ];

              doCheck = false;

              meta = with pkgs.lib; {
                description = "GitHub Navigator with selenium and python";
                maintainer = [ maintainers.alphatechnolog ];
              };
            };
          })
        ];

        pkgs = import nixpkgs {
          inherit system overlays;
        };
      in
      {
        packages.default = pkgs.github-navigator;
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            github-navigator
          ];
        };
      }
    );
}
