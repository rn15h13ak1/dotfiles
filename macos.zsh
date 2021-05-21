#!/bin/zsh
# 設定内容全量表示
#defaults read | less

### Finder ####################
# 隠しファイル表示
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder
# 設定内容表示
#defaults read com.apple.finder | less

### Screencapture ####################
# 余白削除
defaults write com.apple.screencapture disable-shadow -bool true
# 保存先変更（~/ss）
defaults write com.apple.screencapture location ~/ss
# ファイル名変更
defaults write com.apple.screencapture name ss
# 設定内容表示
#defaults read com.apple.screencapture | less



