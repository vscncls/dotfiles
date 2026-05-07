export PATH="$HOME/.local/bin:$PATH"

if status is-interactive
    set -U fish_greeting
    set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

    fish_vi_key_bindings

    source $__fish_config_dir/abbr.fish

    alias tree='eza --tree --git-ignore --icons'
end
