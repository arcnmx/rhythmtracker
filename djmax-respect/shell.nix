{ pkgs ? import <nixpkgs> { } }:

with pkgs; let
  python = python3.withPackages (p: with p; [
    requests beautifulsoup4 urllib3
  ]);

in mkShell {
  nativeBuildInputs = [ python yq jq ];
  shellHook = ''
    unset SOURCE_DATE_EPOCH
  '';
}
