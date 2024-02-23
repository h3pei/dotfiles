local rspec = require("rspec")

rspec.setup()

-- RSpecJump
vim.api.nvim_create_user_command("RJ", function(args)
  rspec.jump({ force = args.bang })
end, { bang = true })
