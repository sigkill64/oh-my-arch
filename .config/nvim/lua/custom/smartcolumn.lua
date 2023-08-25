local config = {
    colorcolumn = 80,
    disabled_filetypes = { "help", "text", "markdown" },
}

local function is_disabled()
    local current_filetype = vim.api.nvim_buf_get_option(0, "filetype")
    for _, filetype in pairs(config.disabled_filetypes) do
        if filetype == current_filetype then
            return true
        end
    end
    return false
end

local function detect()
    -- limit to window
    local lines = vim.api.nvim_buf_get_lines(0, vim.fn.line("w0")-1,
        vim.fn.line("w$"), true)
    -- limit to line
    --local lines = { vim.api.nvim_get_current_line() },
    -- no limit
    --local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true),
    local max_column = 0
    for _, line in pairs(lines) do
        max_column = math.max(max_column, vim.fn.strdisplaywidth(line))
    end

    local current_buf = vim.api.nvim_get_current_buf()
    local windows = vim.api.nvim_list_wins()
    for _, window in pairs(windows) do
        if vim.api.nvim_win_get_buf(window) == current_buf then
            if not is_disabled() and max_column > config.colorcolumn then
                vim.api.nvim_win_set_option(window, "colorcolumn",
                    tostring(config.colorcolumn))
            else
                vim.api.nvim_win_set_option(window, "colorcolumn", "")
            end
        end
    end
end

vim.api.nvim_create_autocmd(
    { "BufEnter", "CursorMoved", "CursorMovedI" },
    { callback = detect }
)
