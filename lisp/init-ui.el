;;; init-ui.el -- an emacs config

;;; Commentary:

;;; Code:

(prefer-coding-system 'utf-8-unix)

(add-hook 'emacs-startup-hook #'toggle-frame-fullscreen)


(use-package noctilux-theme
  :ensure t
  :config (load-theme 'noctilux))

(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 120
                    :weight 'normal)

;; make emoji work, e.g. burrito: 🌯
(set-fontset-font t 'symbol
                  (font-spec :family "Apple Color Emoji"
                             :height 120)
                  nil 'prepend)

;; devicons private use area, e.g. React logo: 
;; http://vorillaz.github.io/devicons/#/main
(set-fontset-font t '(#xe600 . #xe6ff)
                  (font-spec :family "icomoon")
                  nil 'prepend)

;; FontAwesome private use area, e.g. Empire logo: 
;; https://fortawesome.github.io/Font-Awesome/
(set-fontset-font t '(#xf000 . #xf3ff)
                  (font-spec :family "FontAwesome")
                  nil 'prepend)

(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/theme 'respectful)
  (sml/setup))

(use-package which-key
  :ensure t
  :diminish ""
  :config
  (setq which-key-idle-delay 0.3)
  (which-key-mode t))

(use-package highlight-numbers
  :ensure t
  :config (add-hook 'prog-mode-hook #'highlight-numbers-mode))

(use-package rainbow-delimiters
  :ensure t
  :config (add-hook 'objc-mode-hook #'rainbow-delimiters-mode))

(use-package indent-guide
  :ensure t
  :diminish ""
  :config
  (setq indent-guide-char "│")
  (add-hook 'prog-mode-hook #'indent-guide-mode))

(setq
 blink-matching-paren t
 echo-keystrokes 0.02
 indicate-empty-lines t
 inhibit-startup-screen t
 initial-scratch-message nil
 mac-option-modifier 'none
 mac-right-command-modifier 'meta
 mouse-wheel-scroll-amount '(1 ((shift) . 5))
 ring-bell-function 'ignore
 scroll-conservatively 10000
 scroll-preserve-screen-position t
 use-dialog-box nil)

(fset 'yes-or-no-p 'y-or-n-p)
(fringe-mode '(4 . 0))
(global-hl-line-mode t)
(global-prettify-symbols-mode t)
(global-visual-line-mode 0)
(line-number-mode 0)
(scroll-bar-mode 0)
(show-paren-mode t)
(tool-bar-mode 0)

(provide 'init-ui)
;;; init-ui.el ends here
