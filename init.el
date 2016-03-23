;;; init.el -- an emacs config

;;; Commentary:

;;; Code:

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(setq
 create-lockfiles nil
 make-backup-files nil)

(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-initialize))

;; my customizations
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(use-package init-ui)
(use-package init-editing)
(use-package init-evil)
(use-package init-ido)
(use-package init-markdown)
(use-package init-scm)
(use-package init-writing)

;; programming cruft

(use-package prog-objc)
(use-package prog-js)
(use-package prog-clojure)

;; additional packages

(use-package projectile
  :ensure t
  :init (setq projectile-mode-line '(:eval (format " P⟨%s⟩" (projectile-project-name))))
  :config
  (with-eval-after-load 'evil
    (define-key evil-normal-state-map (kbd "<SPC> p") 'projectile-command-map))
  (projectile-global-mode))

(use-package mmm-mode
  :ensure t
  :diminish mmm-mode
  :config
  (setq mmm-global-mode 'maybe
        mmm-submode-decoration-level 0)
  (mmm-add-classes
   '((markdown-objc
      :submode objc-mode
      :front "^\\([ \t]*```\\)objc\n"
      :back "^~1$"
      :save-matches t
      :end-not-begin t)))
  (mmm-add-mode-ext-class 'gfm-mode nil 'markdown-objc))

(use-package flycheck
  :ensure t
  :config
  ;; not sure I like this...
  ;; (use-package flycheck-pos-tip
  ;;   :ensure t
  ;;   :config
  ;;   (eval-after-load 'flycheck
  ;;     '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
  (setq flycheck-display-errors-delay 0.4
        flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package company
  :ensure t
  :diminish ""
  :config
  (use-package company-quickhelp :ensure t) ; doesn't seem to work?
  (use-package company-flx :ensure t)       ; only works with capf, not interesting stuff like irony
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-j") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (define-key company-active-map (kbd "C-k") #'company-select-previous)
  (setq company-idle-delay 0.2))

(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :config
  (setq yas-prompt-functions '(yas-completing-prompt))
  (yas-global-mode t))

(use-package paradox
  :ensure t
  :commands (paradox-list-packages)
  :init
  (define-key evil-normal-state-map (kbd "<SPC> u p") 'paradox-list-packages)
  (define-key evil-normal-state-map (kbd "<SPC> u P") 'package-list-packages-no-fetch)
  (evil-set-initial-state 'paradox-menu-mode 'motion)
  :config
  (setq paradox-display-download-count t
        paradox-execute-asynchronously nil
        paradox-hide-wiki-packages t
        paradox-spinner-type 'moon
        paradox-use-homepage-buttons nil))

(provide 'init)
;;; init.el ends here
