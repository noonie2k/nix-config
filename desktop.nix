{ pkgs, ... }:

{
  home = {
    packages = [
      pkgs.chromium
      pkgs.firefox
      pkgs.slack
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
