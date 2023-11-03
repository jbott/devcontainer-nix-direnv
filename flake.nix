{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in
        with pkgs; {
          # Create a default shell with the "hello" package. Useful flake.nix
          # files would add more packages that are used for development to the
          # shell here.
          devShells.default = mkShell {
            buildInputs = [hello];
          };
          # Configure the nix fmt command
          formatter = alejandra;
        }
    );
}
