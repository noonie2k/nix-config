{ pkgs, ... }:

{
  home = {
    packages = [
      pkgs.chromium
      pkgs.firefox
      pkgs.slack
      pkgs.zoom-us
    ];
  };

  services = {
    redshift = {
      enable = true;

      latitude = "51.18";
      longitude = "-114.41";
    };
  };
}
