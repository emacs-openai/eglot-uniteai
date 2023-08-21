;;; eglot-uniteai.el --- Eglot Clients for UniteAI  -*- lexical-binding: t; -*-

;; Copyright (C) 2023  Shen, Jen-Chieh

;; Author: Shen, Jen-Chieh <jcs090218@gmail.com>
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

(provide 'eglot-uniteai)
;;; eglot-uniteai.el ends here
