-- https://www.youtube.com/watch?v=5PIiKDES_wc&ab_channel=TJDeVries

local state = {
    floating = {
        buf = -1,
        win = -1,
    },
}

local function create_floating_window(opts)
    opts = opts or {}
    local width = opts.width or math.floor(vim.o.columns * 0.8)
    local height = opts.height or math.floor(vim.o.lines * 0.8)

    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    local buf = nil
    if vim.api.nvim_buf_is_valid(state.floating.buf) then
        buf = state.floating.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end

    local win_config = {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal",
        border = "rounded",
    }

    local win = vim.api.nvim_open_win(buf, true, win_config)

    return { buf = buf, win = win }
end

local function toggle_terminal()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = create_floating_window({
            buf = state.floating.buf,
        })
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd.terminal()
        end
        vim.cmd("normal i")
    else
        vim.api.nvim_win_hide(state.floating.win)
    end
end

local function clear_terminal()
    local old_scrollback = vim.opt_local.scrollback
    vim.opt_local.scrollback = 1
    vim.api.nvim_command("startinsert")
    vim.api.nvim_feedkeys("clear", "t", false)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<cr>", true, false, true), "t", true)
    vim.opt_local.scrollback = old_scrollback
end

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})
vim.keymap.set({ "n", "t" }, "<leader>tt", toggle_terminal)
vim.keymap.set(
    "t",
    "<leader>cc",
    clear_terminal
)

vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>")
