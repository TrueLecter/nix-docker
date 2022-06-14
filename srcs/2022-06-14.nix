{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nixpkgs-22.11pre385191.3c2068d6c90";
  version = "2022-06-13";

  src = fetchurl {
    url = "https://releases.nixos.org/nixpkgs/${name}/nixexprs.tar.xz";
    sha256 = "9fd6032013fe75b351e680621d493b12d1e8b48fe4008b9ae6e0408296ce6af8";
  };

  # buildInputs = [ findutils ];

  dontBuild = true;
  preferLocalBuild = true;

  installPhase = ''
    find . -executable -type f | xargs -n1 sed -i"" -e 's/bin\/env -S/bin\/env/g'
    cp -a . $out
  '';
}
