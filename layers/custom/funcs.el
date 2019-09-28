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


(defun create-word-card (word result)
  (let ((fields `(("正面" . ,word)
<<<<<<< HEAD
                  ("背面" . ,result))))
=======
                  ("反面" . ,result))))
>>>>>>> 74e0f2203c95dba27c660606a815c0bb548c324b
    (anki-editor--push-note
     `((deck . "word")
       (note-id . -1)
       (note-type . "basic")
       (fields . ,fields)))))

;; TODO 不处理中文
(defun create-card-with-point-word ()
  (interactive)
<<<<<<< HEAD
  (let* ((string (thing-at-point 'word))
        (result (youdao-dictionary--format-result string)))
    (create-word-card string (replace-regexp-in-string "\n" "<br>" result))))

(defalias 'cc 'create-card-with-point-word)
(defalias 'fy 'youdao-dictionary-search-at-point+)
=======
  (let ((string (thing-at-point 'word)))
    (let ((result (youdao-dictionary--format-result string)))
      (popup-tip result)
      (create-word-card string result))))

(defalias 'cc 'create-card-with-point-word)
(popup-tip "hello"dd)
>>>>>>> 74e0f2203c95dba27c660606a815c0bb548c324b


(defun avy-goto-word-fanyi ()
  (interactive)
  (avy-goto-word-or-subword-1)
  (youdao-dictionary-search-at-point+))

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
