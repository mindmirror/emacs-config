;; -*- mode: Emacs-Lisp; coding: utf-8-unix -*-

;; General Setting
;; ============================================================

;; Set default directory
(if (eq system-type 'windows-nt)
    (setq default-directory "C:/"))

;; Mute the error tip sound
(setq visible-bell t)

;; Set killing ring
(setq kill-ring-max 1024)

;; Use tramp
(require 'tramp)

;; Move mouse cursor away
(mouse-avoidance-mode 'animate)

;; Show images inside Emacs
(auto-image-file-mode t)

;; Support compressed file
(auto-compression-mode t)

;; Turn off the splash
(setq inhibit-startup-message t)

;; Set fill-column
(setq-default fill-column 72)

;; Set scroll margin
(setq scroll-margin 8
      scroll-conservatively 8192)

;; Set default tab-width
(setq tab-width 4)
(setq-default tab-width 4)

;; Expand Tab
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

;; Set default major mode to Text mode
(setq default-major-mode 'text-mode)

;; Set sentence end
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil) ;; End sentence with one space

;; Show the other bracket but not jumb to it
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; Syntax highlighting
(global-font-lock-mode t)

;; Display line and column number
(setq column-number-mode t)
(setq line-number-mode t)

;; Turn tool bar off
(tool-bar-mode -1)

;; Turn menu bar off
(if (not (eq system-type 'darwin))
    (menu-bar-mode -1))
;; Turn scroll bar off
(scroll-bar-mode nil)

;; Blink cursor
(blink-cursor-mode t)

;; Indicate buffer boundaries
(setq default-indicate-buffer-boundaries 'left)

;; Display time and date
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)

;; Use y-or-n-p
(defalias 'yes-or-no-p 'y-or-n-p)

;; Highlight marked block
(setq transient-mark-mode t)

;; Alt is Alt, Command is Meta on Mac OS X
(if (eq system-type 'darwin)
    (setq mac-option-key-is-meta  nil
          mac-command-key-is-meta t
          mac-command-modifier    'meta
          mac-option-modifier     nil))

;; Backup settings
(setq backup-by-copying t                     ; don't clobber symlinks
      backup-directory-alist
      `(("." . "~/.saves")                    ; flat dir backup
        (,tramp-file-name-regexp nil))        ; don't backup tramp files
      auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t))   ; put auto-save file in temp dir
      delete-old-versions t                   ; auto delete old version
      kept-new-version 6                      ; keep most recent 6 files
      kept-old-version 2                      ; keep 2 oldest files
      version-control t)                      ; use version contro backup

;; Use session
;(add-to-list 'load-path "~/.emacs.d/site-lisp/session/")
;(require 'session)
;(add-hook 'after-init-hook 'session-initialize)

;; Use ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)
;; Hide buffers starting with an asterisk
(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*")

;; Open recent opened files
(require 'recentf)
(recentf-mode 1)
;; Bind C-x C-r with list the recent opened files function
;; The original function is open read-only file
(defun recentf-open-files-compl ()
  (interactive)
  (let* ((all-files recentf-list)
         (tocpl (mapcar (function
                         (lambda (x) (cons (file-name-nondirectory x) x))) all-files))
         (prompt (append '("File name: ") tocpl))
         (fname (completing-read (car prompt) (cdr prompt) nil nil)))
    (find-file (cdr (assoc-string fname tocpl)))))
(global-set-key [(control c)(control r)] 'recentf-open-files-compl)

;; Use ido
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ; enable fuzzy matching
;; ido M-x mode
(setq ido-execute-command-cache nil)
(defun ido-execute-command ()
  (interactive)
  (call-interactively
   (intern
    (ido-completing-read
     "M-x "
     (progn
       (unless ido-execute-command-cache
         (mapatoms (lambda (s)
                     (when (commandp s)
                       (setq ido-execute-command-cache
                             (cons (format "%S" s)
                                   ido-execute-command-cache))))))
       ido-execute-command-cache)))))
(add-hook 'ido-setup-hook
          (lambda () (setq ido-enable-flex-matching t)
            (global-set-key "\M-x" 'ido-execute-command)))

;; Use second-sel, this must be put before browse-kill-ring
;(add-to-list 'load-path "~/.emacs.d/site-lisp/second-sel/")
;(require 'second-sel)
;;(global-set-key [(control meta ?y)] 'secondary-dwim)

;; Use browse-kill-ring
;(add-to-list 'load-path "~/.emacs.d/site-lisp/browse-kill-ring/")
;(require 'browse-kill-ring)
;(browse-kill-ring-default-keybindings)

;; Use browse-kill-ring+
;(require 'browse-kill-ring+)


;; Set default font
(set-frame-font "-apple-consolas-medium-r-normal--14-*-*-*-m-*-iso10646-1")

;; Set coding system
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8-unix)
(set-language-environment 'utf-8)
;; MS windows clipboard is UTF-16LE
(if (eq system-type 'windows-nt)
    (set-clipboard-coding-system 'utf-16le-dos))


;; Bind F10 with Menu function
(global-set-key [f9] 'menu-bar-mode)

;; Set highlight-symbol
;(add-to-list 'load-path "~/.emacs.d/elpa/highlight-symbol-1.1")
;(require 'highlight-symbol)
;(global-set-key [f10] 'highlight-symbol-at-point)
;(global-set-key [f11] 'highlight-symbol-next)
;(global-set-key [f12] 'highlight-symbol-prev)

;; Let dired copy and delete directories recursively
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

;; Show buffer info
(setq frame-title-format '("" "[%b@%f] - Emacs " emacs-version))

;; Color theme
;(add-to-list 'load-path "~/.emacs.d/site-lisp/color-theme/")
;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-tangotango)

;; Set default frame
(setq default-frame-alist
      '((foreground-color . "Wheat")
        (background-color . "Black")
        (cursor-color     . "DeepSkyBlue")
        (width            . 120)
        (height           . 40)
        (font             . "-apple-consolas-medium-r-normal--14-*-*-*-m-*-iso10646-1")))

;; Darth Vada style mode line
(custom-set-faces
 '(mode-line
   ((((class color) (min-colors 88))
     (:background "DarkRed"
      :foreground "White"
      :box (:line-width -1
            :style released-button))))))

;; Set WhiteSpace
(require 'whitespace)
(setq whitespace-style
      '(tabs tab-mark trailing))
(global-set-key (kbd "\C-c w") 'whitespace-mode)
(global-set-key (kbd "\C-c \C-w") 'whitespace-mode)
