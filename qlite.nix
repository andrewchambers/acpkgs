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
      rev = "beaf694af22a534dd9169e22f5099324d030cd0a";
      sha256 = "0m9p8gi1xbllbchyj0kzj5sd4hzvzbj6z7g1dx6824s0yv7d9qn4";
    };
  }