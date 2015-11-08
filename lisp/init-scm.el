;;; init-scm.el -- an emacs config

;;; Commentary:

;;; Code:

(eval-when-compile
  (require 'use-package))

(use-package magit
  :ensure t
  :config
  (setq magit-push-always-verify nil)
  (define-key evil-normal-state-map (kbd "<SPC> g") 'magit-status))

(use-package diff-hl
  :ensure t
  :config (global-diff-hl-mode))

(provide 'init-scm)
;; init-scm.el ends here
