;;; https://www.youtube.com/watch?v=k78f8NYYIto
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

					; list-packages
					; search elpy
					; i -> x to install


;;; entry point -> https://github.com/jorgenschaefer/elpy
;; sudo apt-get install python3-pip
;; sudo pip3 install jedi flake8 importmagic autopep8
(elpy-enable)
(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3")

(require 'company)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

;; example of global key bindings
;; google search for helm-swoop and see the readme !!
(add-to-list 'load-path "~/.emacs.d/helm-swoop")
(require 'helm-swoop)
(global-set-key (kbd "M-i") 'helm-swoop)

;;;;;;;;;;;;;;;;;;;;;;
;; Helm
(require 'helm)
(require 'helm-config)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
;; C-x r m  save book mark
(global-set-key (kbd "C-x r b") 'helm-bookmarks)
(global-set-key (kbd "C-x m") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;;;;;;;;;;;;;;; another guy
;;; https://www.youtube.com/watch?v=HTUE03LnaXA
(require 'auto-complete)
;; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
(require 'yasnippet)
(yas-global-mode 1)
;;; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/local/include")
  )
; now let's call this frunction from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)
; get the include search directories by
; gcc -xc++ -E -v -


(define-key global-map (kbd "C-c ;") 'iedit-mode)


;;;
;;; flymake-google-cpplint, flaymake-cursor-mode , google-c-style 
;;; (add-hook 'after-init-hook #'global-flycheck-mode)

(require 'rtags)
(cmake-ide-setup)

(setq path-to-ctags "/usr/bin/ctags")
(defun create-tags (dir-name)
    "Create tags file."
    (interactive "DDirectory: ")
    (shell-command
     (format "%s -f TAGS -e -R %s" path-to-ctags (directory-file-name dir-name)))
)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages
   (quote
    (rtags cmake-ide flymake-google-cpplint iedit auto-complete-c-headers auto-complete helm-swoop elpy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
