(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 '(ecb-layout-window-sizes
   (quote
    (("left8"
      (ecb-directories-buffer-name 0.20610687022900764 . 0.2702702702702703)
      (ecb-sources-buffer-name 0.20610687022900764 . 0.24324324324324326)
      (ecb-methods-buffer-name 0.20610687022900764 . 0.2972972972972973)
      (ecb-history-buffer-name 0.20610687022900764 . 0.16216216216216217)))))
 '(ecb-options-version "2.40")
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
;; use tab to indent by default
(setq-default indent-tabs-mode t)
;; set appearance of a tab that is represeted by 4 spaces
(setq-default tab-width 4)

(global-linum-mode 1)

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
(require 'yasnippet)
(yas-global-mode 1)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

(require 'clang-format)
(global-set-key (kbd "C-<tab>") 'clang-format-region)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

