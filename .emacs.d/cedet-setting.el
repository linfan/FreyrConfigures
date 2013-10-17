;; Use cedet
(setq byte-compile-dynamic t)
(add-to-list 'load-path "~/.emacs.d/cedet/common")
(require 'cedet)
(require 'semantic-ia)
(require 'semantic-gcc)
 
;; Enable EDE (Project Management) features
(global-ede-mode 1)
 
;; Enable CEDET features

(semantic-load-enable-minimum-features)
;(setq semantic-idle-scheduler-mode t) ; analize contain want idle
;(setq semanticdb-minor-mode t) ; save analize data
;(setq semanticdb-load-ebrowse-caches t) ; use ebrower cache

(semantic-load-enable-code-helpers)
;(setq imenu t) ; show TAGS menu
;(setq semantic-idle-summary-mode t) ; show func define at minibuffer
;(setq senator-minor-mode t) ; show Senator menu
;(setq semantic-mru-bookmark-mode t) ; enable semantic jump back

(semantic-load-enable-guady-code-helpers)
;(setq semantic-stickyfunc-mode -1) ; don't show function name at title line
;(setq semantic-decoration-mode 1) ; add line above function define
;(setq semantic-idle-completions-mode 1) ; enable completation hint

(semantic-load-enable-excessive-code-helpers)
;(setq semantic-highlight-func-mode 1) ; high light current func name
;(setq semantic-idle-tag-highlight-mode 1) ; high light occurrence of current word
;(setq semantic-decoration-mode -1) ; don't highlight include and private/protected line
;(setq which-func-mode 1) ; show current func name at mode-line

(semantic-load-enable-semantic-debugging-helpers)
;(setq semantic-highlight-edits-mode t) ; high light recently changes
;(setq semantic-show-unmatched-syntax-mode t) ; add red under line at can't analize code
;(setq semantic-show-parser-state-mode t) ; show semantic analize state at state bar

;; Disable some features, No sure it works..
(global-semantic-stickyfunc-mode -1)

;; Enhance C++ semantic search
; (setq semanticdb-project-roots (list (expand-file-name "/")))
(defconst cedet-user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public"
        "../.." "../../include" "../../inc" "../../common" "../../public"))
(defconst cedet-win32-include-dirs
  (list "C:/Apps/MinGW64/include"
        "C:/Apps/MinGW64/include/c++/3.4.5"
        "C:/Apps/MinGW64/include/c++/3.4.5/mingw32"
        "C:/Apps/MinGW64/include/c++/3.4.5/backward"
        "C:/Apps/MinGW64/lib/gcc/x86_64-w64-mingw32/4.6.1/include"
;        "C:/Program Files/Microsoft Visual Studio/VC98/MFC/Include"
))
(require 'semantic-c nil 'noerror)
(let ((include-dirs cedet-user-include-dirs))
  ;; Only include in windows
  (when (eq system-type 'windows-nt)
    (setq include-dirs (append include-dirs cedet-win32-include-dirs)))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))

;; Set semantic jump shortcut
(defun semantic-ia-fast-jump-back ()
  (interactive)
  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
      (error "Semantic Bookmark ring is currently empty"))
  (let* ((ring (oref semantic-mru-bookmark-ring ring))
         (alist (semantic-mrub-ring-to-assoc-list ring))
         (first (cdr (car alist))))
    (if (semantic-equivalent-tag-p (oref first tag) (semantic-current-tag))
        (setq first (cdr (car (cdr alist)))))
    (semantic-mrub-switch-tags first)))

(global-set-key [f12] 'semantic-ia-fast-jump) ; jump
(global-set-key [S-f12] 'semantic-ia-fast-jump-back) ; jump back
(global-set-key [M-S-f12] 'semantic-analyze-proto-impl-toggle) ; jump between implementation and declaration

;; Use M-n for code complete
(if window-system
  (define-key c-mode-base-map (kbd "M-n") 'semantic-ia-complete-symbol-menu) ; for gui
  (define-key c-mode-base-map (kbd "M-n") 'semantic-ia-complete-symbol)) ; for console

;; Use project menu
;(global-ede-mode t)

;; Enable visual bookmark, F2 set/unset bookmark, C-F2 next bookmark, S-F2 previous bookmark, C-S-F2 clean all bookmark
(enable-visual-studio-bookmarks)

;; Use semantic folding, in gui only
(when (and window-system (require 'semantic-tag-folding nil 'noerror))
  (global-semantic-tag-folding-mode 1)
  (global-set-key (kbd "C-?") 'global-semantic-tag-folding-mode)
  (define-key semantic-tag-folding-mode-map (kbd "M-_") 'semantic-tag-folding-fold-block)
  (define-key semantic-tag-folding-mode-map (kbd "M-+") 'semantic-tag-folding-show-block)
  (define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-all)
  (define-key semantic-tag-folding-mode-map (kbd "C-c , +") 'semantic-tag-folding-show-all))

;; Enable SRecode (Template management) minor-mode.
(global-srecode-minor-mode 1)

(provide 'cedet-setting)
