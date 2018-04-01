{stdenv, fetchFromGitHub, python3}:
  stdenv.mkDerivation {
    name = "fifolog";
    buildPhase = ''
      gcc -g fifolog.c -o fifolog
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp fifolog $out/bin/
    '';

    src = fetchFromGitHub {
      owner = "andrewchambers";
      repo = "fifolog";
      rev = "d273eb8dfb0ea481c044e0f2710fac3a583d52cd";
      sha256 = "024zxq0pk2mrdycnkzq4iyf2w378x2x26gcjq8sbbip76zrdk1xw";
    };
  }