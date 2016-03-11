;;; init-editing.el -- an emacs config

;;; Commentary:

;;; Code:

(use-package editorconfig
  :ensure t)

(use-package expand-region
  :ensure t
  :commands (er/expand-region
             er/contract-region)
  :init
  (global-set-key (kbd "C-=") #'er/expand-region)
  (global-set-key (kbd "C--") #'er/contract-region))

(use-package ace-jump-mode
  :ensure t
  :bind (("s-j" . ace-jump-mode)
         ("s-J" . ace-jump-line-mode)))

(add-hook 'text-mode-hook #'turn-on-auto-fill)
(add-hook 'text-mode-hook #'bug-reference-mode)
(add-hook 'prog-mode-hook #'bug-reference-prog-mode)

(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)

(setq
 require-final-newline t)

(setq-default
 indent-tabs-mode nil)

(auto-save-mode 0)
(global-auto-revert-mode t)

(provide 'init-editing)
;; init-editing.el ends here
