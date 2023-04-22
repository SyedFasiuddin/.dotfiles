(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(setq inhibit-startup-screen 1
      make-backup-files nil
      global-hl-line-mode t)
(set-frame-font "SF Mono 16")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(require 'use-package)

(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))
(use-package modus-themes
  :ensure t
  :config
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs t))
(load-theme 'modus-operandi :no-confirm)

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/Documents/Zettelkasten/"))
  :bind (("C-c n c" . org-roam-capture)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert))
  :config
  (define-key minibuffer-local-completion-map (kbd "SPC") 'self-insert-command)
  (org-roam-db-autosync-mode))

(use-package org-roam-ui
  :ensure t
  :after org-roam)

(add-hook 'org-mode-hook
  (lambda ()
    (auto-fill-mode 1)))
(setq-default fill-column 80)

(setq ispell-program-name "/opt/homebrew/bin/ispell")
(dolist (hook '(org-mode-hook))
  (add-hook hook
    (lambda ()
      (flyspell-mode 1))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(modus-themes doom-themes evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
