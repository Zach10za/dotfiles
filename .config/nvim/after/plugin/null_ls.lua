--[[
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.pylint.with({
            diagnostic_config = {
                underline = true,
                virtual_text = true,
                signs = false,
            },
            method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
        }),
    },
})
]]--
