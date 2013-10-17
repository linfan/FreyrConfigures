(setq load-path (cons "~/.emacs.d" load-path))

;; Load sami library
(require 'sams-lib)

;; Set emacs customize library configure file
(setq custom-file "~/.emacs.d/customize.el")
(load-file "~/.emacs.d/customize.el")

;; Cedet setting
(require 'cedet-setting)

;; Ecb setting
(add-to-list 'load-path "~/.emacs.d/ecb")
(require 'ecb-autoloads) ; Load ecb when ecb-activate called
;(require 'ecb) ;Load ecb when emacs start
(setq ecb-tip-of-the-day nil) ; Disable ECB daily hint

;; Cscope setting
(add-hook 'c-mode-common-hook
          '(lambda ()
            (require 'xcscope)))

;; Use M-f12 to jump between source/header file
(load-file "~/.emacs.d/sourcepair.el")
(define-key global-map [M-f12] 'sourcepair-load)

;; Configure sourcepair
;(setq sourcepair-source-extensions '())
;(setq sourcepair-header-extensions '())
;(setq sourcepair-private-header-suffixes '())
(setq sourcepair-source-path '( "." "../src"))
(setq sourcepair-header-path '( "." "../inc" "../include"))
(setq sourcepair-recurse-ignore '("CVS" "bin" "lib" "Obj" "Debug" "Release" ".svn"))

;; Emacs nav, use M-x nav begin navigating
(add-to-list 'load-path "~/.emacs.d/nav/")
(require 'nav)
(nav-disable-overeager-window-splitting)

;; Disable auto-fill-mode permanently
; (setq auto-fill-mode nil)
(defun auto-fill-mode(&optional arg)
  "disable the auto-fill-mode"
  )

;; Use highlight symbol
(require 'highlight-symbol)
(global-set-key (kbd "C-^") 'highlight-symbol-at-point) ; highlight current word
(global-set-key (kbd "C-*") 'highlight-symbol-next) ; search next occur of current word
(global-set-key (kbd "C-#") 'highlight-symbol-prev) ; search private occur of current word

;; Support for marking a rectangle of text with highlighting.
(require 'rect-mark)
(define-key ctl-x-map "r\C-@" 'rm-set-mark)
(define-key ctl-x-map "r\C-x" 'rm-exchange-point-and-mark)
(define-key ctl-x-map "r\C-w" 'rm-kill-region)
(define-key ctl-x-map "r\M-w" 'rm-kill-ring-save)
(define-key global-map [S-down-mouse-1] 'rm-mouse-drag-region)
(autoload 'rm-set-mark "rect-mark"
  "Set mark for rectangle." t)
(autoload 'rm-exchange-point-and-mark "rect-mark"
  "Exchange point and mark for rectangle." t)
(autoload 'rm-kill-region "rect-mark"
  "Kill a rectangular region and save it in the kill ring." t)
(autoload 'rm-kill-ring-save "rect-mark"
  "Copy a rectangular region to the kill ring." t)
(autoload 'rm-mouse-drag-region "rect-mark"
  "Drag out a rectangular region with the mouse." t)

;; One vision of a better picture mode.
(add-hook 'picture-mode-hook 'rm-example-picture-mode-bindings)
(autoload 'rm-example-picture-mode-bindings "rect-mark"
  "Example rect-mark key and mouse bindings for picture mode.")

;; Use ido to find file and switch buffer
(require 'ido-setting)

;; Set calendar
(require 'calendar-setting)

;; Set text-mode as default major mode
(setq default-major-mode 'text-mode) ; No works..

;; Use M-o as prefix for outline minor mode command
(setq outline-minor-mode-prefix [(meta o)])
;; turn on outline mode
(outline-minor-mode t) ; No works..

;; Load folding-mode (folding is no fit for C/C++)
;(autoload 'folding-mode          "folding" "Folding mode" t)
;(autoload 'turn-off-folding-mode "folding" "Folding mode" t)
;(autoload 'turn-on-folding-mode  "folding" "Folding mode" t)

;; Configure Interactive Shell
(setq comint-scroll-to-bottom-on-input 1) ; Scroll to the end of the comint buffer when you type something
(setq comint-scroll-to-bottom-on-output 1) ; Scroll to the end of the comint buffer when there is output from the subprocess
(setq comint-eol-on-send 1) ; Move point to the end of the line before sending the input to the subprocess
(if sams-Windows-p
	(setq comint-process-echoes 1) ; Command echo setting
  )

;; Use ibuffer replace default buffer brower
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Use C-c k or M-y open kill ring brower+
(require 'browse-kill-ring+)
;(global-set-key [(control c)(k)] 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

;; Use aspell for fly-spell
(if sams-UNIX-p
	(setq-default ispell-program-name "aspell")
  )
(if sams-Windows-p
	(setq-default ispell-program-name "~/.emacs.d/aspell/bin/aspell.exe")
  )

;; Use M-up M-down M-left M-right to change window
(windmove-default-keybindings 'meta)

;; Save cursor position when close
(require 'saveplace)
(setq-default save-place t)

;; When no selection available, use C-w/M-w to cut/copy current line
(defadvice kill-ring-save (before slickcopy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
	 (list (line-beginning-position)
		   (line-beginning-position 2)))))
(defadvice kill-region (before slickcut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
	 (list (line-beginning-position)
		   (line-beginning-position 2)))))

;; Add recent-file menu in menu bar
(require 'recentf)
(recentf-mode t)

;; Set visual studio like compile and debug setting
(require 'gdb-mode-setting)

;; Highlight selected text
(setq transient-mark-mode t)

;; Display line number
(setq global-linum-mode t)

;; Close error prompt sound
(setq visible-bell t)

;; No backup files with prefix ~
(setq-default make-backup-files nil)

;; Close emacs startup screen
(setq inhibit-startup-message t)
(setq gnus-inhibit-startup-message t)

;; Make kill history large enough
(setq kill-ring-max 1000)

;; Display folder and file name on title bar
(setq frame-title-format "%n%F/%b")

;; syntax highlighting
(setq global-font-lock-mode t)

;; Use system clipboard
(setq x-select-enable-clipboard t)

;; Highlight search
(setq search-highlight t)
(setq query-replace-highlight t)

;; Display match parentheses in mini-buffer
(setq blink-matching-paren t)

;; Save bookmark when its edited
(setq bookmark-save-flag 1)

;; Set match for \< and \>
(setq search-whitespace-regexp "[ \t\r\n]+")

;; Define end of sentence
;(setq sentence-end "\\([&#161;&#163;&#163;&#161;&#163;&#191;]\\|&#161;&#161;\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")

;; Set adaptive-fill prefix
(setq adaptive-fill-regexp "[ \t]+\\|[ \t]*\\([0-9]+\\.\\|\\*+\\)[ \t]*")
(setq adaptive-fill-first-line-regexp "^\\* *$")

;; Use S-backspace to delete all surrounding blank lines
(global-set-key (kbd "S-<backspace>") 'delete-blank-lines)

;; Use C-<left> and C-<right> to switch buffers
(require 'swbuff)
(global-set-key (kbd "C-<left>") 'swbuff-switch-to-previous-buffer)
(global-set-key (kbd "C-<right>") 'swbuff-switch-to-next-buffer)
(setq swbuff-exclude-buffer-regexps
	  '("^ " "\\*.*\\*"))
(setq swbuff-status-window-layout 'scroll)
(setq swbuff-clear-delay 1)
(setq swbuff-separator "|")
(setq swbuff-window-min-text-height 1)

;; scroll line, not page
(setq scroll-step 1)
;; scroll when near edge
(setq scroll-margin 3)
;; avoid blinking
(setq scroll-conservatively 10000)

;; Display current pos on state bar
;(setq column-number-mode t)
;; Only add linum to not temporary buffer
(setq linum-format
	  (lambda (line)
		(propertize
		 (format (let ((w (length (number-to-string
								   (count-lines (point-min) (point-max))))))
				   (concat "%" (number-to-string w) "d ")) line) 'face 'linum)))
(defun my-linum-on ()   ; linum should turn off in non-editor buffer
  (unless (or (minibufferp)
			  (equal (string-match " \\*.*\\ *" (buffer-name (current-buffer))) 0))
    (linum-mode 1)))
(define-globalized-minor-mode my-global-linum-mode linum-mode my-linum-on)
(my-global-linum-mode 1)

;; Use window theme, in gui only
(when (and window-system (require 'semantic-tag-folding nil 'noerror))
    ;; Select theme
    (require 'color-theme)
    (color-theme-initialize)
    ;(color-theme-bharadwaj-slate)
    (color-theme-calm-forest)
)

;; Move mouse away when pos move to its position
(mouse-avoidance-mode 'cat-and-mouse)

;; Set default tab width to 4 instead of 2
;(setq default-tab-width 4) ; will be set in cc-mode-setting.el

;; Use spaces instead of tabs
;(setq-default indent-tabs-mode nil) ; will be set in cc-mode-setting.el

;; Remove blanks before comments when auto-format source code
(setq comment-column 0)

;; Set cc mode style
(require 'cc-mode-setting)

;; Use C-. record current pos, use C-/ to jump back
(global-set-key (kbd "C-.") 'ska-point-to-register)
(global-set-key (kbd "C-/") 'ska-jump-to-register)
(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register.
Use ska-jump-to-register to jump back to the stored
position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8)
  (message "Jump-reference position set.")
  )
(defun ska-jump-to-register()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
;  (jump-to-register 8)
  (let ((tmp (point-marker)))
	(jump-to-register 8)
	(set-register 8 tmp))
  (message "Jump to reference position.")
  )

;; Use C-' and C-" simulate vim's f/F key
(defun wy-go-to-char-forward (n char)
  "Move forward to Nth occurence of CHAR.
Typing `wy-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
					 char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event))
  )
(defun wy-go-to-char-backward (n char)
  "Move backward to Nth occurence of CHAR.
Typing `wy-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-backward (string char) nil nil n)
  (while (char-equal (read-char)
					 char)
    (search-backward (string char) nil nil n))
  (setq unread-command-events (list last-input-event))
  )
(define-key global-map (kbd "C-\'") 'wy-go-to-char-forward)
(define-key global-map (kbd "C-\"") 'wy-go-to-char-backward)

;; Use C-g jump to specified line
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "M-G") 'goto-char)

;; Use C-| to navigate back
(global-set-key (kbd "C-|") 'pop-global-mark)

;; C-c M-w Copy-one-line, "C-u 5 C-c M-w" will copy 5 lines
(global-set-key (kbd "C-c M-w") 'copy-lines)
(defun copy-lines(&optional arg)
  (interactive "p")
  (save-excursion
    (beginning-of-line)
    (set-mark (point))
    (next-line arg)
    (kill-ring-save (mark) (point))
	)
  )

;; Enable redo, use F4 and Shift-F4 for undo/redo
(require 'redo)
(global-set-key (kbd "C-+") 'redo)

;; Always end a file with a newline
(setq require-final-newline 'query)

;; Enable buffer name suggestion
(require 'iswitchb)

;; Binding C-% to query-replace-regexp
(global-set-key (kbd "C-%") 'query-replace-regexp)

;; Use C-x C-p and C-x C-n change buffer
;; C-x C-o Switch two buffer
;; C-x C-k Kill current buffer directly
(load-library "yic-buffer")

;; Use C-x C-O to backward move to another window
(global-set-key (kbd "C-x O") 'sams-other-window-backwards)

;; Trigger full screen
(if sams-UNIX-p
	(global-set-key [f11] 'fullscreen-for-linux)
  (global-set-key [f11] 'maximize-win-for-windows)
  )

;; Full-screen for Linux
(defun fullscreen-for-linux ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0))
  )

;; Max-size window for Linux
(defun maximize-win-for-linux ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  )
(if sams-UNIX-p
	(run-with-idle-timer 0.1 nil 'maximize-win-for-linux)
  )

(defun maximize-win-for-windows ()
  (interactive)
  (w32-send-sys-command 61488)
  )
(if sams-Windows-p
	(progn
	  (message "Maximize screen")
	  (run-with-idle-timer 0.1 nil 'maximize-win-for-windows))
  )

;; Start emacs server for emacsclientw.exe
(if sams-Windows-p
	(server-start)
  )

;; Noninteractive compile
(defun do-compile ()
  "Save buffers and start compile"
  (interactive)
  (save-some-buffers t)
  (setq compilation-read-command nil)
  (compile compile-command)
  (setq compilation-read-command t)
  )

;; Use C-M-! to delete all buffer except current one
(defun kill-other-buffers (&rest buffers-not-to-kill)
  "Kill buffers not listed in arguements. 
If the arguements are nil, all buffers except current buffer will be killed" 
  (interactive)
  (let ((buffers-all (buffer-list))
		(buffers-not-to-kill (or buffers-not-to-kill
								 (list (current-buffer))))
		(kill-buffer-query-functions nil))
    (mapc 'kill-buffer
		  (remove-if (lambda (buffer)
					   (memq buffer buffers-not-to-kill))
					 buffers-all))))

(global-set-key (kbd "C-M-!")
				(lambda ()
				  (interactive)
				  (kill-other-buffers (current-buffer) 
									  (get-buffer "*scratch*") 
									  (get-buffer "*Messages*"))
				  (call-interactively 'delete-other-windows)))

;; Use S-<space> to remove redundant spaces
(global-set-key (kbd "S-<delete>") 'just-one-space)

;; function to Toggle Visual Line Mode (line wrap)
;(global-set-key (kbd "C-x M-T") (lambda nil
(defun toggle-line-wrap ()
  (interactive)
  (if visual-line-mode 
	  (visual-line-mode 0))
  (setq word-wrap nil) 
  (if truncate-lines
	  (toggle-truncate-lines -1)
	(toggle-truncate-lines 1)))

;; Use C-` to open or close calender
(global-set-key (kbd "C-`") (lambda ()
							  (interactive)
							  (if (or (not (fboundp 'calendar-exit)) 
									  (null (calendar-exit)))
								  (calendar))))

;; Function key setup
(global-set-key [f1] 'speedbar)
; f2, C-f2, S-f2, C-S-f2 engaged by cedet
(global-set-key [f3] 'toggle-line-wrap)
(global-set-key [f4] 'ecb-minor-mode)
(global-set-key [M-f4] 'save-buffers-kill-emacs) ; This means: quit
(global-set-key [f5] 'revert-buffer) ; Use F5 to reload buffer
(global-set-key [S-f5] 'eval-buffer) ; To reload .emacs without restart
(global-set-key [f7] 'compile)
(global-set-key [S-f7] 'do-compile)
; f8 cannot be caught under windows
; f11 engaged by fullscreen
; f12, S-f12, M-S-f12 engaged by cedet
; M-f12 engaged by sourcepair

;; Use C-c i t to insert time at current position
(defun freyr-insert-date ()
  (interactive)
  (insert (format-time-string "%Y/%m/%d %H:%M:%S" (current-time)))
  )
(global-set-key (kbd "C-c i t") 'freyr-insert-date)

;; Use C-c t b and C-c u t to tabify/untabity region
(global-set-key (kbd "C-c u t") 'untabify) ; untabify region
(global-set-key (kbd "C-c t b") 'tabify) ; tabify region

;; Use C-c r n to rename buffer
(global-set-key (kbd "C-c r n") 'rename-buffer)

;; Use C-c r l to reload buffer
(global-set-key (kbd "C-c r l") 'revert-buffer)

;; Use C-c e b to execute buffer contain as lisp script, can be use for reload .emacs without restart
(global-set-key (kbd "C-c e b") 'eval-buffer)

;; Use M-S, C-$ and C-M-$ do word region and buffer spell check
(global-set-key (kbd "\M-$") 'ispell-word)
(global-set-key (kbd "C-$") 'ispell-region)
(global-set-key (kbd "C-M-$") 'ispell-buffer)
;(global-set-key (kdb "C-tab") 'ispell-complete-word)

;; When cursor on an parenthese, use % jump to the match one
(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
		((looking-at "\\s\)") (forward-char 1) (backward-list 1))
		(t (self-insert-command (or arg 1)))))

;; Use M-S-Space complete lisp function or local file name
(global-set-key "\M-/" 'hippie-expand) ; Use hippie-expand replace dabbrev-expand
(setq hippie-expand-try-functions-list
	  '(try-expand-dabbrev
		try-expand-dabbrev-visible
		try-expand-dabbrev-all-buffers
		try-expand-dabbrev-from-kill
		try-complete-file-name-partially
		try-complete-file-name
		try-expand-all-abbrevs
		try-expand-list
		try-expand-line
		try-complete-lisp-symbol-partially
		try-complete-lisp-symbol))

;; Use C-; / C-: to mark / rect-mark, M-; / M-: to select a line
(fset 'freyr-mark-current-line-forward
	  "\C-a\C-@\C-e")
(fset 'freyr-mark-current-line-backward
	  "\C-e\C-@\C-a")
(fset 'freyr-eliminate-mark
	  " \C-b\C-d")
(global-set-key (kbd "C-;") 'set-mark-command)
(global-set-key (kbd "C-:") 'rm-set-mark)
(global-set-key (kbd "M-;") 'freyr-mark-current-line-forward)
(global-set-key (kbd "M-:") 'freyr-mark-current-line-backward)
(global-set-key (kbd "C-M-;") 'freyr-eliminate-mark)

;; For write macro
(global-set-key (kbd "C-c n m") 'name-last-kbd-macro)
(global-set-key (kbd "C-c i m") 'insert-kbd-macro)
(global-set-key (kbd "C-c r m") 'sams-apply-macro-on-region)
(global-set-key (kbd "C-c l m") 'apply-macro-to-region-lines)

;; Bookmark
(global-set-key (kbd "C-c b k") 'bookmark-set)
(global-set-key (kbd "C-c j b") 'bookmark-jump)

;; Register (anonymous bookmark)
(global-set-key (kbd "C-c r g") 'point-to-register)
(global-set-key (kbd "C-c j r") 'jump-to-register)

;; Indirect buffer
(global-set-key (kbd "C-c i b") 'sams-make-buffer-copy)

;; Set default tag file
(setq tags-table-list '("./TAGS"))

;; Freyr macros
(fset 'freyr-join-line
	  [?\C-e ?\C-d])
;   [?\C-@ ?\C-e ?\C-d ?\C-x ?\C-x ?  backspace]) ; Keep cursor position

(fset 'freyr-open-line-after-current-line
	  [?\C-e ?\C-m])
;   [?\C-@ ?\C-e ?\C-m ?\C-x ?\C-x ?  backspace]) ; Keep cursor position

(fset 'freyr-open-line-before-current-line
	  [?\C-a ?\C-m ?\C-p])
;   [?\C-@ ?\C-a ?\C-m ?\C-x ?\C-x ?  backspace]) ; Keep cursor position

(global-set-key (kbd "C-j") 'freyr-join-line) ; May be rewrote in some major mode
(global-set-key (kbd "C-S-j") 'freyr-join-line)
(global-set-key (kbd "C-o") 'freyr-open-line-after-current-line)
(global-set-key (kbd "C-S-o") 'freyr-open-line-before-current-line)

;; Enable narrow to region
(put 'narrow-to-region 'disabled nil)

