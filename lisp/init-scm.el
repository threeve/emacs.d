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
  ;; align toggled magit sections to top of screen
  (defadvice magit-section-toggle (after scroll-line-to-top () activate)
    (recenter 0))
  (setq magit-completing-read-function #'magit-ido-completing-read
        magit-diff-refine-hunk t))

(use-package diff-hl
  :ensure t
  :config (global-diff-hl-mode))

(use-package git-messenger
  :ensure t
  :bind (:map evil-normal-state-map
              ("<SPC> g m" . git-messenger:popup-message)))

(use-package git-timemachine
  :ensure t
  :bind (:map evil-normal-state-map
              ("<SPC> g t" . git-timemachine))
  :config
  ;; @see https://bitbucket.org/lyro/evil/issue/511/let-certain-minor-modes-key-bindings
  (evil-make-overriding-map git-timemachine-mode-map 'normal)
  (add-hook 'git-timemachine-mode-hook #'evil-normalize-keymaps))

(provide 'init-scm)
;;; init-scm.el ends here
