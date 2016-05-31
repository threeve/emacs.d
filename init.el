
;; Configure package.el to install packages from Melpa and Melpa
;; stable as well as the Org package archive. The Gnu package archive
;; is included simply to fulfill dependencies.
(require 'package)
(setq package-archives '(("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ("org" . "http://orgmode.org/elpa/")
			 ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Load literate config file
(org-babel-load-file "~/.emacs.d/Readme.org")
