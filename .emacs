;; custom file

;; packages

(require 'package)

(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/")
 t)

(add-to-list
 'package-archives
 '("org" . "http://orgmode.org/elpa/")
 t)

;; For term-keys
(add-to-list
 'package-archives
 '("cselpa" . "https://elpa.thecybershadow.net/packages/")
 t)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'use-package)
(setq use-package-always-ensure t)
(setq use-package-always-ensure t)
(setq use-package-verbose t)

(setq custom-file "~/.emacs-custom.el")
(load custom-file)

;; package initialisation file

(load "~/.emacs-packages.el")

;; org-mode special file

(add-hook
 'after-init-hook
 (lambda () (load "~/.emacs-org.el")))

;; global key bindings

(global-set-key (kbd "C-v") 'scroll-up-line)
(global-set-key (kbd "M-v") 'scroll-down-line)
(global-set-key (kbd "C-c ;") 'comment-region)
(global-set-key (kbd "C-c ,") 'uncomment-region)
(global-set-key (kbd "M-o") 'next-multiframe-window)
(global-set-key (kbd "M-i") 'previous-multiframe-window)

;; window look

(menu-bar-mode -1)

;; line and column

(column-number-mode 1)
(global-display-line-numbers-mode 1)

;; Distinguish camelCased words

(global-subword-mode 1)

;; Use UTF-8

(set-language-environment "UTF-8")
(setq locale-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; various global configuration

(setq font-lock-maximum-decoration t)
(setq require-final-newline t)
(setq standard-indent 4)
(setq set-mark-command-repeat-pop t)
(setq vc-follow-symlinks t)

(fset 'yes-or-no-p 'y-or-n-p)

;; whitespace

(add-hook 'before-save-hook 'whitespace-cleanup)

;; tabs are evil

(setq-default indent-tabs-mode nil)

(defun my-tabs-makefile-hook ()
  (setq indent-tabs-mode t))
(add-hook 'makefile-mode-hook 'my-tabs-makefile-hook)

;; auto fill

(setq fill-nobreak-predicate '(fill-french-nobreak-p))
(put 'downcase-region 'disabled nil)
