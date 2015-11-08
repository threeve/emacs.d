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

(use-package git-gutter
  :ensure t
  :config
  (setq git-gutter:ask-p nil)
  (define-key evil-normal-state-map "]h" 'git-gutter:next-hunk)
  (define-key evil-normal-state-map "[h" 'git-gutter:previous-hunk)
  (define-key evil-normal-state-map (kbd "<SPC> h s") 'git-gutter:stage-hunk)
  (global-git-gutter-mode))

(provide 'init-scm)
;; init-scm.el ends here
