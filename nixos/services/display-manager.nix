{pkgs, ...}: let
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
  services.xserver.displayManager = {
    sddm = {
      enable = true;
      autoNumlock = true;
      theme = "${sddm-chili}";
    };
  };

  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtquickcontrols
    libsForQt5.qt5.qtgraphicaleffects
  ];
}
