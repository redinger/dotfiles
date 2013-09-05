(setq-default save-place t)

(setq custom-file (expand-file-name "~/.emacs.d/custom.el")
      ido-handle-duplicate-virtual-buffers 2
      org-default-notes-file "~/src/redinger-dotfiles/.notes.org"
      org-completion-use-ido t
      epa-armor t
      inhibit-startup-message t)
      ido-use-virtual-buffers t

(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))

(setq auto-save-default nil)
(setq ns-pop-up-frames nil)
(setq ring-bell-function 'ignore)
(setq tab-always-indent t)
(set-language-environment "UTF-8")
(setq slime-net-coding-system 'utf-8-unix)

(column-number-mode t)

(delete-selection-mode t)

(defadvice save-buffer (before save-buffer-always activate)
  "always save buffer"
  (set-buffer-modified-p t))

(when (eq system-type 'darwin)
  (progn
    (setq grep-find-use-xargs 'exec)    ;don't use gnu xargs
    (add-to-list 'exec-path "/usr/local/bin")
    (setq ispell-program-name "aspell")))

(setq user-mail-address "redinger@gmail.com")

(setq browse-url-browser-function 'browse-url-default-macosx-browser)
(setq ffap-machine-p-known 'reject)
