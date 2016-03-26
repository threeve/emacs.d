;;; init-evil.el -- an emacs config

;;; Commentary:

;;; Code:

(use-package evil
  :ensure t
  :demand t
  :bind (:map evil-motion-state-map
              ("j" . evil-next-visual-line)
              ("k" . evil-previous-visual-line)
              ("C-j" . evil-scroll-down)
              ("C-k" . evil-scroll-up)
              ("[ q" . previous-error)
              ("] q" . next-error)
              ("-" . dired-jump))
  :init
  (setq evil-mode-line-format '(before . mode-line-front-space)
        evil-want-C-w-in-emacs-state t
        evil-want-Y-yank-to-eol t
        evil-visual-state-cursor 'hollow)
  :config
  (use-package evil-ediff :ensure t)
  (use-package evil-commentary
    :ensure t
    :diminish ""
    :config (evil-commentary-mode))
  (use-package evil-quickscope
    :ensure t
    :config (global-evil-quickscope-mode t))
  (use-package evil-surround
    :ensure t
    :config (global-evil-surround-mode t))
  (add-hook 'git-commit-mode-hook 'evil-insert-state)
  (evil-define-key 'normal dired-mode-map "-" 'dired-up-directory)
  (evil-mode t))

(provide 'init-evil)
;; init-evil.el ends here
