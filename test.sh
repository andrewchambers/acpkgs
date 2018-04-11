#! /bin/sh

set -e
set -x
set -u

pkgs=$(realpath ./default.nix)
tempdir=$(mktemp -d)
cd $tempdir
nix build -f $pkgs
