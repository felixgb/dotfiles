(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-laserwave t))

(use-package treemacs
  :ensure t)

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-height 30))

(use-package counsel
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (projectile-mode 1))

(use-package counsel-projectile
  :after counsel projectile
  :ensure t
  :config
  (global-set-key (kbd "<f12>") 'counsel-projectile-find-file))

(use-package treemacs-projectile
  :ensure t
  :after treemacs projectile)

(use-package lsp-mode
  :hook  (scala-mode . lsp)
  :ensure t)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package lsp-ui
  :ensure t
  :after lsp-mode flycheck)

(use-package lsp-treemacs
  :ensure t
  :after lsp-mode
  :config
  (lsp-metals-treeview-enable t))

(use-package lsp-ivy
  :ensure t
  :after lsp-mode)

(use-package haskell-mode
  :ensure t)

(use-package scala-mode
  :ensure t
  :mode "\\.s\\(cala\\|bt\\)$")


(add-to-list 'default-frame-alist '(font . "hack-20"))

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq custom-file "~/.emacs.d/custom.el")

(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)
