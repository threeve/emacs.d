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

(setq
 create-lockfiles nil
 make-backup-files nil)

(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-initialize))

;; my customizations
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(use-package init-ui)
(use-package init-editing)
(use-package init-evil)
(use-package init-ido)
(use-package init-writing)

;; additional packages

(use-package magit
  :ensure t
  :config
  (setq magit-push-always-verify nil)
  (define-key evil-normal-state-map (kbd "<SPC> g") 'magit-status))

(use-package git-gutter
  :ensure t
  :config
  (setq git-gutter:ask-p nil)
  (define-key evil-normal-state-map "]h" 'git-gutter:next-hunk)
  (define-key evil-normal-state-map "[h" 'git-gutter:previous-hunk)
  (define-key evil-normal-state-map (kbd "<SPC> h s") 'git-gutter:stage-hunk)
  (global-git-gutter-mode))

(defun jafo/flyspell-ignore-fenced-code-blocks ()
  "excludes code within a markdown fenced code block from flyspell"
  (save-excursion
    (widen)
    (let ((p (point))
          (count 0))
      (not (or (and (re-search-backward "^[ \t]*```" nil t)
                    (> p (point))
                    (or (not (re-search-forward "^[ \t]*```" nil t))
                        (< p (point))))
               (eq 1 (progn (while (re-search-backward "`" (line-beginning-position) t)
                              (setq count (1+ count)))
                            (- count (* 2 (/ count 2))))))))))

(use-package markdown-mode
  :ensure t
  :mode ("\\.md$" . gfm-mode)
  :config
  (put 'gfm-mode 'flyspell-mode-predicate 'jafo/flyspell-ignore-fenced-code-blocks))

(use-package mmm-mode
  :ensure t
  :diminish mmm-mode
  :config
  (setq mmm-global-mode 'maybe
        mmm-submode-decoration-level 0)
  (mmm-add-classes
   '((markdown-objc
      :submode objc-mode
      :front "^\\([ \t]*```\\)objc\n"
      :back "^~1$"
      :save-matches t
      :end-not-begin t)))
  (mmm-add-mode-ext-class 'gfm-mode nil 'markdown-objc))

(provide 'init)
;;; init.el ends here
