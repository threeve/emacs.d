;;; init-editing.el -- an emacs config

;;; Commentary:

;;; Code:

(eval-when-compile
  (require 'use-package))

(use-package editorconfig
  :ensure t)

(setq
 require-final-newline t)

(setq-default
 indent-tabs-mode nil)

(auto-save-mode 0)

(provide 'init-editing)
;; init-editing.el ends here
