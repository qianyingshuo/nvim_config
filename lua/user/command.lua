local command = vim.api.nvim_create_user_command

command("FormatSync", function() return vim.lsp.buf.format({async = true}) end, {
  desc = "format use lsp with sync.",
  force = true,
})
