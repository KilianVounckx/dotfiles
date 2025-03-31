local WIDTH_RATIO = 0.8
local HEIGHT_RATIO = 0.5

return {
    "nvim-tree/nvim-tree.lua",
    opts = {
        view = {
            float = {
                enable = true,
                open_win_config = function()
                    local screen_width = vim.opt.columns:get()
                    local screen_height = vim.opt.lines:get() - vim.opt.cmdheight:get()
                    local window_width = screen_width * WIDTH_RATIO
                    local window_height = screen_height * HEIGHT_RATIO
                    local window_width_int = math.floor(window_width)
                    local window_height_int = math.floor(window_height)
                    local center_x = (screen_width - window_width) / 2
                    local center_y = (vim.opt.lines:get() - window_height) / 2 - vim.opt.cmdheight:get()
                    return {
                        border = "rounded",
                        relative = "editor",
                        row = center_y,
                        col = center_x,
                        width = window_width_int,
                        height = window_height_int,
                    }
                end,
            },
            width = function()
                return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
            end
        },
    },
    keys = {
        { "<leader>t", "<cmd>NvimTreeToggle<cr>", desc = "Open File Tree" },
    }
}
