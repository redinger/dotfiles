(setq org-agenda-files '("~/org/agenda.org" "~/org/gtd.org" "~/org/projects.org" "~/org/journal.org"))
(setq org-refile-targets (quote (("gtd.org" :maxlevel . 1) ("someday.org" :level . 2) ("agenda.org" :level . 2) ("projects.org" :maxlevel . 2))))
(setq org-tags-column -78)
(setq org-use-fast-todo-selection t)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)

(setq org-capture-templates
  (quote
   (("t" "todo" entry (file+headline "gtd.org" "Inbox")
     "* TODO %^{Description} %^g %?\n Added: %U")
    ("j" "Journal" entry (file+datetree "journal.org")
     "** %^{Heading}"))))

(setq org-agenda-custom-commands
      '(

        ("P" "Projects"
         ((tags "PROJECT")))

        ("H" "Office and Home Lists"
         ((agenda)
          (tags "+CATEGORY=\"Inbox\"+LEVEL=2")
          (tags-todo "OFFICE")
          (tags-todo "COMPUTER")
          (tags-todo "HOME")
          (tags-todo "COUCH")
          (tags-todo "READING")
          (tags-todo "THINKING")
          (tags "+CATEGORY=\"AGENDA\"+LEVEL>1+LEVEL<4")
          (tags-todo "-OFFICE-HOME-COUCH-COMPUTER-READING-PROJECT-THINKING-CATEGORY=\"AGENDA\"")))

        ("D" "Daily Action List"
         (
          (agenda "" ((org-agenda-ndays 1)
                      (org-agenda-sorting-strategy
                       (quote ((agenda time-up priority-down tag-up) )))
                      (org-deadline-warning-days 0)
                      ))))
        )
      )

(defun gtd ()
  (interactive)
  (find-file "/Users/redinger/org/gtd.org")
  )
;; (global-set-key (kbd "C-x C-g") 'gtd)
(add-hook 'org-agenda-mode-hook 'hl-line-mode)

(setq org-log-done "time")

(setq org-mobile-inbox-for-pull "~/org/flagged.org")
(setq org-mobile-directory "~/Dropbox/MobileOrg")


(add-to-list 'load-path "/Users/redinger/src/org-mode/lisp")
(add-to-list 'load-path "/Users/redinger/src/org-mode/contrib/lisp" t)
(require 'ox-confluence)

(setq org-startup-indented t)
