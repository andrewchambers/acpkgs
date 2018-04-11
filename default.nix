{ pkgs ? (import <nixpkgs>) {} }:
{
	kvdb = pkgs.callPackage (import ./kvdb.nix) {};
	mummipy = pkgs.callPackage (import ./mummipy.nix) {};
	qlite = pkgs.callPackage (import ./qlite.nix) {};
	fifolog = pkgs.callPackage (import ./fifolog.nix) {};
    google-cloud-sdk = pkgs.python2.pkgs.callPackage (import ./google-cloud-sdk ) {};
}
