{ pkgs ? (import <nixpkgs>) {} }:
{
	blackhole = pkgs.callPackage (import ./blackhole.nix) {};
	kvdb = pkgs.callPackage (import ./kvdb.nix) {};
	mummipy = pkgs.callPackage (import ./mummipy.nix) {};
	qlite = pkgs.callPackage (import ./qlite.nix) {};
	fifolog = pkgs.callPackage (import ./fifolog.nix) {};
	nixos-pure-rebuild = pkgs.callPackage (import ./nixospurerebuild.nix) {};
	/* XXX had to manually override go. */
	cockroachdb = pkgs.callPackage (import ./cockroachdb.nix) {
		buildGoPackage = pkgs.callPackage <nixpkgs/pkgs/development/go-modules/generic> {
			go = pkgs.go;
		};
	};
}
