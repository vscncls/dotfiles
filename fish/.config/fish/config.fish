export PATH="$HOME/.local/bin:$PATH"

if status is-interactive
    set -U fish_greeting
    fish_vi_key_bindings
    abbr nv nvim
    abbr g git
    abbr gst git status
    abbr ga git add
    abbr glg git log
    abbr gco git checkout
    abbr gc git commit
    abbr gb git branch
    abbr gp git push
    abbr ga git add
end
