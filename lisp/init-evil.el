;;; init-evil.el -- an emacs config

;;; Commentary:

;;; Code:

(use-package evil
  :ensure t
  :init
  (setq evil-want-C-w-in-emacs-state t
        evil-want-Y-yank-to-eol t)
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
  (evil-mode t)
  (add-hook 'git-commit-mode-hook 'evil-insert-state)
  (define-key evil-normal-state-map "j" 'evil-next-visual-line)
  (define-key evil-normal-state-map "k" 'evil-previous-visual-line)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-scroll-down)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-scroll-up)
  (define-key evil-motion-state-map (kbd "C-j") 'evil-scroll-down)
  (define-key evil-motion-state-map (kbd "C-k") 'evil-scroll-up)
  )

(provide 'init-evil)
;; init-evil.el ends here
