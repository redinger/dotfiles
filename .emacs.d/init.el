(require 'package)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
 (add-to-list 'package-archives
              '("tromey" . "http://tromey.com/elpa/"))
(package-initialize)

(when (null package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit-lisp
                      starter-kit-bindings
                      starter-kit-eshell
                      starter-kit-ruby
                      clojure-mode
                      clojure-test-mode
                      color-theme
                      zenburn-theme
                      twilight-theme
                      solarized-theme
                      markdown-mode
                      yaml-mode
                      marmalade
                      find-file-in-project
                      flymake
                      magit
                      paredit
                      rinari
                      smex))

(when (require 'smex nil t)
  (global-set-key (kbd "M-x") 'smex)
  (smex-initialize))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrieve "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
                (lambda (s) (goto-char (point-max))
                  (eval-print-last-sexp))))

(el-get 'sync)

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(global-set-key (kbd "C-c r") 'org-capture)

;; fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(if window-system (set-exec-path-from-shell-PATH))

(zb)
(inconsolata 1)

(eshell)
(with-current-buffer "*eshell*" (setq pcomplete-cycle-completions nil))
(set-face-foreground 'eshell-prompt "turquoise")

(server-start)
