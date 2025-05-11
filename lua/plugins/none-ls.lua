return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "gbprod/none-ls-shellcheck.nvim", -- shellcheck
    "nvimtools/none-ls-extras.nvim", -- eslint_d
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -------------------        LUA       ------------------------
        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.diagnostics.selene,
        --  diagnostics -- ***WE USE lua_ls**
        ----------------                              ----------------


        -------------------        BASH       ------------------------
        null_ls.builtins.formatting.shfmt,
        require("none-ls-shellcheck.diagnostics"),
        require("none-ls-shellcheck.code_actions"),
        ----------------                              ----------------

          -------------------        TS | JS       ------------------------
        -- formatting: PRETTIER FORMATTER
        require("none-ls.diagnostics.eslint_d"), -- TS | JS
        require("none-ls.code_actions.eslint_d"),
        require("none-ls.formatting.beautysh"),
        require("none-ls.formatting.eslint_d"),
        require("none-ls.formatting.jq"),
        ----------------                              ----------------

         -------------------        CSS       ------------------------
        null_ls.builtins.diagnostics.stylelint, -- CSS
        ----------------                              ----------------

        -------------------        GO       ------------------------
        --null_ls.builtins.diagnostics.staticcheck,
        --null_ls.builtins.formatting.asmfmt,
        ----------------                              ----------------

         -------------------        PHP       ------------------------
        --null_ls.builtins.diagnostics.phpstan,
        --null_ls.builtins.formatting.phpcsfixer,
        ----------------                              ----------------

        -------------------        FISH       ------------------------
        --null_ls.builtins.diagnostics.fish,
        ----------------                              ----------------

        -------------------        PYTHON       ------------------------
        null_ls.builtins.formatting.black,--I was having trouble installing Black and isort on WSL, but what saved me was running sudo apt install python3.10-venv in the terminal. 
        -- null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.flake8,
        ----------------                              ----------------


        -------------------        RUBY       ------------------------
        null_ls.builtins.formatting.rubocop,
        null_ls.builtins.diagnostics.rubocop,
        ----------------                              ----------------


        -----------------        XML       ------------------------
        null_ls.builtins.formatting.tidy.with({
          filetypes = { "xml" },
        }),
        null_ls.builtins.diagnostics.tidy.with({
          filetypes = { "xml" },
        }),
        ----------------                              ----------------


        -------------------        SQL       ------------------------
        -- null_ls.builtins.formatting.sql_formatter, -- WORKS BUT NO LSP ELSE BREAKS
        null_ls.builtins.formatting.pg_format, -- WORKS BUT NO LSP ELSE BREAKS
        ----------------                              ----------------


        -------------------        PRETTIER FORMATTER       ------------------------
        null_ls.builtins.formatting.prettierd.with({
          filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "css",
            "scss",
            "less",
            "html",
            "json",
            "jsonc",
            "yaml",
            "markdown",
            "markdown.mdx",
            "graphql",
            "handlebars",
          },
          extra_filetypes = { "toml", "svelte" },
        }),
        ----------------                              ----------------

      },
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
