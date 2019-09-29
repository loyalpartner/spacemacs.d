(defun search-org ()
  (interactive)
  (spacemacs/counsel-search (list "rg") "" "~/org"))

(global-set-key (kbd "C-SPC") 'toggle-input-method)
(spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)
(spacemacs/set-leader-keys "os" 'search-org)

(spacemacs/set-leader-keys "of" 'avy-goto-word-fanyi)

(define-key evil-normal-state-map (kbd "C-i") 'evil-jump-forward)
;; (define-key evil-insert-state-map "hd" 'toggle-input-method)


(defalias 'fy 'youdao-dictionary-search-at-point+ "docstring")
