;;; init-scm.el -- an emacs config

;;; Commentary:

;;; Code:

(setq ediff-window-setup-function #'ediff-setup-windows-plain)

(use-package magit
  :ensure t
  :bind (:map evil-normal-state-map
              ("<SPC> g b" . magit-blame)
              ("<SPC> g c" . magit-clone)
              ("<SPC> g d" . magit-diff-buffer-file-popup)
              ("<SPC> g l" . magit-log-buffer-file)
              ("<SPC> g s" . magit-status)
              )
  :config
  (use-package evil-magit :ensure t)
  (setq magit-completing-read-function #'magit-ido-completing-read))

(use-package diff-hl
  :ensure t
  :config (global-diff-hl-mode))

(provide 'init-scm)
;;; init-scm.el ends here
