;;
;; @url: http://www.wilfred.me.uk/blog/2015/03/19/adding-a-new-language-to-emacs/
;; @url: http://www.davidchristiansen.dk/2014/07/16/implementing-an-emacs-programming-language-mode-beyond-the-basics/
;; @url: https://www.emacswiki.org/emacs/ProgMode
;;

(define-derived-mode ion-mode prog-mode
  "ion"
  :syntax-table ion-mode-syntax-table
  (font-lock-fontify-buffer))

(defconst ion-mode-syntax-table
  (let ((table (make-syntax-table)))
    (modify-syntax-entry ?_ "_" table)
    (modify-syntax-entry ?\\ "\\" table)
    (modify-syntax-entry ?+ "." table)
    (modify-syntax-entry ?- "." table)
    (modify-syntax-entry ?+ "." table)
    (modify-syntax-entry ?= "." table)
    (modify-syntax-entry ?% "." table)
    (modify-syntax-entry ?< "." table)
    (modify-syntax-entry ?& "." table)
    (modify-syntax-entry ?| "." table)
    (modify-syntax-entry ?\' "\""    table)
    (modify-syntax-entry ?\240 "."   table)

    ;; comments
    (modify-syntax-entry ?/ ". 124b" table)
    (modify-syntax-entry ?* ". 23" table)

    ;; newlines
    (modify-syntax-entry ?\n "> b" table)
    (modify-syntax-entry ?\^m "> b" table)
			 
    ;; identifiers
    (modify-syntax-entry ?_ "w" table)
    (modify-syntax-entry ?$ "w" table)

    table))

