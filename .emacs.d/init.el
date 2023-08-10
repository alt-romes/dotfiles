(setenv "DTK_PROGRAM" "mac")
(setq dtk-set-punctuations "none")
;; (load-file "~/.emacs.d/emacspeak/lisp/emacspeak-setup.el")

;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;; Evil
(unless (package-installed-p 'evil) (package-install 'evil))
(require 'evil)
(evil-mode 1)

;; org-roam
(unless (package-installed-p 'org-roam) (package-install 'org-roam))

;; Polymode
(unless (package-installed-p 'polymode) (package-install 'polymode))

;; Customize user interface.
; (menu-bar-mode 0)??
(when (display-graphic-p) (tool-bar-mode 0) (scroll-bar-mode 0))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
; (add-to-list 'default-frame-alist '(ns-appearance . dark))

;; Buffer encoding
;(prefer-coding-system       'utf-8)
;(set-default-coding-systems 'utf-8)
;(set-terminal-coding-system 'utf-8)
;(set-keyboard-coding-system 'utf-8)
;(set-language-environment   'utf-8)

;; Font
; (add-to-list 'default-frame-alist '(font . "Iosevka" ))

;; Ewal
; (unless (package-installed-p 'ewal) (package-install 'ewal))

; (setq ewal-built-in-palette "sexy-material")

; Agda Mode
;; To use Unicode from \latex expressions, press <C-\> in insert mode
(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(polymode org-roam evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
