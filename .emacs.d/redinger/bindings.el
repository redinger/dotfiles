(global-set-key (kbd "C-c f") 'find-file-in-project)

;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'eshell)

;; Start a new eshell even if one is active.
(global-set-key (kbd "C-x M") (lambda () (interactive) (eshell t)))

(global-set-key (kbd "C-c C-j") 'nrepl-jack-in)

(add-hook 'prog-mode-hook
          (defun my-kill-word-key ()
            (local-set-key (kbd "C-M-h") 'backward-kill-word)))

(global-set-key (kbd "C-x C-r") 'prefix-region)
(global-set-key (kbd "C-x C-y") 'copy-region-as-kill)

(global-set-key (kbd "M-l") 'longlines-mode)

(global-set-key (kbd "C-S-n") 'other-window)
(global-set-key (kbd "C-S-p") (lambda () (interactive) (other-window -1)))

(global-set-key (kbd "C-S-h") 'windmove-left)
(global-set-key (kbd "C-S-j") 'windmove-down)
(global-set-key (kbd "C-S-k") 'windmove-up)
(global-set-key (kbd "C-S-l") 'windmove-right)
