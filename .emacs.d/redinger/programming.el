(add-hook 'prog-mode-hook 'whitespace-mode)
(add-hook 'prog-mode-hook 'idle-highlight-mode)
(add-hook 'prog-mode-hook 'hl-line-mode)
(add-hook 'prog-mode-hook (defun pnh-add-watchwords ()
                            (font-lock-add-keywords
                             nil `(("\\<\\(FIX\\(ME\\)?\\|TODO\\)"
                                    1 font-lock-warning-face t)))))


(when (<= (display-color-cells) 8)
  (defun hl-line-mode () (interactive)))

(set-default 'tab-width 4)
(set-default 'c-basic-offset 2)

;; (setq-default indent-tabs-mode nil)
;; (setq-default show-trailing-whitespace 1)

(defalias 'tdoe 'toggle-debug-on-error)

(put 'clojure-test-ns-segment-position 'safe-local-variable 'integerp)
(put 'clojure-mode-load-command 'safe-local-variable 'stringp)
(put 'clojure-swank-command 'safe-local-variable 'stringp)

(add-hook 'nrepl-connected-hook
          (defun pnh-clojure-mode-eldoc-hook ()
            (add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)))

(setq clojure-swank-command "lein jack-in %s"
      inferior-lisp-command "lein repl"
      whitespace-style '(face trailing lines-tail tabs))

(add-hook 'clojure-mode-hook 'paredit-mode)

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'elisp-slime-nav-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

(define-key emacs-lisp-mode-map (kbd "C-c v") 'eval-buffer)

(define-key read-expression-map (kbd "TAB") 'lisp-complete-symbol)
(define-key lisp-mode-shared-map (kbd "RET") 'reindent-then-newline-and-indent)


(eval-after-load 'java-mode
  '(define-key java-mode-map (kbd "C-M-h") 'backward-kill-word))

(defun find-grep-in-project (command-args)
  (interactive
   (progn
     (list (read-shell-command "Run find (like this): "
                               '("git ls-files -z | xargs -0 egrep -nH -e " . 41)
                               'grep-find-history))))
  (when command-args
    (let ((null-device nil)) ; see grep
      (grep command-args))))

(defun eshell/export-env (&optional env-file)
  (interactive)
  (let ((original-buffer (current-buffer)))
    (with-temp-buffer
      (insert-file (or env-file ".env"))
      (goto-char (point-min))
      (while (< (point) (point-max))
        (let ((line (substring (thing-at-point 'line) 0 -1)))
          (with-current-buffer original-buffer
            (eshell/export line)))
        (next-line)))))

(defalias 'eshell/ee 'eshell/export-env)

(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\.dtm$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\.edn$" . clojure-mode))

(global-linum-mode)
