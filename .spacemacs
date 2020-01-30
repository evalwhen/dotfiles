;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     epub
     nginx
     graphviz
     elixir
     ;; nlinum
     lsp
     ;; debug
     dap
     (go :variables godoc-at-point-function 'godoc-gogetdoc
                    go-tab-width 4
                    ;; go-use-gometalinter t
                    run-go-install-on-save t
                    ;; go-backend 'lsp
                    )
     (scala :variable
            scala-auto-insert-asterisk-in-comments t
            scala-auto-start-ensime t)
     sql
     ;; multiple-cursors
     ;; neotree
     python
     csv
     (ruby :variables
           ruby-enable-enh-ruby-mode t
           ruby-version-manager 'rbenv
           )
     ruby-on-rails
     ;; (java :variables java-backend 'meghanada)
     java
     c-c++
     cmake
     ;; (c-c++ :variables c-c++-backend 'lsp-ccls)
     ;; (c-c++ :variables =c-c++-backend= 'lsp-clangd)
     javascript
     markdown
     yaml
     php
     html
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; helm
     auto-completion
     ;; (gtags :variables gtags-enable-by-default t)
     better-defaults
     emacs-lisp
     common-lisp
     rust
     erlang
     (clojure :variables clojure-enable-fancify-symbols t)
     racket
     git
     github
     (org :variables
          org-enable-github-support t
          org-enable-hugo-support t
          org-enable-bootstrap-support t
          ;; org-enable-org-journal-support t
          )
     gtd
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-shell 'ansi-term
            shell-default-term-shell "/bin/zsh")
     ;; spell-checking
     syntax-checking
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      version-control-global-margin t)
     ;; tools
     dash
     deft
     pandoc
     gnus
     ;; framework
     react)
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(editorconfig polymode org-page)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 30
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory `emacs-version
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 23
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
(setq configuration-layer--elpa-archives
      '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
        ("org-cn"   . "http://elpa.emacs-china.org/org/")
        ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (setq eclimd-default-workspace "~/eclipse/workspace")
  (setq httpd-root "~/workspace/skewer")
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (lisp . t)
     (ruby . t)))
  ;; editorconfig
  (editorconfig-mode 1)

  ;; gdb config
  (setq gdb-many-windows t)
  (setq gdb-show-main t)

  ;; scala
  (setq-default flycheck-scalastylerc "/home/huzi/scala-etc/scalastyle_config.xml")

  ;; heml-ag
  (setq helm-ag-use-agignore t)
  (setq helm-ag-use-grep-ignore-list t)

  ;; mobileOrg
  ;; Set to the location of your Org files on your local system
  (setq org-directory "~/.deft")
  ;; Set to the name of the file where new notes will be stored
  (setq org-mobile-inbox-for-pull "~/.deft/test.org")
  ;; Set to <your Dropbox root directory>/MobileOrg.
  (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

  ;; use xclip to copy/paste in emacs-nox
  (unless window-system
    (when (getenv "DISPLAY")
      (defun xclip-cut-function (text &optional push)
        (with-temp-buffer
          (insert text)
          (call-process-region (point-min) (point-max) "xclip" nil 0 nil "-i" "-selection" "clipboard")))
      (defun xclip-paste-function()
        (let ((xclip-output (shell-command-to-string "xclip -o -selection clipboard")))
          (unless (string= (car kill-ring) xclip-output)
            xclip-output )))
      (setq interprogram-cut-function 'xclip-cut-function)
      (setq interprogram-paste-function 'xclip-paste-function)
      ))

  ;; Get email, and store in nnml
  (setq gnus-secondary-select-methods
        '(
          (nnimap "gmail"
                  (nnimap-address
                   "imap.gmail.com")
                  (nnimap-server-port 993)
                  (nnimap-stream ssl))
          ))

  ;; Send email via Gmail:
  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-default-smtp-server "smtp.gmail.com")

  ;; Archive outgoing email in Sent folder on imap.gmail.com:
  (setq gnus-message-archive-method '(nnimap "imap.gmail.com")
        gnus-message-archive-group "[Gmail]/Sent Mail")

  ;; set return email address based on incoming email address
  (setq gnus-posting-styles
        '(((header "to" "huzi.master@outlook.com")
           (address "huzi.master@outlook.com"))
          ((header "to" "coolvimer@gmail.com")
           (address "coolvimer@gmail.com"))))

  ;; store email in ~/gmail directory
  (setq nnml-directory "~/gmail")
  (setq message-directory "~/gmail")

  ;; chinese input
  ;; (spacemacs//set-monospaced-font   "Source Code Pro" "Noto Mono" 14 16)

  ;; react framework
  (setq-default
   ;; js2-mode
   js2-basic-offset 2
   ;; web-mode
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2)

  (with-eval-after-load 'web-mode
    (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))

  ;; deft
  (setq deft-directory "~/Nutstore/.deft")

  ;; common lisp
  ;; (setq inferior-lisp-program "ros -Q run")

  ;; ag search
  (setq helm-ag-use-agignore t)

  ;; org-capture template
  ;; (setq org-capture-templates
  ;;       '(("t" "Todo" entry (file+headline "~/Nutstore/.deft/gtd.org" "Tasks")
  ;;          "* TODO %?\n  %i\n  %a")
  ;;         ("c" "Todo" entry (file+headline "~/Nutstore/.deft/gtd.org" "Tasks")
  ;;          "* TODO %^{Brief Description} %^g\n%?\nAdded: %U"
  ;;          )))
  (setq go-format-before-save t)
  (setq company-echo-delay 0)
  ;; ruby
  (setq enh-ruby-add-encoding-comment-on-save nil)
  (setq ruby-insert-encoding-magic-comment nil)
  ;; sliver-brain
  (add-to-list 'load-path "~/.silver-brain/emacs/")
  (use-package silver-brain
    :init
    ;; The port of back-end server. Does NOT affect server side.
    (setq silver-brain-server-port 5000)

    :bind
    ("C-c s" . silver-brain))

  ;; org-page
  (require 'org-page)
  (setq op/repository-directory "/home/hujianfeng/evalwhen.github.io")   ;; the repository location
  (setq op/site-domain "https://evalwhen.github.io/")         ;; your domain
   ;;; the configuration below you should choose one, not both
  (setq op/personal-disqus-shortname "coolvimer")    ;; your disqus commenting system
  ;; (setq op/personal-duoshuo-shortname "your_duoshuo_shortname")  ;; your duoshuo commenting system
  ;; (setq op/hashover-comments t)                                   ;; activate hashover self-hosted comment system
  (setq op/personal-github-link "https://github.com/evalwhen")
  (setq op/site-main-title "Melp")
  (setq op/site-sub-title "Learn By Doing")
  (setq op/repository-org-branch "source")
  (setq op/repository-html-branch "master")
  (setq op/theme 'mdo)
  (setq op/theme-root-directory "/home/hujianfeng/blog-theme")

  ;; org-journal
  (setq org-journal-date-prefix "#+TITLE: ")
  (setq org-journal-date-format "%A, %B %d %Y")
  (setq org-journal-time-prefix "* ")
  (setq org-journal-time-format "")
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (polymode erlang ob-elixir dash-docs graphviz-dot-mode go-guru go-eldoc flycheck-mix flycheck-credo transient company-go go-mode lv sesman parseedn parseclj a alchemist elixir-mode magit-gh-pulls github-search github-clone github-browse-file gist gh marshal logito wgrep smex counsel-projectile counsel-dash counsel swiper ivy-hydra ivy pyim pyim-basedict org-mime nginx-mode ghub let-alist popup toml-mode racer flycheck-rust cargo rust-mode org-category-capture avy helm helm-core async winum unfill fuzzy noflet ensime sbt-mode scala-mode sql-indent clj-refactor edn paredit cider seq queue clojure-snippets peg cider-eval-sexp-fu clojure-mode racket-mode faceup disaster company-c-headers cmake-mode clang-format yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic csv-mode editorconfig projectile-rails inflections feature-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest enh-ruby-mode chruby bundler inf-ruby pdf-tools tablist ob-php youdao-dictionary names chinese-word-at-point visual-fill-column org-cliplink fcitx avy-zap pangu-spacing find-by-pinyin-dired chinese-pyim chinese-pyim-basedict ace-pinyin pinyinlib ace-jump-mode company-emacs-eclim eclim xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help mu4e-maildirs-extension mu4e-alert pandoc-mode ox-pandoc ht deft zeal-at-point helm-dash mwim smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter evil-magit magit magit-popup git-commit with-editor diff-hl org-present web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode mmm-mode markdown-toc markdown-mode gh-md org-projectile pcache org org-pomodoro alert log4e gntp org-download htmlize gnuplot yaml-mode helm-gtags ggtags slime-company slime helm-company helm-c-yasnippet flycheck-pos-tip pos-tip flycheck company-web web-completion-data company-statistics company common-lisp-snippets auto-yasnippet ac-ispell auto-complete phpunit phpcbf php-extras php-auto-yasnippets yasnippet drupal-mode php-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line package-build spacemacs-theme)))
 '(paradox-github-token t)
 '(pyim-dicts
   (quote
    ((:name "sogou" :file "~/.emacs.d/private/han/pyim-sgcore.pyim" :coding utf-8-unix :dict-type pinyin-dict))))
 '(safe-local-variable-values
   (quote
    ((Syntax . ANSI-Common-Lisp)
     (Package . CL-USER)
     (Base . 10)
     (Package . HUNCHENTOOT)
     (Syntax . COMMON-LISP)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (nov esxml polymode erlang ob-elixir dash-docs graphviz-dot-mode go-guru go-eldoc flycheck-mix flycheck-credo transient company-go go-mode lv sesman parseedn parseclj a alchemist elixir-mode magit-gh-pulls github-search github-clone github-browse-file gist gh marshal logito wgrep smex counsel-projectile counsel-dash counsel swiper ivy-hydra ivy pyim pyim-basedict org-mime nginx-mode ghub let-alist popup toml-mode racer flycheck-rust cargo rust-mode org-category-capture avy helm helm-core async winum unfill fuzzy noflet ensime sbt-mode scala-mode sql-indent clj-refactor edn paredit cider seq queue clojure-snippets peg cider-eval-sexp-fu clojure-mode racket-mode faceup disaster company-c-headers cmake-mode clang-format yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic csv-mode editorconfig projectile-rails inflections feature-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest enh-ruby-mode chruby bundler inf-ruby pdf-tools tablist ob-php youdao-dictionary names chinese-word-at-point visual-fill-column org-cliplink fcitx avy-zap pangu-spacing find-by-pinyin-dired chinese-pyim chinese-pyim-basedict ace-pinyin pinyinlib ace-jump-mode company-emacs-eclim eclim xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help mu4e-maildirs-extension mu4e-alert pandoc-mode ox-pandoc ht deft zeal-at-point helm-dash mwim smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter evil-magit magit magit-popup git-commit with-editor diff-hl org-present web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode mmm-mode markdown-toc markdown-mode gh-md org-projectile pcache org org-pomodoro alert log4e gntp org-download htmlize gnuplot yaml-mode helm-gtags ggtags slime-company slime helm-company helm-c-yasnippet flycheck-pos-tip pos-tip flycheck company-web web-completion-data company-statistics company common-lisp-snippets auto-yasnippet ac-ispell auto-complete phpunit phpcbf php-extras php-auto-yasnippets yasnippet drupal-mode php-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line package-build spacemacs-theme)))
 '(paradox-github-token t)
 '(pyim-dicts
   (quote
    ((:name "sogou" :file "~/.emacs.d/private/han/pyim-sgcore.pyim" :coding utf-8-unix :dict-type pinyin-dict))))
 '(safe-local-variable-values
   (quote
    ((Syntax . ANSI-Common-Lisp)
     (Package . CL-USER)
     (Base . 10)
     (Package . HUNCHENTOOT)
     (Syntax . COMMON-LISP)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)

