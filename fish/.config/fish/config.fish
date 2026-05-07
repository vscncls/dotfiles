export PATH="$HOME/.local/bin:$PATH"

if status is-interactive
    set -U fish_greeting
    fish_vi_key_bindings

    source $__fish_config_dir/abbr.fish

    alias tree='eza --tree --git-ignore --icons'
end
