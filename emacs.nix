{ pkgs, ... }:

{
  home = {
    file = {
      ".emacs".source = ./dotfiles/emacs.el;
    };

    sessionVariables = {
      EDITOR = "${pkgs.emacs}/bin/emacsclient -a vi";
    };
  };

  programs = {
    emacs = {
      enable = true;

      extraPackages = epkgs: with epkgs; [
        atomic-chrome
        cider
        clojure-mode
        coffee-mode
        company
        company-terraform
        counsel
        counsel-projectile
        diminish
        expand-region
        flycheck
        go-mode
        ivy
        magit
        nix-mode
        paredit
        projectile
        rainbow-delimiters
        rbenv
        robe
        swiper
        terraform-mode
        which-key
        yasnippet
        yasnippet-snippets
        yatemplate
        zerodark-theme
        highlight-indent-guides
        restclient
        use-package
        rainbow-mode
      ];
    };
  };
}
