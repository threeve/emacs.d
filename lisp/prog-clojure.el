;;; prog-clojure.el --- clojure config
;;; Commentary:
;;; Code:

(eval-when-compile
  (require 'use-package))

(use-package cider
  :ensure t
  :config
  (setq cider-repl-result-prefix ";; => "
        cider-repl-use-clojure-font-lock t
        cider-repl-use-pretty-printing t)
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'eldoc-mode))

(use-package flycheck-clojure
  :ensure t
  :config
  (eval-after-load 'flycheck '(flycheck-clojure-setup)))

(use-package clj-refactor
  :ensure t
  :config
  (add-hook 'clojure-mode '(clj-refactor-mode t)))

(provide 'prog-clojure)
;;; prog-clojure.el ends here
