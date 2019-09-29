;;; escape setting
(setq-default evil-escape-key-sequence "hh")
(setq-default evil-escape-delay 0.3)
;; 中文字典
(setq pyim-dicts
      '((:name "dict" :file "~/.spacemacs.d/dict/pyim-bigdict.pyim")))
;; 双拼
(setq pyim-default-scheme 'microsoft-shuangpin)

;; (add-to-list 'load-path (expand-file-name "~/.spacemacs.d/elisp"))
;; (require 'insert-translated-name)
;; (global-set-key (kbd "C-=") 'insert-translated-name-insert)

;;; org mode
(with-eval-after-load 'org
  ;; here goes your Org config :)
  ;; ....

  ;; (add-to-list 'org-modules 'org-protocol)
  (setq org-log-done 'time)
  (setq org-default-notes-file "~/org/inbox.org")
  ;; (setq org-ellipsis "⤵")
  (setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))
  (setq org-id-link-to-org-use-id 'create-if-interactive)
  (setq org-log-done 'time)
  (setq org-agenda-start-on-weekday 0)


  (setq org-journal-dir "~/org/journal/")

  (setq org-todo-keywords
        '((sequence "TODO(t!)" "NEXT(n!)" "STARTED(a!)" "WAIT(w@/!)" "OTHERS(o!)" "|" "DONE(d)" "CANCELLED(c)")))

  ;; http://www.zmonster.me/2018/02/28/org-mode-capture.html
  (setq org-capture-templates
        '(("t" "Task")
          ("tw" "Work Task" entry (file+headline "~/org/tasks.org" "Work") "* TODO%^{任务名}\n%u\n%a\n" :clock-in t :clock-resume t)
          ("tr" "Book Reading Task" entry (file+olp "~/org/tasks.org" "Reading" "Book") "* TODO %^{书名}\n%u\n%a\n" :clock-in t :clock-resume t)
          ;; ("w" "Web Collections" entry (file+headline "~/org/inbox.org" "Web") "* %U %:annotation\n\n%:initial\n\n%?")
          ("N" "Note/Data" entry (file+headline "~/org/inbox.org" "Note") "* %:annotation \n\n  Source: %u \n\n %i\n\n ") 
          ("n" "Note/Data" entry (file+headline "~/org/inbox.org" "Note") "* %? \n\n  Source: %u \n\n %i\n\n " ) 
          ("j" "Journal" entry (file+datetree "~/org/journal.org") "* %U - %^{heading}\n  %?")
          ("i" "Inbox" entry (file "~/org/inbox.org") "* %U - %^{heading} %^g\n %?\n")
          ;; ("n" "Notes" entry (file "~/org/inbox.org") "* %^{heading} %t %^g\n  %?\n")
          ("J" "Work-Journal" entry (file+datetree "~/org/wjournal.org") "* %?\nEntered on %U\n %i\n %a")
          ("W" "word" entry (file "~/org/word.org" ) "* %^{word}%i" :immediate-finish 1)
          ("w" "Word" entry (file+headline "~/org/word.org" "Words") "* %?\n")))

  (setq org-agenda-files
        (list
         "~/org/inbox.org"
         "~/org/word.org"
         "~/org/email.org"
         "~/org/tasks.org"
         "~/org/wtasks.org"
         ;; "~/org/journal.org"
         ;; "~/org/wjournal.org"
         "~/org/kb.org"
         "~/org/wkb.org"))

  (setq org-agenda-text-search-extra-files
        (list "~/org/someday.org" "~/org/config.org"))

  (setq org-refile-targets '((nil :maxlevel . 2)
                             (org-agenda-files :maxlevel . 2)
                             ("~/org/someday.org" :maxlevel . 2)
                             ("~/org/templates.org" :maxlevel . 2)))

  (setq org-outline-path-complete-in-steps nil) ; Refile in a single go
  (setq org-refile-use-outline-path 'file)

  ;; (setq org-tag-persistent-alist
  ;;       '(("@phone" . ?p)
  ;;         ("@computer" . ?c)
  ;;         ("@websurfing" . ?w)
  ;;         ("@errands" . ?e)
  ;;         ("@outdoors" . ?o)
  ;;         ("MIT" . ?m)
  ;;         ("BIGROCK" . ?b)
  ;;         ("CONTACTS" . ?C)
  ;;         ("INBOX" . ?i)
  ;;         ))

  )

;;; org mobile
(setq org-mobile-directory "~/mobile")

(setq org-mobile-inbox-for-pull "~/mobile/index.org")

;; keyfreq 
(setq keyfreq-excluded-commands
      '(self-insert-command
        abort-recursive-edit
        ace-jump-done
        ace-jump-move
        ace-window
        avy-goto-line
        backward-char
        backward-kill-word
        backward-word
        clipboard-kill-ring-save
        comint-previous-input
        comint-send-input
        company-complete-common
        company-complete-number
        company-complete-selection
        company-ignore
        delete-backward-char
        describe-variable
        dired                           ; nothing to optimize in dired
        dired-do-async-shell-command
        dired-find-file
        diredp-next-line
        diredp-previous-line
        electric-pair-delete-pair
        erase-message-buffer
        eval-buffer
        evil-a-WORD
        evil-append
        evil-backward-char
        evil-backward-word-begin
        evil-change
        evil-change-line
        evil-complete-next
        evil-complete-previous
        evil-delete
        evil-delete-backward-char-and-join
        evil-delete-char
        evil-delete-line
        evil-emacs-state
        evil-end-of-line
        evil-escape-emacs-state
        evil-escape-insert-state
        evil-escape-isearch
        evil-escape-minibuffer
        evil-escape-motion-state
        evil-escape-visual-state
        evil-ex
        evil-ex-command
        evil-ex-completion
        evil-ex-delete-backward-char
        evil-exit-emacs-state
        evil-exit-visual-state
        evil-filepath-inner-text-object
        evil-filepath-outer-text-object
        evil-find-char
        evil-find-char-to
        evil-first-non-blank
        evil-force-normal-state
        evil-forward-char
        evil-forward-word-begin
        evil-forward-word-end
        evil-goto-definition
        evil-goto-first-line
        evil-goto-line
        evil-goto-mark-line
        evil-indent
        evil-inner-WORD
        evil-inner-double-quote
        evil-inner-single-quote
        evil-inner-word
        evil-insert
        evil-join
        evil-jump-backward
        evil-jump-forward
        evil-mc-make-and-goto-next-match
        evil-next-line
        evil-next-visual-line
        evil-normal-state
        evil-open-below
        evil-paste-after
        evil-paste-before
        evil-previous-line
        evil-previous-visual-line
        evil-record-macro
        evil-repeat
        evil-replace
        evil-ret
        evil-scroll-page-down
        evil-scroll-page-up
        evil-search-forward
        evil-search-next
        evil-search-word-forward
        evil-set-marker
        evil-substitute
        evil-visual-block
        evil-visual-char
        evil-visual-line
        evil-yank
        exit-minibuffer
        ffip
        forward-char
        forward-word
        gnus
        gnus-summary-exit
        gnus-summary-next-page
        gnus-summary-scroll-up
        gnus-topic-select-group
        goto-line
        hippie-expand
        ido-complete
        ido-delete-backward-updir
        ido-exit-minibuffer
        ido-switch-buffer
        indent-new-comment-line
        isearch-abort
        isearch-backward-regexp
        isearch-cancel
        isearch-delete-char
        isearch-exit
        isearch-forward-regexp
        isearch-other-control-char
        isearch-other-meta-char
        isearch-printing-char
        isearch-repeat-forward
        isearch-ring-retreat
        ispell-minor-check
        ivy-backward-delete-char
        ivy-backward-kill-word
        ivy-done
        ivy-next-line
        ivy-occur
        ivy-occur-next-line
        ivy-occur-press-and-switch
        ivy-occur-previous-line
        ivy-previous-line
        ivy-wgrep-change-to-wgrep-mode
        js-mode
        js2-line-break
        keyboard-escape-quit
        keyboard-quit
        keyfreq-mode
        keyfreq-save-now
        keyfreq-show
        kill-sentence
        left-char
        markdown-exdent-or-delete
        markdown-outdent-or-delete
        minibuffer-complete
        minibuffer-complete-and-exit
        minibuffer-keyboard-quit
        move-beginning-of-line
        move-end-of-line
        mwheel-scroll
        my-setup-develop-environment
        newline-and-indent
        next-history-element
        next-line
        org-beginning-of-line
        org-ctrl-c-ctrl-c
        org-cycle
        org-delete-backward-char
        org-end-of-line
        org-force-self-insert
        org-return
        org-self-insert-command
        org-todo
        orgtbl-self-insert-command
        package-menu-execute
        paredit-backward-delete
        paredit-backward-kill-word
        paredit-close-round
        paredit-doublequote
        paredit-newline
        paredit-open-round
        paredit-semicolon
        pcomplete
        previous-history-element
        previous-line
        push-button
        pwd
        quit-window
        right-char
        rjsx-electric-gt
        rjsx-electric-lt
        save-buffer
        save-buffers-kill-terminal
        scroll-down-command
        scroll-up-command
        select-window-0
        select-window-1
        select-window-2
        select-window-3
        select-window-4
        select-window-5
        select-window-6
        select-window-7
        select-window-8
        select-window-9
        self-insert-command
        smarter-move-beginning-of-line
        suspend-frame
        term-send-raw
        turnon-keyfreq-mode
        undefined ;; lambda function
        undo-tree-redo
        undo-tree-undo
        w3m-goto-url
        w3m-next-anchor
        w3m-view-this-url
        web-mode
        web-mode-complete
        web-mode-jshint
        web-mode-navigate
        web-mode-part-beginning
        web-mode-reload
        web-mode-reveal
        web-mode-surround
        web-mode-tag-beginning
        web-mode-test
        wgrep-finish-edit
        xterm-paste
        yank
        yas-compile-directory
        yas-expand
        yas-next-field-or-maybe-expand))
