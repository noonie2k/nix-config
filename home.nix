{ pkgs, ... }:

{
  manual.manpages.enable = true;

  imports = [
    ./desktop.nix
    ./emacs.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = true;
    };
  };

  home = {
    packages = [
      pkgs.gnupg
      pkgs.htop
      pkgs.leiningen
    ];
  };

  programs = {
    git = {
      enable = true;

      userName = "Adam Noon";
      userEmail = "adam.ian.noon@gmail.com";
      signing.key = "3202ABC6565D547C";
      signing.signByDefault = true;
    };
  };

  services = {
    gpg-agent = {
      enable = true;

      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };
  };

  xdg = {
    enable = true;

    configHome = "/home/adam/.config";
    dataHome   = "/home/adam/.local/share";
    cacheHome  = "/home/adam/.cache";
  };
}
