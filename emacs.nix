{ pkgs ? import <nixpkgs> {} }:

let
  emacs = pkgs.emacs26;
  emacsWithPackages = (pkgs.emacsPackagesNgGen emacs).emacsWithPackages;
in
  emacsWithPackages (epkgs: (with epkgs.melpaStablePackages; [
    atomic-chrome
    company
    company-terraform
    counsel
    counsel-projectile
    diminish
    expand-region
    flycheck
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
  ]) ++ (with epkgs.melpaPackages; [
    highlight-indent-guides
    restclient
    use-package
  ]) ++ (with epkgs.elpaPackages; [
    rainbow-mode
  ]))
