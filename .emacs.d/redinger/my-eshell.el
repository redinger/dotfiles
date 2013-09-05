(eval-after-load 'esh-opt
  '(progn
     (setq eshell-cmpl-cycle-completions nil)

     (when (not (functionp 'eshell/rgrep))
       (defun eshell/rgrep (&rest args)
         "Use Emacs grep facility instead of calling external grep."
         (eshell-grep "rgrep" args t)))

     (defun eshell/cdg ()
       "Change directory to the project's root."
       (eshell/cd (locate-dominating-file default-directory ".git")))

     (defun find-grep-in-project (command-args)
       (interactive
        (progn
          (list (read-shell-command "Run find (like this): "
                                    '("git ls-files -z | xargs -0 egrep -nH -e " . 41)
                                    'grep-find-history))))
       (when command-args
         (let ((null-device nil))       ; see grep
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

     (defalias 'eshell/ee 'eshell/export-env)))
