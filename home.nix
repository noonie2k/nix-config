{ pkgs, ... }:

{
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
      gcc
      gnumake
      gnupg
      go
      htop
      leiningen
    ];
  };

  programs = {
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
  };

  services = {
    gpg-agent = {
      enable = true;

      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };
  };
}
