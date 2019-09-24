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
    w3m
    lispy
    )
  )

(defun custom/init-keyfreq()
  ;; (use-package keyfreq)
  (with-eval-after-load 'keyfreq-mode)
  (use-package youdao-dictionary)
  )

(defun custom/init-w3m()
  (use-package w3m)
  )

(defun custom/init-lispy ()
  (use-package lispy
    :defer t
    :init
    (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))))

;; (defun custom/init-command-log()
;;   (with-eval-after-load 'global-command-log-mode
;;     (setq clm/log-command-exceptions* (append clm/log-command-exceptions*
;;                                               '(evil-next-visual-line
;;                                                 evil-previous-visual-line)))))
;;; packages.el ends here
