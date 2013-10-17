;; Set tab width as 4
(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
(setq tab-stop-list ())
(loop for x downfrom 40 to 1 do
      (setq tab-stop-list (cons (* x 4) tab-stop-list)))

(defconst my-c-style
  '((c-tab-always-indent        . t)
    (c-comment-only-line-offset . 0) ; Was 4
    (c-hanging-braces-alist     . ((substatement-open after)
                                   (brace-list-open)))
    (c-hanging-colons-alist     . ((member-init-intro before)
                                   (inher-intro)
                                   (case-label after)
                                   (label after)
                                   (access-label after)))
    (c-cleanup-list             . (scope-operator
                                   empty-defun-braces
                                   defun-close-semi
                                   comment-close-slash
                                   compact-empty-funcall
                                   ))
    (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                   (substatement-open . 0)
                                   (case-label        . +)  ; Add a intent before case
                                   (block-open        . 0)  ; Don't intent in begining of block
                                   (knr-argdecl-intro . -)
                                   (innamespace . 0)        ; Don't intent namespace
                                   (access-label . -)       ; Reduce private/public intent
                                   (inline-open . 0)        ; Don't intent function's brace in head file
								   (topmost-intro-cont . +)
                                   ))
                                   
    (c-echo-syntactic-information-p . t)
    )
  "My C Programming Style")

;; offset customizations not in my-c-style
(setq c-offsets-alist '((member-init-intro . ++)))

;; If at the end of a word, use tab for complete, otherwise indent
(defun freyr-indent-or-complete ()
   (interactive)
   (if (looking-at "\\>")
      (hippie-expand nil)
      (indent-for-tab-command))
 )
(global-set-key [(control tab)] 'freyr-indent-or-complete)

;; Customizations for all modes in CC Mode.
(defun my-c-mode-common-hook ()
  ;; add my personal style and set it for the current buffer
  (c-add-style "PERSONAL" my-c-style t)
  ;; other customizations
  (setq tab-width 4
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil)
  ;; we like auto-newline and hungry-delete
  ;(c-toggle-auto-hungry-state 1)
  (c-toggle-hungry-state 1)
  ;; key bindings for all supported languages.  We can put these in
  ;; c-mode-base-map because c-mode-map, c++-mode-map, objc-mode-map,
  ;; java-mode-map, idl-mode-map, and pike-mode-map inherit from it.
  (define-key c-mode-base-map "\C-m" 'c-context-line-break)
  (define-key c-mode-base-map [(tab)] 'freyr-indent-or-complete)
)

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(add-hook 'c-mode-common-hook
          (function (lambda ()
        (outline-minor-mode)
        ; can add more minor modes here
        )))

;; Auto scroll compilation buffer
(setq compilation-scroll-output t)

;; Change default compilation command
(setq compile-command "make")

;;set *.h and *.c and *.cpp files use c++ mode
(setq auto-mode-alist
      (cons '("\\.h$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.c$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.cpp$" . c++-mode) auto-mode-alist))

(provide 'cc-mode-setting)
