{stdenv, fetchFromGitHub, python3}:
  stdenv.mkDerivation {
    name = "kvdb";
    buildPhase = ''
      # nothing
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp $src/kvdb $out/bin
    '';

    nativeBuildInputs = [
      python3
    ];

    src = fetchFromGitHub {
      owner = "andrewchambers";
      repo = "kvdb";
      rev = "fc185777fba71a52bf107d0eb7f713fc64e7ef1b";
      sha256 = "09djq8gl2pgp8h6h6jc9pprinszp9cmx2krxnvp6793yia892g2l";
    };
  }
