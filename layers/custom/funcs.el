(defun org-archive-done-tasks ()
  "将done 和 cancelled 的任务归档"
  (interactive)
  (org-map-entries 'org-archive-subtree "/CANCELLED" 'file)
  (org-map-entries 'org-archive-subtree "/DONE" 'file))

(defun fyi()
  (interactive)
  (let ((string
         (or (thing-at-point 'word)
             (read-string "Search Youdao Dictionary: " nil nil))))
    (evil-open-below 1)
    (insert (replace-regexp-in-string "* " "" (youdao-dictionary--format-result string)))
    (evil-force-normal-state)))


(defvar org-mobile-sync-timer nil)
(defvar org-mobile-sync-idle-secs (* 60 10))

(defun org-mobile-sync ()
  (interactive)
  ;; (org-mobile-pull)
  (org-mobile-push))

(defun org-mobile-sync-enable ()
  "enable mobile org idle sync"
  (interactive)
  (setq org-mobile-sync-timer
        (run-with-idle-timer org-mobile-sync-idle-secs t
                             'org-mobile-sync)));

(defun org-mobile-sync-disable ()
  "disable mobile org idle sync"
  (interactive)
  (cancel-timer org-mobile-sync-timer))
