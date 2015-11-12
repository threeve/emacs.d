;;; init-markdown.el -- an emacs config

;;; Commentary:

;;; Code:

(eval-when-compile
  (require 'use-package))

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
  :mode (("\\.md$" . gfm-mode)
         ("\\.markdown$" . gfm-mode))
  :config
  (put 'gfm-mode
       'flyspell-mode-predicate #'jafo/flyspell-ignore-fenced-code-blocks)
  (put 'markdown-mode
       'flyspell-mode-predicate #'jafo/flyspell-ignore-fenced-code-blocks))

(use-package pandoc-mode
  :ensure t
  :config (add-hook 'markdown-mode-hook #'pandoc-mode))

(provide 'init-markdown)
;; init-markdown.el ends here
