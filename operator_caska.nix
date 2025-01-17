# {
#   stdenvNoCC,
#   lib,
# }:
# stdenvNoCC.mkDerivation {
#   pname = "Operator-caska";
#   version = "1.0";
#   src = /home/dihan/System/Fonts/operator_caska;
 
#   installPhase = ''
#     mkdir -p $out/share/fonts/truetype/
#     cp -r $src/*.{ttf,otf} $out/share/fonts/truetype/
#   '';
 
#   meta = with lib; {
#     description = "Operator Caska";
#     homepage = "https://github.com/Anant-mishra1729/Operator-caska-Font";
#     platforms = platforms.all;
#   };
# }

# make a  derivation for berkeley-mono font installation
{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "Operator-caska";
  version = "1.0";
  src = /home/dihan/System/Fonts/operator_caska;

  installPhase = ''
    mkdir -p $out/share/fonts/truetype/
    cp -r $src/*.{ttf,otf} $out/share/fonts/truetype/
  '';
 
  meta = with lib; {
    description = "Operator Caska";
    homepage = "https://github.com/Anant-mishra1729/Operator-caska-Font";
    platforms = platforms.all;
  };
}
