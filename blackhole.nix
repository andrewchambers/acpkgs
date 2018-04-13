{stdenv, fetchFromGitHub, go}:
  stdenv.mkDerivation {
    name = "mummipy";

    buildPhase = ''
      mkdir -p $out/bin
      go build $src/blackhole.go
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp blackhole $out/bin
    '';

    nativeBuildInputs = [
      go
    ];

    src = fetchFromGitHub {
      owner = "andrewchambers";
      repo = "blackhole";
      rev = "b09cd793827f637df7e57851eaaa4c4cf9820c6b";
      sha256 = "1fkpwwkv3wsk31dhg4kl3di95blfh8d78l2m83spzs40imfknf76";
    };
  }
