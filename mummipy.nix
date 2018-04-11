{stdenv, fetchFromGitHub, python3}:
  stdenv.mkDerivation {
    name = "mummipy";
    buildPhase = ''
      # nothing
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp $src/mummipy $out/bin
      cp $src/unmummipy $out/bin
    '';

    nativeBuildInputs = [
      python3
    ];

    src = fetchFromGitHub {
      owner = "andrewchambers";
      repo = "mummipy";
      rev = "9651d77975106a35a63801f74a0e327014c2d8f1";
      sha256 = "1bj2bvrqwv9r8736wy72zw5vkqi89hk5lf5hxsmy1mk963lgs89g";
    };
  }
