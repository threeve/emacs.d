;;; prog-haskell.el --- haskell config
;;; Commentary:
;;; Code:

(eval-when-compile
  (require 'use-package))

(use-package haskell-mode
  :ensure t
  :init
  (defun jafo/haskell-mode-hook ()
    (haskell-indentation-mode)
    (haskell-decl-scan-mode)
    (haskell-doc-mode))
  (add-hook 'haskell-mode-hook #'jafo/haskell-mode-hoook)
  :mode ("\\.hs$" . haskell-mode))

(use-package flycheck-haskell
  :ensure t
  :config
  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup)))

(provide 'prog-haskell)
;;; prog-haskell.el ends here
