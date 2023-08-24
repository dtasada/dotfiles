{ config, pkgs, ... }:

/* let
  my-python-packages = ps: with ps; [
    (
      buildPythonPackage rec {
        pname = "pygame-ce";
        version = "2.3.1";
        src = fetchPypi {
          inherit pname version;
          sha256 = "sha256-xr7Ly4wWYjl9ptZ7nKtp5dFn/+rD2ZPrFUncHDe+eD4=";
        };
        doCheck = false;
        propagatedBuildInputs = with pkgs; [
          # Specify dependencies
	  dpkg
	  python310
	  python310Packages.numpy
	  SDL2
	  SDL2_mixer
	  SDL2_image
	  SDL2_ttf
	  SDL2_gfx
        ];
      }
    )
    numpy
  ];
  python-with-my-packages = pkgs.python310.withPackages my-python-packages;
in */

{
 environment.systemPackages = with pkgs; [
    # python-with-my-packages
    dpkg
    dart-sass
    gcc
    gnumake
    nodejs_18
    pixelorama
    python3Full
  ];
}
