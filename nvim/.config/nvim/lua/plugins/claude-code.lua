return {
  "coder/claudecode.nvim",
  opts = {
    terminal_cmd = "claude --dangerously-skip-permissions",
    terminal = {
      provider = "external",
      provider_opts = {
        external_terminal_cmd = "zellij action new-pane --direction down -- %s",
      },
    },
  },
}
