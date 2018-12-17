{ pkgs, ... }:

{
  home = {
    file = {
      ".emacs.d/init.el".source = ./dotfiles/emacs.el;
      ".emacs.d/org-mode.el".source = ./dotfiles/org-mode.el;
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
        company-go
        company-terraform
        counsel
        counsel-projectile
        diminish
        expand-region
        flycheck
        go-eldoc
        go-mode
        ivy
        magit
        nix-mode
        org
        org-bullets
        org-plus-contrib
        paredit
        projectile
        rainbow-delimiters
        rbenv
        robe
        swiper
        terraform-mode
        toc-org
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
