{ stdenv, buildGoPackage, fetchurl, cmake, xz, which, autoconf, ncurses6, libedit }:

buildGoPackage rec {
  name = "cockroach-${version}";
  version = "2.0.1";

  goPackagePath = "github.com/cockroachdb/cockroach";

  src = fetchurl {
    url = "https://binaries.cockroachdb.com/cockroach-v${version}.src.tgz";
    sha256 = "0plmca8qglkimgwnr22fcrd406plk6inm1c6313zvlshmmhr94jg";
  };

  buildInputs = [ (if stdenv.isDarwin then libedit else ncurses6) ];
  nativeBuildInputs = [ cmake xz which autoconf ];

  buildPhase = ''
    runHook preBuild
    cd $NIX_BUILD_TOP/go/src/${goPackagePath}
    patchShebangs .
    make buildoss
    cd src/${goPackagePath}
    for asset in man autocomplete; do
      ./cockroach gen $asset
    done
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    install -D cockroach $bin/bin/cockroach
    install -D cockroach.bash $bin/share/bash-completion/completions/cockroach.bash
    cp -r man $bin/share/man
    runHook postInstall
  '';

  meta = with stdenv.lib; {
    homepage = https://www.cockroachlabs.com;
    description = "A scalable, survivable, strongly-consistent SQL database";
    license = licenses.asl20;
    platforms = [ "x86_64-linux" "x86_64-darwin" ];
    maintainers = [ maintainers.rushmorem ];
  };
}
