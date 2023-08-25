local fr = 'fcitx5-remote'

if os.getenv('SSH_TTY') ~= nil then
    return
end

local os_name = vim.loop.os_uname().sysname
if (os_name == 'Linux') and os.getenv('DISPLAY') == nil and os.getenv('WAYLAND_DISPLAY') == nil then
    return
end

function _Fcitx2En()
    local input_status = tonumber(vim.fn.system(fr))
    if input_status == 2 then
        vim.fn.system(fr .. ' -c')
        vim.b.input_toggle_flag = true
    end
end

function _Fcitx2NonLatin()
    if vim.b.input_toggle_flag == nil then
        vim.b.input_toggle_flag = false
    elseif vim.b.input_toggle_flag == true then
        vim.fn.system(fr .. ' -o')
        vim.b.input_toggle_flag = false
    end
end

vim.cmd [[
    augroup fcitx
        au InsertEnter * :lua _Fcitx2NonLatin()
        au InsertLeave * :lua _Fcitx2En()
        au CmdlineEnter [/\?] :lua _Fcitx2NonLatin()
        au CmdlineLeave [/\?] :lua _Fcitx2En()
]]
