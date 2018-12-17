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
        PATH = "$HOME/go/bin:$PATH";
        EDITOR = "${pkgs.emacs}/bin/emacsclient -a nano";
      };
    };
  };
}
