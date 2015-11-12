;;; prog-objc.el --- objc config
;;; Commentary:
;;; Code:

(eval-when-compile
  (require 'use-package))

;; (use-package ycmd
;;   :ensure t
;;   :config
;;   (use-package company-ycmd
;;     :ensure t
;;     :config (company-ycmd-setup))
;;   (set-variable 'ycmd-server-command '("python" "/Users/jason/Source/ycmd/ycmd")))

(use-package irony
  :ensure t
  :config
  (use-package company-irony
    :ensure t
    :config
    (eval-after-load 'company
      '(add-to-list 'company-backends #'company-irony)))
  ;; this one needs to be forked to support objc
  (use-package company-irony-c-headers
    :ensure t
    :config
    (eval-after-load 'company
      '(add-to-list 'company-backends #'company-irony-c-headers)))
  (use-package flycheck-irony
    :ensure t
    :config
    (eval-after-load 'flycheck
      '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)))
  ;; (defun my-irony-mode-hook ()
  ;;   (define-key irony-mode-map [remap completion-at-point]
  ;;     'irony-completion-at-point-async)
  ;;   (define-key irony-mode-map [remap complete-symbol]
  ;;     'irony-completion-at-point-async))
  ;; (add-hook 'irony-mode-hook #'my-irony-mode-hook)
  (add-hook 'c-mode-hook #'irony-mode)
  (add-hook 'c++-mode-hook #'irony-mode)
  (add-hook 'objc-mode-hook #'irony-mode)
  (add-hook 'irony-mode-hook #'irony-cdb-autosetup-compile-options))

;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
(defun jafo/objc-mode-hook ()
  (define-key objc-mode-map [(tab)] #'company-complete))

(add-hook 'objc-mode-hook #'jafo/objc-mode-hook)

;; clang-format package depends on features of clang-format not yet
;; available in the homebrew version
;; requires installing the llvm --with-clang formula
;; (use-package clang-format
;;   :ensure t)


(provide 'prog-objc)
;;; prog-objc.el ends here
