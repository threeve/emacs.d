
;; Set up package.el
;; This needs to be in init.el before requiring config.org, otherwise
;; it gets inserted in here automaticlly anyway.

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)


;; Load literate config file

(org-babel-load-file "~/.emacs.d/config.org")
