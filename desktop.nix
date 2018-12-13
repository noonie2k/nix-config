{ pkgs, ... }:

{
  home = {
    packages = [
      pkgs.firefox
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
