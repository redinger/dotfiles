(setq ns-function-modifier 'hyper) ; set Mac's Fn key to type Hyper

(global-set-key (kbd "C-c f") 'find-file-in-project)

(add-hook 'prog-mode-hook
          (defun my-kill-word-key ()
            (local-set-key (kbd "C-M-h") 'backward-kill-word)))

(global-set-key (kbd "C-M-h") 'backward-kill-word)

(global-set-key (kbd "C-x C-i") 'imenu)

(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)

(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window 2)))

(global-set-key (kbd "C-x m") 'eshell)
(global-set-key (kbd "C-x C-m") 'shell)

;; Start a new eshell even if one is active.
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

(global-set-key (kbd "C-c q") 'join-line)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c C-h") 'inferior-lisp)
(global-set-key (kbd "C-c C-j") 'cider-connect)

(eval-after-load 'paredit
  ;; need a binding that works in the terminal
  '(progn
     (define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp)
     (define-key paredit-mode-map (kbd "M-(") 'paredit-backward-slurp-sexp)))

(global-set-key (kbd "C-x C-r") 'prefix-region)
(global-set-key (kbd "C-x C-y") 'copy-region-as-kill)

(global-set-key (kbd "M-l") 'longlines-mode)


;; Lots of experimental ways to move around windows...not sure which I like yet
(global-set-key (kbd "C-S-n") 'other-window)
(global-set-key (kbd "C-S-p") (lambda () (interactive) (other-window -1)))

(global-set-key (kbd "C-S-h") 'windmove-left)
(global-set-key (kbd "C-S-j") 'windmove-down)
(global-set-key (kbd "C-S-k") 'windmove-up)
(global-set-key (kbd "C-S-l") 'windmove-right)

(windmove-default-keybindings)

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)
