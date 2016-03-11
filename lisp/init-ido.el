;;; init-ido.el -- an emacs config

;;; Commentary:

;;; Code:

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
  :config
  (defun jafo/ido-setup-hook ()
    (define-key ido-completion-map (kbd "C-j") 'ido-next-match)
    (define-key ido-completion-map (kbd "C-k") 'ido-prev-match))
  (add-hook 'ido-setup-hook #'jafo/ido-setup-hook)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only)
  (ido-vertical-mode t))

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
