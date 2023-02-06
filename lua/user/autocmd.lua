local autocmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup("user", { clear = true })

-- restore cursor
autocmd("BufReadPost", {
  group = group,
  desc = "restore cursor to last edit postion.",
  callback = function(args)
    local pos = vim.api.nvim_buf_get_mark(args.buf, '"')
    local eof = vim.api.nvim_buf_line_count(args.buf)
    if pos[1] > 0 and pos[1] <= eof then
      vim.api.nvim_win_set_cursor(0, pos)
    end
  end,
})

-- open nested fold
autocmd("BufWinEnter", {
  group = group,
  desc = "open closed fold",
  callback = function()
    local pos = vim.api.nvim_win_get_cursor(0)
    if vim.fn.foldclosed(pos[1]) > 0 then
      vim.cmd [[normal! zO]]
    end
  end,
})

-- highlight on yank
autocmd("TextYankPost", {
  group = group,
  desc = "highlight on yank",
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd({ "WinEnter", "InsertLeave" }, {
  group = group,
  command = "let &l:rnu = &l:nu && &g:rnu",
})

autocmd({ "WinLeave", "InsertEnter" }, {
  group = group,
  command = "let &l:rnu = v:false",
})

--vim.cmd([[
--    au FileType cpp nnoremap gk :call setreg('t',strftime("%c",localtime()))<CR>O /** add by zhourp <CR><SPACE>*/<esc>3h"tpko
--    au FileType c nnoremap gk :call setreg('t',strftime("%c",localtime()))<CR>O /** add by zhourp <CR><SPACE>*/<esc>3h"tpko
--    au FileType lua nnoremap gk :call setreg('t',strftime("%c",localtime()))<CR>O --\[\[ add by zhorp <CR><SPACE>\]\]--<esc>4h"tpko
--    au FileType python nnoremap gk :call setreg('t',strftime("%c",localtime()))<CR>O""" add by zhourp <CR><SPACE><CR>"""<esc>3hx<esc>k"tpko
--    au FileType sql nnoremap gk :call setreg('t',strftime("%c",localtime()))<CR>O/* add by zhourp <CR><SPACE>*/<esc>^h"tpko
--    nnoremap <silent> <F4> :UndotreeToggle<CR>
--    nnoremap <silent> gp :lua vim.lsp.buf.hover()<CR>
--]])
