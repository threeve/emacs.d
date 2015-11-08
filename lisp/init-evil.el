;;; init-evil.el -- an emacs config

;;; Commentary:

;;; Code:

(eval-when-compile
  (require 'use-package))

(use-package evil
  :ensure t
  :config
  (evil-mode t)
  (add-hook 'git-commit-mode-hook 'evil-insert-state)
  (define-key evil-normal-state-map ";" 'evil-ex))

(provide 'init-evil)
;; init-evil.el ends here
