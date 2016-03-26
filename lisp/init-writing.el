;;; init-writing.el -- an emacs config

;;; Commentary:

;;; Code:

(use-package flyspell
  :diminish ""
  :config
  (add-hook 'text-mode-hook 'flyspell-mode)
  (add-hook 'prog-mode-hook 'flyspell-prog-mode))

(use-package writegood-mode
  :ensure t
  :commands writegood-mode)

(use-package langtool
  :ensure t
  :commands langtool-check
  :init
  (setq langtool-language-tool-jar
        "/usr/local/Cellar/languagetool/3.2/libexec/languagetool-commandline.jar"))

(provide 'init-writing)
;;; init-writing.el ends here
