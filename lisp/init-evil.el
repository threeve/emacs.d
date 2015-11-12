;;; init-evil.el -- an emacs config

;;; Commentary:

;;; Code:

(eval-when-compile
  (require 'use-package))

(use-package evil
  :ensure t
  :config
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
  (setq evil-want-C-w-in-emacs-state t
        evil-want-Y-yank-to-eol t)
  (evil-mode t)
  (add-hook 'git-commit-mode-hook 'evil-insert-state)
  (define-key evil-normal-state-map "j" 'evil-next-visual-line)
  (define-key evil-normal-state-map "k" 'evil-previous-visual-line)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-scroll-down)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-scroll-up)
  (define-key evil-motion-state-map (kbd "C-j") 'evil-scroll-down)
  (define-key evil-motion-state-map (kbd "C-k") 'evil-scroll-up)
  (define-key evil-normal-state-map ";" 'evil-ex)
  (define-key evil-visual-state-map ";" 'evil-ex))

(provide 'init-evil)
;; init-evil.el ends here
