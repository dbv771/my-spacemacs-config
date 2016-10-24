;;; config.el --- appleshan-base layer configuration file for Spacemacs
;;
;; Copyright (c) 2016-2020 Apple Shan
;;
;; Author: Apple Shan <apple.shan@gmail.com>
;; URL: https://github.com/appleshan/my-spacemacs-config
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

;; Variables

;; Full name and email
(setq user-full-name "Apple Shan"
      user-mail-address "apple.shan@gmail.com")

(setq auto-coding-regexp-alist
      (delete (rassoc 'utf-16be-with-signature auto-coding-regexp-alist)
              (delete (rassoc 'utf-16le-with-signature auto-coding-regexp-alist)
                      (delete (rassoc 'utf-8-with-signature auto-coding-regexp-alist)
                              auto-coding-regexp-alist))))

(setq-default indent-tabs-mode nil) ; 使用空格缩进
;; set TAB and indention
(setq-default indent-tabs-mode nil
              tab-width 4) ; 所有buffer默认使用4格缩进

(delete-selection-mode t)            ; delete the selection with a key press
; (global-font-lock-mode t)            ;语法高亮
(transient-mark-mode 1)              ;标记高亮

;; @See https://emacs-china.org/t/smartparens-electri-pair-yasnippet/1326
(electric-pair-mode t)
;; https://www.reddit.com/r/emacs/comments/4xhxfw/how_to_tune_the_behavior_of_eletricpairmode/
(setq electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit)

(auto-compression-mode t)            ;Transparently Open Compressed Files
;(mouse-avoidance-mode "banish")      ;只要一操作鼠标自动闪开

(setq-default major-mode 'text-mode) ;设置默认的主模式为 TEXT 模式
(setq x-select-enable-clipboard t)   ;支持 emacs 和外部程序的粘贴
(setq x-stretch-cursor t)            ;光标在 TAB 字符上会显示为一个大方块
; (setq max-specpdl-size 10000)        ;最大容量
(setq kill-ring-max 1024)            ;用一个很大的 kill ring. 这样防止我不小心删掉重要的东西
(setq undo-outer-limit 5000000)      ;撤销限制
(setq mark-ring-max 1024)            ;设置的 mark ring 容量
(setq global-mark-ring-max 1024)     ;设置最大的全局标记容量
(setq message-log-max t)             ;设置 message 记录全部消息, 而不用截去
(setq read-quoted-char-radix 16)     ;设置 引用字符 的基数
(setq void-text-area-pointer nil)    ;禁止显示鼠标指针
(setq show-paren-style 'parentheses) ;括号匹配显示但不是烦人的跳到另一个括号。
(setq blink-matching-paren nil)      ;当插入右括号时不显示匹配的左括号
(setq max-lisp-eval-depth 40000)     ; lisp 最大执行深度
(setq-default comment-style 'indent) ;设定自动缩进的注释风格
(setq history-delete-duplicates t)   ;删除 minibuffer 的重复历史
(setq print-escape-newlines t)       ;显示字符窗中的换行符为 \n

;; Only mark helm buffers as useless
(setq spacemacs-useless-buffers-regexp '("\\*helm\.\+\\*"))

(fset 'evil-visual-update-x-selection 'ignore)

(spacemacs|add-company-hook 'text-mode)

;; Don't move back the cursor one position when exiting insert mode
(setq evil-move-cursor-back nil)

(setq save-abbrevs nil)

;; turn on abbrev mode globally
(setq-default abbrev-mode t)

(setq url-show-status nil)

(setq font-lock-support-mode 'jit-lock-mode)
(setq jit-lock-stealth-time 16
      jit-lock-defer-contextually t
      jit-lock-stealth-nice 0.5)
(setq-default font-lock-multiline t)

;; show parenthesis match
(show-paren-mode t)
(setq show-paren-style 'expression)

; (with-eval-after-load 'exec-path-from-shell
;   ; Set the environment variable $NAME from the user's shell.
;   (when (memq window-system '(mac ns x))
;     (exec-path-from-shell-copy-env "PATH")))

(let (
      (mypaths
       '(
         "/opt/oracle/lib"
         "/opt/jdk/jdk1.8.0_102/bin"
         "/opt/jdk/apache-maven-3.3.9/bin"
         "/opt/eclipse-jee-neon/eclipse"
         "/home/appleshan/bin"
         "/home/appleshan/bin/cli"
         "/home/appleshan/.local/bin"
         "/home/appleshan/perl5/bin"
         "/home/appleshan/bin/sift"
         "/usr/local/sbin"
         "/usr/local/bin"
         "/usr/sbin"
         "/usr/bin"
         "/sbin"
         "/bin"
         "/usr/games"
         "/usr/local/games"
         ) )
      )

  (setenv "PATH" (mapconcat 'identity mypaths ":") )

  (setq exec-path (append mypaths (list "." exec-directory)) )
  )

(setenv "LD_LIBRARY_PATH" "/opt/oracle/lib")
(setenv "NLS_LANG" "SIMPLIFIED CHINESE_CHINA.AL32UTF8")

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: nil
;; End:

;;; config.el ends here
