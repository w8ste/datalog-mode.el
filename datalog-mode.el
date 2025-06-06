;;; datalog-mode.el --- major mode for datalog  -*- lexical-binding: t; coding: utf-8-*-

;;; Commentary:

;; An attempt on writing a major mode for basic Datalog
;; The intent is to have a simple major mode, which mainly serves to purpose of basic syntax highlighting

;; Copyright (c) 2025 Hannes Albert
;; 
;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;; 
;; The above copyright notice and this permission notice shall be included in all
;; copies or substantial portions of the Software.
;; 
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
;; IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
;; DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
;; OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
;; OR OTHER DEALINGS IN THE SOFTWARE.

;;; Code:


;;;###autoload
(add-to-list 'auto-mode-alist '("\\.dl\\'" . datalog-mode))

(provide 'datalog-mode)

(eval-when-compile
  (require 'rx))

;; syntax highlighting
(defconst datalog--highlight
  (let ((keywords '(".decl" ".input" ".output" ".type"))
        (types '("symbol" "number")))
     `(((,(rx-to-string `(: (or ,@keywords))) 0 font-lock-keyword-face)
       ("\\([[:word:]]+\\)\s*(" 1 font-lock-function-name-face)
       (,(rx-to-string `(: (or ,@types))) 0 font-lock-type-face)))))

;;; datalog-mode.el ends here

