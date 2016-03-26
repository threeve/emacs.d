;;; prog-clojure.el --- clojure config
;;; Commentary:
;;; Code:

(use-package cider
  :ensure t
  :commands (cider-jack-in cider-jack-in-clojurescript)
  :config
  (setq cider-repl-result-prefix ";; => "
        cider-repl-use-clojure-font-lock t
        cider-repl-use-pretty-printing t)
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'eldoc-mode))

(use-package flycheck-clojure
  :ensure t
  :commands flycheck-clojure-setup
  :init
  (add-hook 'clojure-mode-hook '(flycheck-clojure-setup)))

(use-package clj-refactor
  :ensure t
  :commands clj-refactor-mode
  :init
  (add-hook 'clojure-mode-hook '(clj-refactor-mode t)))

(provide 'prog-clojure)
;;; prog-clojure.el ends here
