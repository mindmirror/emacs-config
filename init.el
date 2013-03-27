(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add package list here
(defvar my-packages '(clojure-mode
                      paredit
                      nrepl
                      magit)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Load customizing files
(defvar emacs-dir (file-name-directory load-file-name)
  "top level emacs dir")
(defvar module-dir (concat emacs-dir "modules/")
  "My emacs configuration")

;; Add to load path
(add-to-list 'load-path module-dir)

;; Require packages in modules/
(mapc 'load (directory-files module-dir nil "^[^#].*el$"))
(server-start)
