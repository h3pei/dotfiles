vim.keymap.set("n", "C", function()
  local diff = vim.fn.system("git diff --cached")
  if diff == "" then
    vim.notify("No staged changes to commit.", vim.log.levels.WARN)
    return
  end

  vim.notify('Generating commit message by claude...', vim.log.levels.INFO)

  local prompt =
    [[Generate ONLY a one-line Git commit message in Japanese, summarizing what was changed and why, based strictly on the contents of `git diff --cached`. Do not add explanation or a body. Output only the commit summary line.']]
  local result = vim.system({ "claude", "--model", "haiku", "-p", prompt }, { text = true, env = { DISABLE_CLAUDE_NOTIFICATION = 1 } }):wait()
  local commit_message = result.stdout:gsub("\n", "")
  vim.api.nvim_buf_set_lines(0, 0, 0, false, { commit_message })
end, { buffer = true, desc = "Generate commit message with Claude" })
