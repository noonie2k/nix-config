{ pkgs, ... }:

let
  home_directory = builtins.getEnv "Home";
in
  rec {
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
  };

  xdg = {
    enable = true;

    configHome = "${home_directory}/.config";
    dataHome   = "${home_directory}/.local/share";
    cacheHome  = "${home_directory}/.cache";
  };
}
