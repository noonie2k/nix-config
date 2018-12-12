{ pkgs, ... }:

let
  homeDirectory = builtins.getEnv "Home";
  emacsPackages = import ./emacs.nix pkgs;
in rec {
  manual.manpages.enable = true;

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
    ];

    sessionVariables = {
      EDITOR = "${pkgs.emacs26}/bin/emacsclient -a vi";
    };
  };

  programs = {
    emacs = {
      enable = true;

      extraPackages = emacsPackages;
    };

    git = {
      enable = true;

      userName = "Adam Noon";
      userEmail = "adam.ian.noon@gmail.com";
      signing.key = "3202ABC6565D547C";
      signing.signByDefault = true;
    };

    zsh = rec {
      enable = true;

      dotDir = ".config/zsh";
      enableCompletion = false;
      enableAutosuggestions = true;

      history = {
        size = 50000;
        save = 50000;
        path = "${dotDir}/history";
        ignoreDups = true;
        share = true;
      };
    };
  };

  services = {
    gpg-agent = {
      enable = true;

      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };

    redshift = {
      enable = true;

      latitude = "51.18";
      longitude = "-114.41";
    };
  };

  xdg = {
    enable = true;

    configHome = "${homeDirectory}/.config";
    dataHome   = "${homeDirectory}/.local/share";
    cacheHome  = "${homeDirectory}/.cache";
  };
}
