{ pkgs, ... }:

let
  home_directory = builtins.getEnv "HOME";

in rec {
  manual.manpages.enable = true;

  imports = [
    ./desktop.nix
    ./emacs.nix
    ./shell.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = true;
    };
  };

  home = {
    file = {
      ".gemrc".text = ''gem: --user-install'';
    };

    packages = with pkgs; [
      go
      gnupg
      htop
      leiningen
    ];
  };

  programs = {
    home-manager = {
      enable = true;

      path = "${xdg.configHome}/nixpkgs/vendor/home-manager";
    };

    direnv = {
      enable = true;
    };

    git = {
      enable = true;

      userName = "Adam Noon";
      userEmail = "adam.ian.noon@gmail.com";
      signing.key = "3202ABC6565D547C";
      signing.signByDefault = true;
    };
  };

  xdg = {
    enable = true;

    configHome = "${home_directory}/.config";
  };

  services = {
    gpg-agent = {
      enable = true;

      defaultCacheTtl = 14400;
      enableSshSupport = true;
    };
  };
}
