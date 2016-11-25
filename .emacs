(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (wombat)))
 '(ecb-layout-window-sizes
   (quote
    (("left8"
      (ecb-directories-buffer-name 0.20610687022900764 . 0.2702702702702703)
      (ecb-sources-buffer-name 0.20610687022900764 . 0.24324324324324326)
      (ecb-methods-buffer-name 0.20610687022900764 . 0.2972972972972973)
      (ecb-history-buffer-name 0.20610687022900764 . 0.16216216216216217)))))
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote (("/" "/"))))
 '(global-auto-revert-mode t)
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq backup-directory-alist `(("." . "~/.saves")))

(delete-selection-mode 1)

;; automatically indent when press RET
(global-set-key (kbd "RET") 'newline-and-indent)
;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
;; show unnecessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))
;; set appearance of a tab that is represeted by 4 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;; set basic offset to 4 spaces
(setq-default c-basic-offset 4)

(global-linum-mode 1)
(show-paren-mode 1)

;; Load emacs package makers
(require 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
		  ("elpa" . "http://tromey.com/elpa/")
		  ("melpa" . "http://melpa.milkbox.net/packages/")))
  (add-to-list 'package-archives source t))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))
(defvar tmtxt/packages
  '(ecb))
(dolist (p tmtxt/packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'ecb)

(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
  (when (and opam-share (file-directory-p opam-share))
    ;; Register Merlin
    (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
    (autoload 'merlin-mode "merlin" nil t nil)
    ;; Automatically start it in OCaml buffers
    (add-hook 'tuareg-mode-hook 'merlin-mode t)
    (add-hook 'caml-mode-hook 'merlin-mode t)
    ;; Use opam switch to lookup ocamlmerlin binary
    (setq merlin-command 'opam)))

(require 'clang-format)
(add-hook 'c++-mode
          '(lambda ()
             (local-set-key (kbd "C-<tab>") 'clang-format-region)
             )
          )
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(load-file "/opt/proof-general/generic/proof-site.el")
(setq coq-prog-name "/usr/bin/coqtop")

(add-hook 'tuareg-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c a") 'insert-arrow)
             )
          )

(defun insert-arrow ()
  "Insert arrow."
  (interactive)
  (insert "->"))

(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))
(add-to-list 'load-path "/home/sbaxter/.opam/4.03.0/share/emacs/site-lisp")

(setq racer-rust-src-path "/usr/local/src/rustc-1.12.1/src")
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tootip-align-annotations t)

(global-company-mode)
(setq company-idle-delay 0)

(global-flycheck-mode)

(require 'spaceline-config)
(spaceline-spacemacs-theme)

(load-file "/home/sbaxter/.emacs.d/init.el")
