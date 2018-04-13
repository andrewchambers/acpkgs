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
      rev = "882366a45e1f105a5dfa34032e655ec1e5927daf";
      sha256 = "0zadphcll6vnm9av103mh0ayj09pq4n0p3ikq36nsp3j5mblmqkv";
    };
  }
