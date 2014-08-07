(setq compilation-scroll-output t ; byte-compilation fails w/o this
      ido-enable-tramp-completion nil
      vc-follow-symlinks t
      ruby-insert-encoding-magic-comment nil)

(eval-after-load 'magit
  '(ignore-errors
     (define-key magit-log-mode-map (kbd "A")
       (lambda ()
         (interactive)
         (cl-flet ((magit-need-refresh (f)))
           (magit-cherry-pick-item))))))

(autoload 'marmalade-upload-buffer "marmalade" nil t)

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
;; (require 'parenface-plus)

(autoload 'yaml-mode "yaml-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(setq-default ispell-program-name "aspell")

(defalias 'byte-compile-cl-warn 'identity)

(setq org-export-with-toc nil)

(setq dired-use-ls-dired nil)

