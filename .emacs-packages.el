;; lsp
;; (require 'lsp-mode)

;; Company-mode

(add-hook
 'after-init-hook
 'global-company-mode
 )

;; term-keys
(require 'term-keys)
(term-keys-mode t)

;; iedit
(require 'iedit)

;; makefile

;; Matches Makefile[.something]
(add-to-list 'auto-mode-alist '("/Makefile\\(\\..*\\)?" . makefile-mode))

;; anzu

(require 'anzu)
(global-anzu-mode t)

(set-face-attribute
 'anzu-mode-line nil
 :foreground "green"
 :weight 'bold
 )

;; magit

(global-set-key (kbd "C-x g") 'magit-status)

;; dune
(autoload 'lisp-mode "lisp" "Major mode for editing Lisp code" t)
(add-to-list 'auto-mode-alist '("dune" . lisp-mode))

;; opam

;; ;; To automatically add opam emacs directory to the load-path
(setq opam-share
      (substring
       (shell-command-to-string "opam var share 2> /dev/null")
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

(require 'rust-mode)
(setq rust-format-on-save t)

(add-hook 'rust-mode-hook 'lsp-deferred)

;; auctex

(load "auctex.el" nil t t)
;;(load "preview-latex.el" nil t t)

(add-to-list 'auto-mode-alist '("\\.hva" . tex-mode))

(setq TeX-engine 'xetex)
(setq TeX-PDF-mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
;; If you often use \include or \input, you should make AUCTeX aware
;; of the multi-file document structure. You can do this with :
(setq-default TeX-master nil)

;; erlang

;; (require 'erlang-start)
;; (require 'erlang-flymake)

(add-to-list 'auto-mode-alist '("\\.erl" . erlang-mode))

(setq erlang-root-dir "/usr/lib/erlang")
(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))

;; graphviz

(autoload 'graphviz-dot-mode "graphviz-dot-mode.el" "graphviz dot mode." t)
(add-to-list 'auto-mode-alist '("\\.dot" . graphviz-dot-mode))

;; haskell

(add-to-list 'auto-mode-alist '("\\.xmobarrc" . haskell-mode))
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)

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

(autoload
  'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

;; pkgbuild

(require 'pkgbuild-mode)
(add-to-list 'auto-mode-alist '("PKGBUILD$" . pkgbuild-mode))

;; lua

;; (add-to-list 'auto-mode-alist '("\\.lua" . lua-mode))
;; (autoload 'lua-mode "lua-mode" "Lua editing mode" t)

;; php

;;(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
;;(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

;; color-theme

;; (require 'color-theme)
;; (color-theme-initialize)

(add-to-list 'custom-theme-load-path "~/config/emacs-color-theme-solarized")
(load-theme 'solarized t)
