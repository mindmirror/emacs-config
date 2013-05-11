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
    ac-nrepl
    auto-complete
    clojure-mode
    color-theme-sanityinc-tomorrow
    evil
    magit
    nlinum
    nrepl
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
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; Set up my own el-get packages
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-recipes")
(setq my-el-get-packages
      '(purple-haze-theme))
(el-get 'sync my-el-get-packages)

(add-to-list 'custom-theme-load-path (concat el-get-dir "/purple-haze-theme"))

(set-frame-parameter (selected-frame) 'alpha '(93 93))
(add-to-list 'default-frame-alist '(alpha 93 93))

;; Load customizing files
(defvar emacs-dir (file-name-directory load-file-name)
  "top level emacs dir")
(defvar module-dir (concat emacs-dir "modules/")
  "My emacs configuration")


;; Add to load path
(add-to-list 'load-path module-dir)

;; Require packages in modules/
(mapc 'load (directory-files module-dir nil "^[^#].*el$"))
(load "server")
(unless (server-running-p) (server-start))
