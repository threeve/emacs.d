;;; init-editing.el -- an emacs config

;;; Commentary:

;;; Code:

(eval-when-compile
  (require 'use-package))

(use-package editorconfig
  :ensure t)

(use-package expand-region
  :ensure t
  :commands (er/expand-region
             er/contract-region)
  :init
  (global-set-key (kbd "C-=") #'er/expand-region)
  (global-set-key (kbd "C--") #'er/contract-region))

(add-hook 'text-mode-hook #'turn-on-auto-fill)
(add-hook 'text-mode-hook #'bug-reference-mode)
(add-hook 'prog-mode-hook #'bug-reference-prog-mode)

(setq
 require-final-newline t)

(setq-default
 indent-tabs-mode nil)

(auto-save-mode 0)

(provide 'init-editing)
;; init-editing.el ends here
