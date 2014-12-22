(require 'clojure-mode)
(require 'clojure-mode-extra-font-locking)

(setq auto-mode-alist (cons '("\\.cljs$" . clojure-mode) auto-mode-alist))

(add-hook 'clojure-mode-hook 'inf-clojure-minor-mode)

(provide 'init-clojure)
