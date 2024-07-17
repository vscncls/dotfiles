#set PATH (yarn global bin) $PATH
set PATH ~/.config/yarn/global/node_modules/.bin $PATH
set PATH ~/.emacs.d/bin $PATH
set PATH ~/.local/bin $PATH
set PATH ~/.local/share/pnpm $PATH
set PATH ~/.bun/bin $PATH
set PATH ~/.cargo/bin $PATH
set PATH ~/go/bin $PATH

set fish_greeting
set -Ux PAGER less
set -Ux EDITOR nvim

alias ls lsd

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
abbr gcwip git commit -m "WIP"
abbr l ls
abbr gaa git add .

abbr yw yarn workspace
abbr ya yarn add
abbr yad yarn add --dev
abbr yr yarn run

set MAKEFLAGS '-j'(nproc)''

set FZF_DEFAULT_COMMAND 'rg --files --hidden --glob "!.git/" --glob "!*.class"'

. ~/.asdf/asdf.fish

if test ! -e $HOME/.config/fish/zellij.fish
				zellij setup --generate-completion fish > $HOME/.config/fish/zellij.fish
end

source $HOME/.config/fish/zellij.fish
