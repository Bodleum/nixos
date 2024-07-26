{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.display-manager;
  sddm-chili =
    pkgs.stdenv.mkDerivation
    rec {
      name = "sddm-chili-theme";
      pname = "sddm-chili-theme";
      version = "0.1.5";

      installPhase = ''
        mkdir -p $out
        cp -R ./* $out/
      '';

      src = pkgs.fetchFromGitHub {
        owner = "MarianArlt";
        repo = "sddm-chili";
        rev = "${version}";
        sha256 = "sha256-wxWsdRGC59YzDcSopDRzxg8TfjjmA3LHrdWjepTuzgw=";
      };
    };
in {
  options.display-manager = {
    enable = lib.mkEnableOption ''
      Enable the display manager
    '';
  };

  config = lib.mkIf cfg.enable {
    services.displayManager = {
      sddm = {
        enable = true;
        autoNumlock = true;
        theme = "${sddm-chili}";
      };
    };

    # Dependencies
    environment.systemPackages = builtins.attrValues {
      inherit
        (pkgs.libsForQt5.qt5)
        qtquickcontrols
        qtgraphicaleffects
        ;
    };
  };
}