(require 'use-package)
(use-package org
  :mode ("\\.org\\'" . org-mode))

(add-hook 'org-mode-hook 'org-indent-mode)

(add-hook 'org-mode-hook 'visual-line-mode)

(use-package org-agenda
  :bind ("C-c a" . org-agenda))

(setq-default org-directory (expand-file-name "~/org")
              org-default-notes-file (expand-file-name "inbox.org" org-directory)
              org-agenda-files '(org-directory))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp t)
   (org . t)
   (shell . t)))

(setq org-src-fontify-natively t
      org-src-tab-acts-natively t)

(setq org-export-babel-evaluate nil)

(use-package toc-org
  :hook (org-mode . toc-org-enable))
