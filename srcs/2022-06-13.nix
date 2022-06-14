{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nixpkgs-22.11pre385130.3d2819ec0b9";
  version = "2022-06-13";

  src = fetchurl {
    url = "https://releases.nixos.org/nixpkgs/${name}/nixexprs.tar.xz";
    sha256 = "83f5b46ebfba5f978794158df9cb3515128d6b39ab597d2b9495d4809b3f9275";
  };

  dontBuild = true;
  preferLocalBuild = true;

  installPhase = ''
    cp -a . $out
  '';
}
