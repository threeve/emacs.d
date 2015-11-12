;;; init.el -- an emacs config

;;; Commentary:

;;; Code:

(setq gc-cons-threshold (* 20 1024 1024)) ; 20 MB

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
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

;; my customizations
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-initialize))

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
(use-package prog-haskell)
(use-package prog-clojure)
;; (use-package prog-swift)


;; additional packages

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

(use-package restclient
  :ensure t
  :mode ("\\.http$" . restclient-mode))

;; company-restclient (completion of http headers in restclient mode)

;; something wrong with flycheck-swift-sdk-path?
;; (use-package swift-mode :ensure t)


;; Experimental stuff from here down...

(use-package twittering-mode
  :ensure t)

;; TODO: hook these into markdown mmm
;; (use-package graphviz-dot-mode :ensure t)
;; (use-package gnuplot-mode :ensure t)

;; ---
;; react/web/js stuff

;; (use-package web-mode
;;   :ensure t
;;   :mode ("\\.jsx$" . web-mode)
;;   :config
;;   (flycheck-add-mode 'javascript-eslint 'web-mode))

;; (use-package js2-mode
;;   :ensure t)

;; (use-package json-mode
;;   :ensure t)

;; (use-package tern
;;   :ensure t)

;; (use-package company-tern
;;   :ensure t
;;   :config
;;   (eval-after-load 'company
;;     '(add-to-list 'company-backends #'company-tern)))

;; (use-package typescript-mode
;;   :ensure t
;;   :mode ("\\.tsx?$" . typescript-mode))

;; (use-package tide
;;   :ensure t
;;   :init
;;   (defun jafo/tide-hook ()
;;     (tide-setup))
;;   :config
;;   (add-hook 'typescript-mode-hook #'tide-setup))

;; ---

;; TODO:

;; company-irony-c-headers
;; paredit, smartparens, evil-smartparens
;; narrow with indirect buffer
;; hideshow-mode (folding)
;; formfeed mode
;; ggtags
;; ansible
;; company-ansible
;; dockerfile-mode
;; prodigy
;; nodejs-repl
;; swank-js
;; skewer
;; emacsql
;; ess - emacs speaks statistics
;; learn how to use undo-tree
;;    - (setq undo-tree-visualizer-diff t)
;;    - (setq undo-tree-visualizer-timestamps t)
;; rainbow-mode : display css-style colors as their own background
;; evil-numbers : vimmish inc/dec for numbers
;; (setq show-trailing-whitespace t) and prog-mode-hook
;; (setq comment-auto-fill-only-comments t) ???
;; hl-todo, lokaltog font lock comment annotations
;; calfw
;; (require 'calfw)
;; (setq cfw:fchar-junction ?╋
;;       cfw:fchar-vertical-line ?┃
;;       cfw:fchar-horizontal-line ?━
;;       cfw:fchar-left-junction ?┣
;;       cfw:fchar-right-junction ?┫
;;       cfw:fchar-top-junction ?┳
;;       cfw:fchar-top-left-corner ?┏
;;       cfw:fchar-top-right-corner ?┓)
;; gist
;; aggressive-indent, aggressive-fill-paragraph

;; volatile-highlights
;; ehhh, maybe... needs face customization
;; (use-package volatile-highlights
;;   :ensure t
;;   :config
;;   (vhl/define-extension 'jafo-evil-highlights
;;                         'evil-yank
;;                         'evil-yank-line
;;                         'evil-paste-pop
;;                         'evil-paste-pop-next
;;                         'evil-paste-after
;;                         'evil-paste-before)
;;   (vhl/install-extension 'jafo-evil-highlights)
;;   (volatile-highlights-mode t))



(provide 'init)
;;; init.el ends here
