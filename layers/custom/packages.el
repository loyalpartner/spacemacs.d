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
    anki-editor
    atomic-chrome
    (insert-translated-name-insert :location local)
    (company-english-helper :location local)
    ;; (company-tabnine)
    ))

(defun custom/init-keyfreq ()
  (use-package keyfreq)
  (use-package youdao-dictionary)
  )

(defun custom/init-anki-editor ()
  (use-package anki-editor))

(defun custom/init-lispy ()
  (use-package lispy
    :defer t
    :init
    (progn
      (add-hook 'lisp-interaction-mode-hook (lambda () (lispy-mode 1)))
      (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1))))
    :config
    (progn
      (define-key evil-insert-state-map (kbd "<delete>") nil)
      (define-key evil-insert-state-map (kbd "C-d") nil)
      (define-key evil-insert-state-map (kbd "C-k") nil)
      (define-key evil-insert-state-map (kbd "C-y") nil)
      (define-key evil-insert-state-map (kbd "C-e") nil)
      (define-key evil-insert-state-map (kbd "C-a") nil))))

(defun custom/init-atomic-chrome ()
  (use-package atomic-chrome
    :config
    (atomic-chrome-start-server)))

;; ;; https://github.com/manateelazycat/insert-translated-name
(defun custom/init-insert-translated-name-insert ()
  (use-package insert-translated-name
    :load-path
    "~/.spacemacs.d/local/insert-translated-name"
    :bind
    (("C-=" . insert-translated-name-insert))))

(defun custom/init-company-english-helper ()
  (use-package company-english-helper
    :load-path
    "~/.spacemacs.d/local/company-english-helper"
    :config
    (defalias 'tce 'toggle-company-english-helper)))


;; (defun custom/init-company-tabnine ()
;;   (use-package company-tabnine :defer t))

;; ;;; 配置company-tabnine作为company的后端
;; (defun custom/post-init-company-tabnine ()
;;   (with-eval-after-load 'company
;;     (add-to-list 'company-backends #'company-tabnine)))

;;; packages.el ends here
