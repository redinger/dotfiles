(defalias 'ff 'find-file)

(setq custom-safe-themes
      '("71b172ea4aad108801421cc5251edb6c792f3adbaecfa1c52e94e3d99634dee7" default))

(global-hl-line-mode 1)
(global-linum-mode 1)

(defun inconsolata (size)
  (interactive "p")
  (set-default-font
   (concat "-unknown-Inconsolata-normal-normal-normal-*-"
           (if (stringp size) size
             (if (= 1 size) "18"
               (read-from-minibuffer "Size: ")))
           "-*-*-*-m-0-*-*")))

(defun terminus (size)
  (interactive "p")
  (set-default-font
   (concat "-xos4-Terminus-normal-normal-normal-*-"
           (if (stringp size) size
             (if (= 1 size) "14"
               (read-from-minibuffer "Size: ")))
           "-*-*-*-c-80-iso10646-1")))

(set-face-foreground 'vertical-border "white")
(set-face-background 'vertical-border "white")

(defun zb ()
  (load-theme 'zenburn))

(defun tw ()
    (load-theme 'twilight))

(defun bb ()
  "Black for use with glasstty in -nw"
  (interactive)
  (set-face-background 'vertical-border "bright green")
  (set-face-foreground 'vertical-border "bright green")
  (eval-after-load 'magit
    '(set-face-background 'magit-item-highlight "black")))

(fset 'yes-or-no-p 'y-or-n-p)

(blink-cursor-mode t)
(show-paren-mode t)

(defun increase-font-size ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (ceiling (* 1.10
                                  (face-attribute 'default :height)))))
(defun decrease-font-size ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (floor (* 0.9
                                (face-attribute 'default :height)))))


(global-set-key (kbd "C-+") 'increase-font-size)
(global-set-key (kbd "C--") 'decrease-font-size)
(global-set-key (kbd "C-M-u") (lambda () (interactive) (enlarge-window 5)))
(global-set-key (kbd "C-M-o") (lambda () (interactive) (enlarge-window 5 t)))

(defun set-cursor-type (cursor)
 "Modify the cursor to the specified type"
 (interactive "sCursor type (bar, box, etc.): ")
 (modify-frame-parameters
  (selected-frame)
  (list (cons 'cursor-type (intern cursor)))))

(defun set-bar-cursor ()
 "Change the cursor to a bar rather than the (default) box"
 (interactive)
 (set-cursor-type "bar"))

(defun set-box-cursor ()
 "Change the cursor to a box (the default style)"
 (interactive)
 (set-cursor-type "box"))

(set-bar-cursor)

(icomplete-mode 1)
(setq completion-ignore-case 1)
(setq show-trailing-whitespace t)
(set-default 'fill-column 80)
