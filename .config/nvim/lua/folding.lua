function Foldtext()
  local line = vim.fn.getline(vim.v.foldstart)
  local count = vim.v.foldend - vim.v.foldstart + 1
  return string.format("%s (%d lines folded)", line, count)
end

vim.opt.fillchars = { fold = " " } -- 折りたたんだときの余白の表示に使われる文字をスペースにする
vim.opt.foldignore = "" -- デフォルトでは "#" となっているが、コメント行が折りたためなくなるため無効化
vim.opt.foldlevel = 99
vim.opt.foldmethod = "indent"
vim.opt.foldtext = "v:lua.Foldtext()" -- 折りたたんだときの表示をカスタマイズ
