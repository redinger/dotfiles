(eval-after-load 'whitespace
  '(diminish 'whitespace-mode))
(eval-after-load 'paredit
  '(diminish 'paredit-mode))
(eval-after-load 'elisp-slime-nav
  '(diminish 'elisp-slime-nav-mode))
(eval-after-load 'eldoc
  '(diminish 'eldoc-mode))
(eval-after-load 'diminish ; need to delay till after packages are all loaded
  '(diminish 'auto-fill-function))

(set-face-foreground 'vertical-border "white")
(set-face-background 'vertical-border "white")

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

(defun zb ()
  (interactive)
  (unless (package-installed-p 'zenburn-theme)
    (package-install 'zenburn-theme))
  (load-theme 'zenburn t)
  (set-face-background 'vertical-border "black")
  (set-face-foreground 'vertical-border "black")
  (require 'hl-line)
  (set-face-background 'hl-line "gray17")
  (eval-after-load 'magit
    '(progn (set-face-background 'magit-item-highlight "black")
            (set-face-background 'diff-refine-change "grey10")))
  (set-face-foreground 'eshell-prompt "turquoise"))

(defun tw ()
  (interactive)
  (unless (package-installed-p 'twilight-theme)
    (package-install 'twilight-theme))
  (load-theme 'twilight)
  (set-face-background 'vertical-border "black")
  (set-face-foreground 'vertical-border "black")
  (require 'hl-line)
  (set-face-foreground 'eshell-prompt "turquoise1")
  (eval-after-load 'magit
    '(progn (set-face-background 'magit-item-highlight "black")
            (set-face-background 'diff-refine-change "grey10")))
  (set-face-background 'hl-line "black"))

(defun mk ()
  (interactive)
  (unless (package-installed-p 'monokai-theme)
    (package-install 'monokai-theme))
  (load-theme 'monokai)
  (set-face-background 'vertical-border "black")
  (set-face-foreground 'vertical-border "black")
  (require 'hl-line)
  (set-face-foreground 'eshell-prompt "turquoise1")
  (set-face-background 'hl-line "black")
  (eval-after-load 'diff-mode
    '(set-face-background 'diff-refine-change "gray18"))
  (eval-after-load 'magit
    '(set-face-background 'magit-item-highlight "black")))

(defun db ()
  (interactive)
  (load-theme 'deeper-blue)
  (set-face-background 'hl-line "dark slate gray")
  (eval-after-load 'magit
    '(progn (set-face-background 'magit-item-highlight "black"))))

(defun bb ()
  "Black for use with glasstty in -nw"
  (interactive)
  (set-face-background 'vertical-border "bright green")
  (set-face-foreground 'vertical-border "bright green")
  (set-face-background 'hl-line "black")
  (eval-after-load 'magit
    '(set-face-background 'magit-item-highlight "black")))

(eval-after-load 'hl-line
  '(set-face-background 'hl-line "darkseagreen2"))

(when (and window-system (>= emacs-major-version 23))
  (let ((fontset (face-attribute 'default :fontset))
        (unifont "-gnu-unifont-medium-r-normal--13-120-75-75-c-0-iso10646-1"))
    (mapc
     (lambda (x)
       (set-fontset-font fontset (car x) (cdr x) nil))
     `(((#x02000 . #x026ff) . ,unifont )
       ((#x0210e . #x0210f) . "Unicode")
       ((#x02700 . #x028ff) . "Unicode")
       ((#x1f300 . #x1f6ff) . "Unicode"))) ))

(blink-cursor-mode t)
(show-paren-mode t)

(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green4")
     (set-face-foreground 'magit-diff-del "red3")))

(setq ido-decorations '("\n-> " "" "\n   " "\n   ..." "[" "]"
                        " [No match]" " [Matched]" " [Not readable]"
                        " [Too big]" " [Confirm]"))

(add-hook 'ido-minibuffer-setup-hook
          (defun ido-disable-line-truncation ()
            (set (make-local-variable 'truncate-lines) nil)))

(defun jf-ido-define-keys () ;; C-n/p is more intuitive in vertical layout
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))

(add-hook 'ido-setup-hook 'jf-ido-define-keys)

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

(zb)
(inconsolata 1)
