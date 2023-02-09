# Commit hash for nixos-22.11-small obtained at https://status.nixos.org as of 12-01-2023
{ pkgs ? import
  (fetchTarball "https://github.com/NixOS/nixpkgs/archive/7010ce2ebc72.tar.gz")
  { } }:

pkgs.mkShell { buildInputs = [ pkgs.nodejs-18_x ]; }
