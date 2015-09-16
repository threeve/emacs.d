;;; init.el -- an emacs config

;;; Commentary:

;;; Code:

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(use-package evil
  :ensure t
  :config
  (evil-mode t)
  (define-key evil-normal-state-map ";" 'evil-ex))

(provide 'init)
;;; init.el ends here
