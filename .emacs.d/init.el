(require 'cl)

(when (not (require 'package nil t))
  (require 'package "package-23.el"))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(when (null package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(better-defaults
                      cider
                      paredit
                      idle-highlight-mode
                      find-file-in-project
                      magit
                      elisp-slime-nav
                      ;;parenface-plus
                      parenface
                      markdown-mode
                      yaml-mode
                      diminish
                      smex
                      ido-hacks
                      rainbow-delimiters
                      exec-path-from-shell
                      ;;; color-theme
                      ;;; zenburn-theme
                      ;;; twilight-theme
                      ;;; solarized-theme
                      ;;; marmalade
                      ;;; flymake
                      ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(mapc 'load (directory-files (concat user-emacs-directory user-login-name)
                             t "^[^#].*el$"))

(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)

(require 'ido-hacks)
(ido-hacks-mode)

(global-set-key (kbd "M-x") 'smex)

(global-set-key (kbd "C-c r") 'org-capture)

(defalias 'yes-or-no-p 'y-or-n-p)

(eshell)

(with-current-buffer "*eshell*" (setq pcomplete-cycle-completions nil))
;; (set-face-foreground 'eshell-prompt "turquoise")

(server-start)
