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
