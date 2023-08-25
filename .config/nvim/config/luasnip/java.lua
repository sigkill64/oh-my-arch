local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

local fn_cp = function(args)
    return args[1][1]
end

local jdocsnip = function(args, _, old_state)
    local nodes = {
        t({ "/**", " * " }),
        i(1, "A short Description"),
        t({ "", "" }),
    }

    -- These will be merged with the snippet; that way, should the snippet be updated,
    -- some user input eg. text can be referred to in the new snippet.
    local param_nodes = {}

    if old_state then
        nodes[2] = i(1, old_state.descr:get_text())
    end
    param_nodes.descr = nodes[2]

    -- At least one param.
    if string.find(args[2][1], ", ") then
        vim.list_extend(nodes, { t({ " * ", "" }) })
    end

    local insert = 2
    for indx, arg in ipairs(vim.split(args[2][1], ", ", true)) do
        -- Get actual name parameter.
        arg = vim.split(arg, " ", true)[2]
        if arg then
            local inode
            -- if there was some text in this parameter, use it as static_text for this new snippet.
            if old_state and old_state[arg] then
                inode = i(insert, old_state["arg" .. arg]:get_text())
            else
                inode = i(insert)
            end
            vim.list_extend(
                nodes,
                { t({ " * @param " .. arg .. " " }), inode, t({ "", "" }) }
            )
            param_nodes["arg" .. arg] = inode

            insert = insert + 1
        end
    end

    if args[1][1] ~= "void" then
        local inode
        if old_state and old_state.ret then
            inode = i(insert, old_state.ret:get_text())
        else
            inode = i(insert)
        end

        vim.list_extend(
            nodes,
            { t({ " * ", " * @return " }), inode, t({ "", "" }) }
        )
        param_nodes.ret = inode
        insert = insert + 1
    end

    if vim.tbl_count(args[3]) ~= 1 then
        local exc = string.gsub(args[3][2], " throws ", "")
        local ins
        if old_state and old_state.ex then
            ins = i(insert, old_state.ex:get_text())
        else
            ins = i(insert)
        end
        vim.list_extend(
            nodes,
            { t({ " * ", " * @throws " .. exc .. " " }), ins, t({ "", "" }) }
        )
        param_nodes.ex = ins
        insert = insert + 1
    end

    vim.list_extend(nodes, { t({ " */" }) })

    local snip = sn(nil, nodes)
    -- Error on attempting overwrite.
    snip.old_state = param_nodes
    return snip
end

return {
    s('main', {
        t { 'public static void main(String[] args) {', '\t' },
        i(0), t { '', '}' },
    }),

    s('pf', {
        t 'public final ', i(1, 'int'), t ' ', i(2, 'v'), t ' = ', i(3), t ';', i(0),
    }),
    s('psf', {
        t 'public static final ', i(1, 'int'), t ' ', i(2, 'v'), t ' = ', i(3), t ';', i(0),
    }),

    s('sout', {
        t 'System.out.println("', i(1), t '");', i(0),
    }),
    s('souf', {
        t 'System.out.printf("', i(1), t '");', i(0),
    }),

    s('for', {
        t 'for (', i(1, 'EXPR'), t { ') {', '\t' },
        i(0), t { '', '}' },
    }),
    s('fori', {
        t 'for (',
        i(1, 'i'), t ' = ', i(2, '0'), t '; ',
        f(fn_cp, 1), t ' < ', i(3, 'end'), t '; ',
        f(fn_cp, 1), t { '++)', '\t' },
        i(0), t { '', '}' },
    }),
    s('while', {
        t 'while (', i(1, 'EXPR'), t { ') {', '\t' },
        i(0), t { '', '}' },
    }),

    s('if', {
        t 'if (', i(1, 'EXPR'), t { ') {', '\t' },
        i(0), t { '', '}' },
    }),
    s('elif', {
        t 'else if (', i(1, 'EXPR'), t { ') {', '\t' },
        i(0), t { '', '}' },
    }),
    s('inst', {
        t 'if (', i(1, 'EXPR'), t ' instanceof ', i(2, 'TYPE'), t { ') {', '\t' },
        f(fn_cp, { 2 }), t ' ', i(3, 'VAR'), t ' = (', f(fn_cp, { 2 }), t ')', f(fn_cp, { 1 }), t { ';', '\t' },
        i(0), t { '', '}' },
    }),

    s('try', {
        t { 'try {', '\t' },
        i(1),
        t { '', '} catch {', '\t' },
        i(0), t { '', '}' },
    }),
    s('trs', {
        t 'try (', i(1, 'TYPE'), t ' ', i(2, 'v'), t ' = ', i(3, 'INIT'), t { ') {', '\t' },
        i(4),
        t { '', '} catch {', '\t' },
        i(0), t { '', '}' },
    }),

    s("fn", {
        d(6, jdocsnip, { 2, 4, 5 }),
        t { '', '' }, i(1, 'public '), i(2, 'void'), t ' ', i(3, "myFunc"), t "(", i(4), t ")", i(5), t({ " {", "\t" }),
        i(0), t { '', '}' },
    }),
}
