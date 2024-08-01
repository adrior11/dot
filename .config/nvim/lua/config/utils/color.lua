local M = {}

function M.fg(name)
    return function()
        local hl = vim.api.nvim_get_hl_by_name(name, true)
        local fg = hl.foreground
        return fg and { fg = string.format("#%06x", fg) } or nil
    end
end

return M
