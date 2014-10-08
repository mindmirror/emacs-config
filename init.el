;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

;(add-to-list 'load-path user-emacs-directory)

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add package list here
(defvar my-packages
  '(
    auto-complete
    clojure-mode
    color-theme-sanityinc-tomorrow
    evil
    magit
    nlinum
    paredit
    popup
    rainbow-delimiters
    rainbow-mode
    undo-tree
    )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; Set up el-get
(add-to-list 'load-path (concat user-emacs-directory "el-get/el-get"))

(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; Load customizing files
(defvar init-dir (concat user-emacs-directory "init.d/")
  "My emacs configuration")

;; Add to load path
(add-to-list 'load-path init-dir)

;; Require packages in modules/
(mapc 'load (directory-files init-dir nil "^[^#].*el$"))
(load "server")
(unless (server-running-p) (server-start))
