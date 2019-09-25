;;; packages.el --- custom layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author:  <li@HIROKO>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `custom-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `custom/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `custom/pre-init-PACKAGE' and/or
;;   `custom/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst custom-packages
  '(keyfreq
    lispy
    )
  )

(defun custom/init-keyfreq()
  (use-package keyfreq)
  (use-package youdao-dictionary)
  )


(defun custom/init-lispy ()
  (use-package lispy
    :defer t
    :init
    (add-hook 'emacs-lisp-mode-hook
             (lambda () ((lispy-mode 1)
                (define-key evil-insert-state-map (kbd "<delete>") nil)
                (define-key evil-insert-state-map (kbd "C-d") nil)
                (define-key evil-insert-state-map (kbd "C-k") nil)
                (define-key evil-insert-state-map (kbd "C-y") nil)
                (define-key evil-insert-state-map (kbd "C-e") nil))))))

;;; packages.el ends here
