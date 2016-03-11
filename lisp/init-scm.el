;;; init-scm.el -- an emacs config

;;; Commentary:

;;; Code:

(use-package magit
  :ensure t
  :config
  (setq magit-push-always-verify nil)
  (evil-make-overriding-map magit-mode-map 'emacs)
  (evil-define-key 'emacs magit-mode-map "j" #'magit-section-forward)
  (evil-define-key 'emacs magit-mode-map "k" #'magit-section-backward)
  ;; (evil-define-key 'emacs magit-mode-map "C-j" #'magit-section-forward-sibling) ; TODO: this doesn't work quite right...
  ;; (evil-define-key 'emacs magit-mode-map "C-k" #'magit-section-backward-sibling)
  (define-key magit-mode-map (kbd "C-w") 'evil-window-map)
  (define-key evil-normal-state-map (kbd "<SPC> g") 'magit-status))

(use-package diff-hl
  :ensure t
  :config (global-diff-hl-mode))

(provide 'init-scm)
;; init-scm.el ends here
