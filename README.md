[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![JCS-ELPA](https://raw.githubusercontent.com/jcs-emacs/badges/master/elpa/v/eglot-uniteai.svg)](https://jcs-emacs.github.io/jcs-elpa/#/eglot-uniteai)

# eglot-uniteai
> Eglot Clients for UniteAI

[![CI](https://github.com/emacs-openai/eglot-uniteai/actions/workflows/test.yml/badge.svg)](https://github.com/emacs-openai/eglot-uniteai/actions/workflows/test.yml)

`eglot` client leveraging [uniteai](https://github.com/freckletonj/uniteai).

## 💾 Quickstart

```elisp
(use-package eglot-uniteai
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'eglot-uniteai)
                         (call-interactively #'eglot))))
```
