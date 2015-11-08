;;; init-ui.el -- an emacs config

;;; Commentary:

;;; Code:

(prefer-coding-system 'utf-8-unix)

(eval-when-compile
  (require 'use-package))

(use-package noctilux-theme
  :ensure t
  :config (load-theme 'noctilux))

(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 120
                    :weight 'normal)

(setq
 blink-matching-paren t
 echo-keystrokes 0.02
 indicate-empty-lines t
 inhibit-startup-screen t
 initial-scratch-message nil
 mac-option-modifier 'none
 mac-right-command-modifier 'meta
 ring-bell-function 'ignore
 scroll-conservatively 10000
 scroll-preserve-screen-position t
 use-dialog-box nil)

(fset 'yes-or-no-p 'y-or-n-p)
(fringe-mode '(4 . 0))
(global-hl-line-mode t)
(global-visual-line-mode 0)
(line-number-mode 0)
(scroll-bar-mode 0)
(show-paren-mode t)
(tool-bar-mode 0)

(provide 'init-ui)
;;; init-ui.el ends here
