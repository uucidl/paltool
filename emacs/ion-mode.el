;; ion-mode.el -- major mode for editing ion files
;; NOT WORKING.

;; @url: http://cc-mode.sourceforge.net/derived-mode-ex.el
;; @url: http://www.wilfred.me.uk/blog/2015/03/19/adding-a-new-language-to-emacs/
;; @url: http://www.davidchristiansen.dk/2014/07/16/implementing-an-emacs-programming-language-mode-beyond-the-basics/
;; @url: https://www.emacswiki.org/emacs/ProgMode
;;

;; I'm not sure it's such a good idea to base this mode on CC-mode.
;; (Despite similarities with C)

(require 'cc-mode)

(eval-when-compile
  (require 'cc-langs)
  (require 'cc-fonts)
  (c-add-language 'ion-mode 'c-mode))

(c-lang-defconst c-modifier-kwds
  ion (append '("func" "var" "const") (c-lang-const c-modifier-kwds)))

(c-lang-defconst c-cpp-matchers ion nil)

(c-lang-defconst c-recognize-colon-labels ion nil) ;; I want this to be t

(c-lang-defconst c-assignment-operators
  ion (c-lang-const c-assignment-operators))

(defcustom ion-font-lock-extra-types nil
  "*List of extra types (aside from the type keywords) to recognize in ion mode. Each list item should be a regexp matching a single identifier.")

(defcustom ion-font-lock-keywords-1 (c-lang-const c-matchers-1 ion)
  "Minimal highlighting for ion mode")

(defcustom ion-font-lock-keywords-2 (c-lang-const c-matchers-2 ion)
  "Fast normal highlighting for ion mode")

(defcustom ion-font-lock-keywords-3 (c-lang-const c-matchers-2 ion)
  "Accurate normal highlighting for ion mode.")

(defvar ion-font-lock-keywords ion-font-lock-keywords-3
  "Default expressions to highlight in ion mode.")

(defvar ion-mode-syntax-table nil
  "Syntax table used in ion-mode buffers.")

(or ion-mode-syntax-table
    (setq ion-mode-syntax-table
	  (funcall (c-lang-const c-make-mode-syntax-table ion))))

(defvar ion-mode-abbrev-table nil
  "Abbreviation table used in ion-mode buffers.")

(c-define-abbrev-table 'ion-mode-abbrev-table
  '(("else" "else" c-electric-continued-statement 0)
    ("while" "while" c-electric-continued-statement 0)))

(defvar ion-mode-map (let ((map (c-make-inherited-keymap))) map)
  "Keymap used in ion-mode buffers.")

(easy-menu-define ion-menu ion-mode-map "Ion Mode Commands"
  (cons "ion" (c-lang-const c-mode-menu ion)))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.ion\\'" . ion-mode))

;;;###autoload
(defun ion-mode ()
  "Major mode for editing ion code. Derived from CC Mode.

The hook `c-mode-common-hook' is run with no args at mode
initialization, then `ion-mode-hook'.

Key bindings:
\\{ion-mode-map}"
  (interactive)
  (kill-all-local-variables)
  (c-initialize-cc-mode t)
  (set-syntax-table ion-mode-syntax-table)
  (setq major-mode 'ion-mode
	mode-name "ion"
	local-abbrev-table ion-mode-abbrev-table
	abbrev-mode t)
  (use-local-map ion-mode-map)
  (c-init-language-vars ion-mode)
  (c-common-init 'ion-mode)
  (easy-menu-add ion-menu)
  (run-hooks 'c-mode-common-hook)
  (run-hooks 'ion-mode-hook)
  (c-update-modeline))

(provide 'ion-mode)

;; ion-mode ends here.
