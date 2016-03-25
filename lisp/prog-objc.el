;;; prog-objc.el --- objc config
;;; Commentary:
;;; Code:

(use-package irony
  :ensure t
  :commands irony-mode
  :init
  (add-hook 'c-mode-hook #'irony-mode)
  (add-hook 'c++-mode-hook #'irony-mode)
  (add-hook 'objc-mode-hook #'irony-mode)
  (add-hook 'irony-mode-hook #'irony-cdb-autosetup-compile-options)
  :config
  (use-package company-irony
    :ensure t
    :config
    (with-eval-after-load 'company
      (add-to-list 'company-backends #'company-irony)))
  ;; this one needs to be forked to support objc
  (use-package company-irony-c-headers
    :ensure t
    :config
    (with-eval-after-load 'company
      (add-to-list 'company-backends #'company-irony-c-headers)))
  (use-package flycheck-irony
    :ensure t
    :config
    (with-eval-after-load 'flycheck
      (add-hook 'flycheck-mode-hook #'flycheck-irony-setup)))
  )

(use-package clang-format
  :ensure t
  :commands (clang-format-region clang-format-buffer)
  :init
  (evil-define-key 'normal objc-mode-map "g =" #'clang-format-region)
  ;; nice idea but too aggressive
  ;; (add-hook 'objc-mode-hook
  ;;           (lambda () (add-hook 'before-save-hook #'clang-format-buffer)))
  )

(provide 'prog-objc)
;;; prog-objc.el ends here
