return {
    { "gpanders/nvim-parinfer" },
    {
        enabled = false,
        "Olical/conjure",
        config = function()
            vim.g["conjure#filetypes"] = { "clojure" }
        end,
    },
    {
        "clojure-vim/vim-jack-in",
        dependencies = {
            "tpope/vim-dispatch",
            "radenling/vim-dispatch-neovim",
        }
    }
}
