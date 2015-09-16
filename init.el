;;; init.el -- an emacs config

;;; Commentary:

;;; Code:

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(setq
 blink-matching-paren t
 create-lockfiles nil
 custom-file "~/.emacs.d/custom.el"
 inhibit-startup-screen t
 initial-scratch-message nil
 make-backup-files nil
 require-final-newline t
 ring-bell-function 'ignore
 use-dialog-box nil)

(setq-default
 indent-tabs-mode nil)

(fset 'yes-or-no-p 'y-or-n-p)

(auto-save-mode 0)
(global-visual-line-mode 0)
(line-number-mode 0)
(scroll-bar-mode 0)
(show-paren-mode t)
(tool-bar-mode 0)

(load custom-file 'noerror)

(use-package noctilux-theme
  :ensure t
  :config
  (load-theme 'noctilux))

(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 120
                    :weight 'normal)

(use-package evil
  :ensure t
  :config
  (evil-mode t)
  (define-key evil-normal-state-map ";" 'evil-ex))

(provide 'init)
;;; init.el ends here
