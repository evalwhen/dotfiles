#!/bin/bash

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
# when setting fcitx, firefox input invalid.
export XMODIFIERS=@im=fcitx
export LC_CTYPE=zh_CN.UTF-8
# proxychains emacs
#export HOME=/home/hujianfeng/spacemacs
emacs
