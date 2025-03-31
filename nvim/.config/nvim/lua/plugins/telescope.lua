local is_inside_work_tree = {}

local function project_files()
    local cwd = vim.fn.getcwd()
    if is_inside_work_tree[cwd] == nil then
        vim.fn.system("git rev-parse --is-inside-work-tree")
        is_inside_work_tree[cwd] = vim.v.shell_error == 0
    end
    if is_inside_work_tree[cwd] then
        require("telescope.builtin").git_files({ show_untracked = true })
    else
        require("telescope.builtin").find_files()
    end
end

return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<leader>f",
            project_files,
            mode = "n",
            desc = "Telescope find files",
        },
        {
            "<leader>s",
            "<cmd>Telescope live_grep<cr>",
            mode = "n",
            desc = "Telescope live grep search",
        },
        {
            "<leader>b",
            "<cmd>Telescope buffers<cr>",
            mode = "n",
            desc = "Telescope buffers",
        },
        {
            "<leader>h",
            "<cmd>Telescope help_tags<cr>",
            mode = "n",
            desc = "Telescope help tags",
        },
    },
}
