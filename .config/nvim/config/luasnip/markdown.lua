local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node

local fn_tb = function(args)
    if string.len(args[1][1]) == 0 or string.len(args[2][1]) == 0 then
        return sn(nil, {})
    end

    local row = args[1][1] + 0
    local column = args[2][1] + 0

    local nodes = {
        t('|'),
    }

    for idx = 1, column do
        vim.list_extend(nodes, {
            t ' ', i(idx), t ' |'
        })
    end
    vim.list_extend(nodes, {
        t { '', '|' },
    })
    for _ = 1, column do
        vim.list_extend(nodes, {
            t ' :---: |'
        })
    end
    for idx_r = 1, row do
        vim.list_extend(nodes, {
            t { '', '|' },
        })
        local idx0 = column * idx_r
        for idx_c = idx0 + 1, idx0 + column do
            vim.list_extend(nodes, {
                t ' ', i(idx_c), t ' |',
            })
        end
    end

    return sn(nil, nodes)
end

return {
    s('img', {
        t '![', i(1), t '](', i(2), t ')', i(0),
    }),
    s('*', {
        t '*', i(1), t '*', i(0),
    }),
    s('**', {
        t '**', i(1), t '**', i(0),
    }),
    s('***', {
        t '***', i(1), t '***', i(0),
    }),
    s('`', {
        t '`', i(1), t '`', i(0),
    }),
    s('```', {
        t '```', i(1),
        t { '', '' }, i(0),
        t '```',
    }),
    s('table', {
        d(3, fn_tb, { 1, 2 }),
        t { '', 'row: ' }, i(1), t ', column: ', i(2), i(0),
    })
}
