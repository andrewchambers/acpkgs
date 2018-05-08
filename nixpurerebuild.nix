{stdenv, fetchFromGitHub, python3}:
  stdenv.mkDerivation {
    name = "nixpurerebuild";
    buildPhase = ''
      # nothing
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp $src/nixos-pure-rebuild.sh $out/bin/nixos-pure-rebuild
    '';


    src = fetchFromGitHub {
      owner = "andrewchambers";
      repo = "nixos-pure-rebuild";
      rev = "42ecd6d42955f01df3cc8dedce57a2bf97d8140d";
      sha256 = "0y7rw50wrfh2179p2cc8ssyjy322rlcr564m33r2z88035m7kjc0";
    };
  }
