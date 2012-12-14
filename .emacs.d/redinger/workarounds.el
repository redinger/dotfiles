(setq compilation-scroll-output t ; byte-compilation fails w/o this
      ido-enable-tramp-completion nil
      vc-follow-symlinks t
      ruby-insert-encoding-magic-comment nil)

(eval-after-load 'magit
  '(ignore-errors
     (define-key magit-log-mode-map (kbd "A")
       (lambda ()
         (interactive)
         (flet ((magit-need-refresh (f)))
           (magit-cherry-pick-item))))))

(add-to-list 'load-path "~/.emacs.d/elpa/color-theme-twilight-0.1")
(autoload 'color-theme-twilight "color-theme-twilight" nil t)

(autoload 'marmalade-upload-buffer "marmalade" nil t)

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))

(autoload 'yaml-mode "yaml-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(setq-default ispell-program-name "aspell")

(setq org-export-with-toc nil)

(add-hook 'eshell-mode-hook
          '(lambda () (fmakunbound 'eshell/sudo)
             (fmakunbound 'eshell/su)))

(setq dired-use-ls-dired nil)
