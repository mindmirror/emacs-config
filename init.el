(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time

(require 'cask "~/cask/cask.el")
(cask-initialize)
(require 'pallet)

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

(add-hook 'after-init-hook
	  (lambda ()
	    (message "init completed in %.2fms"
		     (sanityinc/time-subtract-millis after-init-time before-init-time))))

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
