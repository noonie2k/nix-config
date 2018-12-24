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
        direnv
        dockerfile-mode
        expand-region
        flycheck
        go-eldoc
        go-mode
        golden-ratio
        highlight-indent-guides
        ivy
        magit
        nginx-mode
        nix-mode
        org
        org-bullets
        org-plus-contrib
        paredit
        projectile
        rainbow-delimiters
        rainbow-mode
        restclient
        robe
        swiper
        terraform-mode
        toc-org
        use-package
        which-key
        yaml-mode
        yasnippet
        yasnippet-snippets
        yatemplate
        zerodark-theme
      ];
    };
  };
}
