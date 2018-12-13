{ pkgs, ... }:

{
  home.packages = [
    pkgs.silver-searcher
  ];
  programs = {
    bash = {
      enable = true;

      historyFile = "$HOME/.config/bash/history";
      historyControl = [
        "erasedups"
        "ignorespace"
      ];
      sessionVariables = {
        EDITOR = "${pkgs.emacs}/bin/emacsclient -a nano";
      };
    };
  };
}
