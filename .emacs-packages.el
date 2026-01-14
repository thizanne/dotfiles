;; lsp
;; (require 'lsp-mode)

;; Company-mode

(use-package company
  :config (global-company-mode))

;; term-keys
(use-package term-keys
  :config (term-keys-mode))

;; iedit
(use-package iedit)

;; makefile

;; Matches Makefile[.something]
(use-package emacs
  :mode ("/Makefile\\(\\..*\\)?" . makefile-mode))

;; anzu

(use-package anzu
  :config
  (set-face-attribute
   'anzu-mode-line nil
   :foreground "green"
   :weight 'bold)
  :config (global-anzu-mode))

;; magit

(use-package magit
  :bind ("C-x g" . magit-status))

;; dune
(use-package lisp-mode
  :ensure nil ;; Natively present in emacs but not as a package? This seems to work.
  :mode "dune")

;; opam

;; ;; To automatically add opam emacs directory to the load-path
(setq opam-share
      (substring
       (shell-command-to-string "opam var share --safe")
       0 -1))
;; (setq opam-share "~/.opam/4.04.2/share")
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))

;; ocp-indent

(require 'ocp-indent)
(add-hook 'typerex-mode-hook 'ocp-setup-indent t)

;; merlin

(setq shell-file-name "/bin/sh")

(require 'merlin)

(require 'merlin-iedit)
(require 'merlin-company)

(add-hook 'tuareg-mode-hook 'merlin-mode t)
(add-hook 'caml-mode-hook 'merlin-mode t)

(add-hook 'merlin-mode-hook (lambda () (local-set-key (kbd "C-c l") 'merlin-locate-type)))

;;; Auto-completion
;; (add-to-list 'company-backends 'merlin-company-backend)
(setq merlin-use-auto-complete-mode 'easy)
(setq merlin-completion-with-doc t)
(setq merlin-command 'opam)

;; tuareg

(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)

(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
(add-to-list 'auto-mode-alist '("\\.eliom[iylp]?" . tuareg-mode))
(add-to-list 'interpreter-mode-alist '("ocamlrun" . tuareg-mode))
(add-to-list 'interpreter-mode-alist '("ocaml" . tuareg-mode))

(setq ocp-server-command "/usr/bin/ocp-wizard")
(setq ocp-theme "tuareg-like")

(require 'ocamlformat)
(add-hook 'tuareg-mode-hook
          (lambda () (add-hook 'before-save-hook #'ocamlformat-before-save)))

;; (add-hook 'tuareg-mode-hook 'lsp-deferred)

;; utop

(autoload 'utop "utop" "Toplevel for OCaml" t)
(autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
(add-hook 'tuareg-mode-hook 'utop-minor-mode)

(setq utop-command "utop -emacs -I _build")

(add-hook
 'tuareg-mode-hook
 (lambda ()
   (local-set-key (kbd "C-c C-e") 'utop-eval-phrase)
   (local-set-key (kbd "C-;") 'merlin-iedit-occurrences)
   )
 )

;; rust

(use-package rust-mode
  :custom (rust-format-on-save t)
  :hook (rust-mode . lsp-deferred))

;; auctex

(use-package tex
  :ensure auctex
  :mode "\\.hva"
  :custom
  ((setq TeX-engine 'xetex)
   (setq TeX-PDF-mode t)
   (setq TeX-auto-save t)
   (setq TeX-parse-self t)
   ;; If you often use \include or \input, you should make AUCTeX aware
   ;; of the multi-file document structure. You can do this with :
   (setq-default TeX-master nil)
  ))

;; erlang

;; (require 'erlang-start)
;; (require 'erlang-flymake)

(use-package erlang-mode
  :mode "\\.erl"
  :custom
  ((erlang-root-dir "/usr/lib/erlang")
   (exec-path (cons "/usr/lib/erlang/bin" exec-path))))

;; graphviz

(use-package graphviz-dot-mode
  :mode "\\.dot")

;; haskell

(use-package haskell-mode
  :mode "\\.xmobarrc"
  :hook (haskell-mode . turn-on-haskell-indent)
  :hook (haskell-mode . turn-on-haskell-doc-mode))

;; python

(autoload 'python-mode "python-mode.el" "Python mode." t)
(add-to-list 'auto-mode-alist '("\\.py" . python-mode))
(setq py-shell-name "python3")

(require 'flymake)
(global-set-key (kbd "C-C C-x") 'flymake-goto-next-error)

(require 'eglot)
(add-hook 'python-mode-hook 'eglot-ensure)
(add-hook 'python-mode-hook 'python-black-on-save-mode-enable-dwim)

;; ProofGeneral

;; TODO: load this properly when installed as emacs package :)

;; cc-mode

(setq c-default-style "k&r" c-basic-offset 4)

;; markdown

(use-package markdown-mode
  :mode "\\.md$")

;; pkgbuild

(use-package pkgbuild-mode
  :mode "PKGBUILD$")

;; lua

;; (add-to-list 'auto-mode-alist '("\\.lua" . lua-mode))
;; (autoload 'lua-mode "lua-mode" "Lua editing mode" t)

;; php

;;(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
;;(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

;; color-theme

(use-package solarized
  :ensure solarized-theme
  :config
  ;; (load-theme 'solarized-selenized-dark t)
  ;; TODO use less bold
  (load-theme 'solarized-dark t)
  )
