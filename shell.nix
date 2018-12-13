{ pkgs, ... }:

{
  programs = {
    bash = {
      enable = true;

      historyFile = "$HOME/.config/bash_history";
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
