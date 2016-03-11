;;; init-writing.el -- an emacs config

;;; Commentary:

;;; Code:

(use-package flyspell
  :config
  (add-hook 'text-mode-hook 'flyspell-mode)
  (add-hook 'prog-mode-hook 'flyspell-prog-mode))

(use-package writegood-mode
  :ensure t)

(use-package langtool
  :ensure t
  :config
  (setq langtool-language-tool-jar
        "/usr/local/Cellar/languagetool/3.0/libexec/languagetool-commandline.jar"))

(provide 'init-writing)
;; init-writing.el ends here
