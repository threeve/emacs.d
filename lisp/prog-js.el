;;; prog-js.el --- javascript config
;;; Commentary:
;;; Code:

;; TODO: both web-mode and js2-mode have some amount of jsx support, need to compare.

(use-package web-mode
  :ensure t
  :mode ("\\.jsx?$" . web-mode)
  :config
  (setq web-mode-content-types-alist
        '(("jsx" . "\\.js[x]?\\'")))    ; use jsx mode even for normal javascript
  (flycheck-add-mode 'javascript-eslint 'web-mode))

(use-package js2-mode
  :ensure t)

;; (use-package json-mode
;;   :ensure t)

;; (use-package tern
;;   :ensure t)

;; (use-package company-tern
;;   :ensure t
;;   :config
;;   (eval-after-load 'company
;;     '(add-to-list 'company-backends #'company-tern)))

(use-package typescript-mode
  :ensure t
  :mode ("\\.tsx?$" . typescript-mode))

;; (use-package tide
;;   :ensure t
;;   :init
;;   (defun jafo/tide-hook ()
;;     (tide-setup))
;;   :config
;;   (add-hook 'typescript-mode-hook #'tide-setup))

(provide 'prog-js)
;;; prog-js.el ends here
