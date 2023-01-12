(setenv "DTK_PROGRAM" "mac")
(setq dtk-set-punctuations "none")
;; (load-file "~/.emacs.d/emacspeak/lisp/emacspeak-setup.el")

;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("gnu" . "https://elpa.gnu.org/packages/") t)
(package-initialize)
(unless package-archive-contents
    (package-refresh-contents))

;; Download Evil
(unless (package-installed-p 'evil)
    (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)

;; Download Twilight-Bright Theme
(unless (package-installed-p 'twilight-bright-theme)
    (package-install 'twilight-bright-theme))
(load-theme 'twilight-bright t)

;; Polymode
(unless (package-installed-p 'polymode)
    (package-install 'polymode))

;; Disable weird background highlight in vue-mode
(add-hook 'mmm-mode-hook
    (lambda ()
        (set-face-background 'mmm-default-submode-face nil)))

;; Customize user interface.
; (menu-bar-mode 0)
(when (display-graphic-p)
    (tool-bar-mode 0)
    (scroll-bar-mode 0))

;;; Emfy 0.1.0-dev <https://github.com/susam/emfy>

;; Customize user interface.
; (menu-bar-mode 0)
; (setq inhibit-startup-screen t)
; (column-number-mode)

; ;; Theme.
; (load-theme 'wombat)
; (set-face-background 'default "#111")
; (set-face-background 'cursor "#c96")
; (set-face-background 'isearch "#c60")
; (set-face-foreground 'isearch "#eee")
; (set-face-background 'lazy-highlight "#960")
; (set-face-foreground 'lazy-highlight "#ccc")
; (set-face-foreground 'font-lock-comment-face "#fc0")

; ;; Interactively do things.
; (ido-mode 1)
; (ido-everywhere)
; (setq ido-enable-flex-matching t)

; ;; Show stray whitespace.
; (setq-default show-trailing-whitespace t)
; (setq-default indicate-empty-lines t)
; (setq-default indicate-buffer-boundaries 'left)

; ;; Consider a period followed by a single space to be end of sentence.
; (setq sentence-end-double-space nil)

; ;; Use spaces, not tabs, for indentation.
; (setq-default indent-tabs-mode nil)

; ;; Display the distance between two tab stops as 4 characters wide.
; (setq-default tab-width 4)

; ;; Indentation setting for various languages.
; (setq c-basic-offset 4)
; (setq js-indent-level 2)
; (setq css-indent-offset 2)

; ;; Highlight matching pairs of parentheses.
; (setq show-paren-delay 0)
; (show-paren-mode)

; ;; Write auto-saves and backups to separate directory.
; (make-directory "~/.emacs.d/backup/" t)
; (setq auto-save-file-name-transforms '((".*" "~/.emacs.d/backup/" t)))
; (setq backup-directory-alist '(("." . "~/.emacs.d/backup/margo/")))

; ;; Disable lockfiles.
; (setq create-lockfiles nil)

; ;; Workaround for https://debbugs.gnu.org/34341 in GNU Emacs <= 26.3.
; (when (and (version< emacs-version "26.3") (>= libgnutls-version 30603))
;   (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

; ;; Write customizations to ~/.emacs.d/custom.el instead of this file.
; (setq custom-file "~/.emacs.d/custom.el")

; ;; Install packages.
; (setq package-list '(markdown-mode paredit rainbow-delimiters))
; (dolist (package package-list)
;   (unless (package-installed-p package)
;     (package-install package)))

; ;; Enable Paredit.
; (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
; (add-hook 'eval-expression-minibuffer-setup-hook 'enable-paredit-mode)
; (add-hook 'ielm-mode-hook 'enable-paredit-mode)
; (add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
; (add-hook 'lisp-mode-hook 'enable-paredit-mode)

; ;; Enable Rainbow Delimiters.
; (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
; (add-hook 'ielm-mode-hook 'rainbow-delimiters-mode)
; (add-hook 'lisp-interaction-mode-hook 'rainbow-delimiters-mode)
; (add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)

; ;; Customize Rainbow Delimiters.
; (require 'rainbow-delimiters)
; (set-face-foreground 'rainbow-delimiters-depth-1-face "#c66")  ; red
; (set-face-foreground 'rainbow-delimiters-depth-2-face "#6c6")  ; green
; (set-face-foreground 'rainbow-delimiters-depth-3-face "#69f")  ; blue
; (set-face-foreground 'rainbow-delimiters-depth-4-face "#cc6")  ; yellow
; (set-face-foreground 'rainbow-delimiters-depth-5-face "#6cc")  ; cyan
; (set-face-foreground 'rainbow-delimiters-depth-6-face "#c6c")  ; magenta
; (set-face-foreground 'rainbow-delimiters-depth-7-face "#ccc")  ; light gray
; (set-face-foreground 'rainbow-delimiters-depth-8-face "#999")  ; medium gray
; (set-face-foreground 'rainbow-delimiters-depth-9-face "#666")  ; dark gray

; ;; Custom command.
; (defun show-current-time ()
;   "Show current time for 2 seconds."
;   (interactive)
;   (message (current-time-string))
;   (sleep-for 2)
;   (message nil))

; ;; Custom key-binding.
; (global-set-key (kbd "C-c t") 'show-current-time)

; ;; Start server.
; (require 'server)
; (unless (server-running-p)
;   (server-start))

;; Ewal
; (unless (package-installed-p 'ewal)
;     (package-install 'ewal))

; (setq ewal-built-in-palette "sexy-material")

;; Agda?
; (load-file (let ((coding-system-for-read 'utf-8))
;                 (shell-command-to-string "agda-mode locate")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3263bd17a7299449e6ffe118f0a14b92373763c4ccb140f4a30c182a85516d7f" "e7ba99d0f4c93b9c5ca0a3f795c155fa29361927cadb99cfce301caf96055dfd" default))
 '(package-selected-packages
   '(haskell-mode haskell-emacs exotica-theme twilight-theme ## p vue-mode twilight-bright-theme rainbow-delimiters paredit markdown-mode ewal evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
