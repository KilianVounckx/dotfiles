return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            python = { "ruff", "mypy" },
        }
        local mypy_opts = { "--ignore-missing-imports", "--cache-dir=/dev/null" }
        local ruff_opts = { "--ignore=E501" }
        for _, arg in ipairs(mypy_opts) do
            table.insert(lint.linters.mypy.args, arg)
        end

        for _, arg in ipairs(ruff_opts) do
            table.insert(lint.linters.ruff.args, arg)
        end

        vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
