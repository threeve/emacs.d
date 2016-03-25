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

;; clang-format package depends on features of clang-format not yet
;; available in the homebrew version
;; requires installing the llvm --with-clang formula
;; (use-package clang-format
;;   :ensure t)


(provide 'prog-objc)
;;; prog-objc.el ends here
