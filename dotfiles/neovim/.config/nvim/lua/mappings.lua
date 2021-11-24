local map = require("utils").map

-- disable dead keys
map("n", "<Up>", "<Nop>", { noremap = true, silent = true })
map("n", "<Down>", "<Nop>", { noremap = true, silent = true })
map("n", "<Left>", "<Nop>", { noremap = true, silent = true })
map("n", "<Right>", "<Nop>", { noremap = true, silent = true })
map("n", "Q", "<Nop>", { noremap = true, silent = true })
map("n", "<C-z>", "<Nop>", { noremap = true, silent = true })

-- open nvim config
map("n", "<Leader>rc", ":e $MYVIMRC<CR>", { noremap = true })

-- keep visual selection when indenting
map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })

-- deal with clipboard
map("n", "<Leader>y", '"+y')
map("v", "<Leader>y", '"+y')
map("n", "<Leader>p", '"+p')
map("v", "<Leader>p", '"+p')

-- search and replace the word under cursor
map("n", "<Leader>*", ":%s/<C-r><C-w>//<Left>")
