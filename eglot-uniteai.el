;;; eglot-uniteai.el --- Eglot Clients for UniteAI  -*- lexical-binding: t; -*-

;; Copyright (C) 2023 Josh Freckleton
;; Copyright (C) 2023-2024  Shen, Jen-Chieh

;; Author: Josh Freckleton <freckletonj@gmail.com>
;;         Shen, Jen-Chieh <jcs090218@gmail.com>
;; Maintainer: Shen, Jen-Chieh <jcs090218@gmail.com>
;; URL: https://github.com/emacs-openai/eglot-uniteai
;; Version: 0.1.0
;; Package-Requires: ((emacs "26.1"))
;; Keywords: convenience ai

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Eglot Clients for UniteAI.
;;

;;; Code:

(require 'eglot)

(defgroup eglot-uniteai nil
  "Settings for the UniteAI Language Server."
  :group 'eglot
  :link '(url-link "https://github.com/emacs-openai/eglot-uniteai"))

(defcustom eglot-uniteai-active-modes
  '( markdown-mode org-mode python-mode bibtex-mode clojure-mode coffee-mode
     c-mode c++-mode csharp-mode css-mode diff-mode dockerfile-mode fsharp-mode
     go-mode groovy-mode html-mode web-mode java-mode js-mode js2-mode json-mode
     LaTeX-mode less-css-mode lua-mode makefile-mode objc-mode perl-mode
     php-mode text-mode powershell-mode ess-mode ruby-mode rust-mode scss-mode
     sass-mode sh-mode sql-mode swift-mode typescript-mode TeX-mode nxml-mode
     yaml-mode sh-mode toml-mode)
  "List of major mode that work with UniteAI."
  :type 'list
  :group 'lsp-uniteai)

(defcustom eglot-uniteai-connection-method 'stdio
  "Method to connect to the UniteAI language server."
  :type '(choice (const :tag "--stdio" stdio)
                 (const :tag "--tcp" tcp))
  :group 'lsp-uniteai)

(defcustom eglot-uniteai-port 5033
  "Port number to start the language server."
  :type 'integer
  :group 'lsp-uniteai)

;;
;; (@* "Client" )
;;

(defun eglot-uniteai--server-command ()
  "Generate startup command for UniteAI language server."
  (cl-case eglot-uniteai-connection-method
    (`stdio (list 'eglot-uniteai-server "uniteai_lsp" "--stdio"))
    (`tcp (list 'eglot-uniteai-server "uniteai_lsp" "--tcp" "--lsp_port" eglot-uniteai-port))))

(add-to-list 'eglot-server-programs
             `(,eglot-uniteai-active-modes . ,(eglot-uniteai--server-command)))

;;
;; (@* "Util" )
;;

(defun eglot-uniteai--range ()
  "Return the current region in LSP scope."
  (unless (region-active-p)
    (user-error "No region selected"))
  (list :start (eglot--pos-to-lsp-position (region-beginning))
        :end   (eglot--pos-to-lsp-position (region-end))))

;;
;; (@* "Commands" )
;;

;; Global stopping
(defun eglot-uniteai-stop ()
  "Stop the UniteAI."
  (interactive)
  (let* ((server (eglot--current-server-or-lose))
         (doc (eglot--TextDocumentIdentifier)))
    (eglot-execute-command server 'command.stop (vector doc))))

;; Example Counter
(defun eglot-uniteai-example-counter ()
  "TODO: .."
  (interactive)
  (let* ((server (eglot--current-server-or-lose))
         (doc (eglot--TextDocumentIdentifier))
         (pos (eglot--pos-to-lsp-position (point))))
    (eglot-execute-command server 'command.exampleCounter (vector doc pos))))

;; Local LLM
(defun eglot-uniteai-local-llm ()
  "TODO: .."
  (interactive)
  (let ((server (eglot--current-server-or-lose))
        (doc (eglot--TextDocumentIdentifier))
        (range (eglot-uniteai--range)))
    (eglot-execute-command server 'command.localLlmStream (vector doc range))))

;; Transcription
(defun eglot-uniteai-transcribe ()
  "TODO: .."
  (interactive)
  (let* ((server (eglot--current-server-or-lose))
         (doc (eglot--TextDocumentIdentifier))
         (pos (eglot--pos-to-lsp-position (point))))
    (eglot-execute-command server 'command.transcribe (vector doc pos))))

;; OpenAI
(defun eglot-uniteai-openai-gpt ()
  "TODO: .."
  (interactive)
  (let ((server (eglot--current-server-or-lose))
        (doc (eglot--TextDocumentIdentifier))
        (range (eglot-uniteai--range)))
    (eglot-execute-command server 'command.openaiAutocompleteStream (vector doc range "FROM_CONFIG_COMPLETION" "FROM_CONFIG"))))

(defun eglot-uniteai-openai-chatgpt ()
  "TODO: .."
  (interactive)
  (let* ((server (eglot--current-server-or-lose))
         (doc (eglot--TextDocumentIdentifier))
         (range (eglot-uniteai--range)))
    (eglot-execute-command server 'command.openaiAutocompleteStream (vector doc range "FROM_CONFIG_CHAT" "FROM_CONFIG"))))

(provide 'eglot-uniteai)
;;; eglot-uniteai.el ends here
