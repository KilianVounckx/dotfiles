return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                python = { "black" },
            },
        })
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.py",
            callback = function(args)
                require("conform").format({ bufnr = args.buf })
            end,
        })
    end,
}
