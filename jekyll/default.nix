with (import <nixpkgs> {});
let env = bundlerEnv {
    name = "marketing-hyper";
    inherit ruby;
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;
  };
in stdenv.mkDerivation {
  name = "marketing-hyper";
  buildInputs = [env bundler ruby];
}