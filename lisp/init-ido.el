;;; init-ido.el -- an emacs config

;;; Commentary:

;;; Code:

(eval-when-compile
  (require 'use-package))

(use-package flx-ido
  :ensure t
  :config
  (setq ido-enable-flex-matching t
        ido-use-faces nil)
  (ido-mode t)
  (ido-everywhere t)
  (flx-ido-mode t))

(use-package ido-ubiquitous
  :ensure t
  :config
  (ido-ubiquitous-mode t))

(use-package ido-vertical-mode
  :ensure t
  :config (ido-vertical-mode t))

(use-package smex
  :ensure t
  :commands (smex
             smex-major-mode-commands)
  :init
  (global-set-key (kbd "M-x") #'smex)
  (global-set-key (kbd "M-X") #'smex-major-mode-commands))

(use-package idomenu
  ;; TODO: assign a keybinding for this
  :ensure t)

(provide 'init-ido)
;; init-ido.el ends here
