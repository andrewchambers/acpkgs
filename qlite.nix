{stdenv, fetchFromGitHub, python3}:
  stdenv.mkDerivation {
    name = "qlite";
    buildPhase = ''
      # nothing
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp $src/qlite $out/bin
    '';

    nativeBuildInputs = [
      python3
    ];

    src = fetchFromGitHub {
      owner = "andrewchambers";
      repo = "qlite";
      rev = "fd55908546933dfc72289d6e39c67ed153507524";
      sha256 = "1b234mhpk01fs8iz7lv9gi054swappbp3micfnysfq2z2x6icy1q";
    };
  }