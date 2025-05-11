-- vim-options.lua

-- Líder

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Opções
local opt = vim.opt

-- Indentação
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

-- Interface
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.termguicolors = true

-- Comportamento de busca
opt.hlsearch = false       -- não destaca todas ocorrências após a busca
opt.incsearch = true       -- busca incremental
opt.ignorecase = true      -- ignora maiúsculas/minúsculas
opt.smartcase = true       -- sensível se tiver letra maiúscula
opt.timeoutlen = 1000      -- tempo para reconhecer mapeamentos em ms

-- Atalhos (vim.keymap.set é o recomendado)
vim.keymap.set("i", "jj", "<Esc>", { noremap = true })

-- Simulando alguns atalhos do .ideavimrc (substituir por plugins ou comandos reais)
-- Esses abaixo são placeholders, você pode configurar com plugins como telescope, lspconfig etc.
vim.keymap.set("n", "<leader>d", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Ir para definição" })
vim.keymap.set("n", "<leader>i", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Ir para implementação" })
vim.keymap.set("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Renomear símbolo" })
vim.keymap.set("n", "<leader>b", "<cmd>lua vim.cmd('normal ``')<CR>", { desc = "Voltar para última posição" })
