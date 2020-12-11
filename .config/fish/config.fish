set PATH (yarn global bin) $PATH
set PATH ~/.emacs.d/bin $PATH
set fish_greeting
set -Ux PAGER less
set -Ux EDITOR nvim
set -Ux BROWSER firefox-developer-edition

abbr g git
abbr ga git add
abbr ggl git pull
abbr gfa git fetch --all --prune
abbr gf git fetch
abbr gd git diff
abbr gst git status
abbr gsh git show
abbr ga git add
abbr ga git add
abbr gco git checkout
abbr glg git log --oneline
abbr gp git push
abbr gpt git push --tags
abbr gca git commit --all -v
abbr gca! git commit --all -v --amend
abbr gc git commit -v
abbr gc! git commit -v --amend
abbr l ls
abbr gaa git add .

abbr yw yarn workspace
abbr ya yarn add
abbr yad yarn add --dev
abbr yr yarn run

set MAKEFLAGS '-j'(nproc)''

. ~/.asdf/asdf.fish
