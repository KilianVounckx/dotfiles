local bashls = {}

local bqnlsp = {}

local clojure_lsp = {}

local elmls = {}

local gdscript = {}

local gleam = {}

local gopls = {}

local hls = {}

local jdtls = {
    cmd = { "jdtls", "--java-executable", "/usr/lib/jvm/java-21-openjdk-amd64/bin/java" },
}

local jedi_language_server = {}

local koka = {}

local lua_ls = {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if vim.uv.fs_stat(path .. "/.luarc.json") or
                vim.uv.fs_stat(path .. "/.luarc.jsonc")
            then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend(
            "force",
            client.config.settings.Lua,
            {
                runtime = { version = "LuaJIT" },
                workspace = {
                    checkThirdParty = false,
                    library = {
                        vim.env.VIMRUNTIME,
                    },
                },
            }
        )
    end,
    settings = {
        Lua = {},
    },
}

local nushell = {}

local ols = {}

local purescriptls = {
    settings = {
        purescript = {
            formatter = "purs-tidy",
        },
    },
}

local rescriptls = {}

local roc_ls = {}

local rust_analyzer = {
    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy",
            },
        },
    },
}

local sourcekit = {}

local tinymist = {}

local ts_ls = {}

local uiua = {}

local unison = {}

local zls = {
    settings = {
        enable_build_on_save = true,
    }
}

local function on_attach(event)
    local function opts_with(opts)
        local result = { buffer = event.buf }
        for key, value in pairs(opts) do
            result[key] = value
        end
        return result
    end

    vim.keymap.set(
        "n", "<leader>k",
        "<cmd>lua vim.lsp.buf.hover()<cr>",
        opts_with({ desc = "Hover" })
    )
    vim.keymap.set(
        "n", "gd",
        "<cmd>lua vim.lsp.buf.definition()<cr>",
        opts_with({ desc = "Goto definition" })
    )
    vim.keymap.set(
        "n", "gD",
        "<cmd>lua vim.lsp.buf.declaration()<cr>",
        opts_with({ desc = "Goto declaration" })
    )
    vim.keymap.set(
        "n", "gt",
        "<cmd>lua vim.lsp.buf.type_definition()<cr>",
        opts_with({ desc = "Goto type definition" })
    )
    vim.keymap.set(
        "n", "gr",
        "<cmd>lua vim.lsp.buf.references()<cr>",
        opts_with({ desc = "Goto references" })
    )
    vim.keymap.set(
        "n", "gs",
        "<cmd>lua vim.lsp.buf.signature_help()<cr>",
        opts_with({ desc = "Show signature help" })
    )
    vim.keymap.set(
        "n", "<leader>r",
        "<cmd>lua vim.lsp.buf.rename()<cr>",
        opts_with({ desc = "Rename" })
    )
    vim.keymap.set(
        { "n", "x" }, "<F3>",
        "<cmd>lua vim.lsp.buf.format({ async = true })<cr>",
        opts_with({ desc = "Format" })
    )
    vim.keymap.set(
        { "n", "x" }, "<leader>a",
        "<cmd>lua vim.lsp.buf.code_action()<cr>",
        opts_with({ desc = "Show actions" })
    )
    vim.keymap.set(
        "n", "<leader>e",
        "<cmd>lua vim.diagnostic.open_float(nil, { focusable = true })<cr>",
        opts_with({ desc = "Show diagnostic" })
    )
    vim.keymap.set(
        "n", "]d",
        "<cmd>lua vim.diagnostic.jump({ count = 1, float = true })<cr>",
        opts_with({ desc = "Goto next diagnostic" })
    )
    vim.keymap.set(
        "n", "[d",
        "<cmd>lua vim.diagnostic.jump({ count = -1, float = true })<cr>",
        opts_with({ desc = "Goto previous diagnostic" })
    )
end

return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            { "L3MON4D3/LuaSnip" },
            -- { "PaterJason/cmp-conjure" },
        },
        event = "InsertEnter",
        config = function()
            local cmp = require("cmp")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<S-tab>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<tab>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<cr>"] = cmp.mapping.confirm({ select = false }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "conjure" },
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.lsp.inlay_hint.enable()

            local function setup(lsp, cfg)
                cfg.capabilities = capabilities
                vim.lsp.config(lsp, cfg)
                vim.lsp.enable(lsp)
            end

            setup("bashls", bashls)
            setup("bqnlsp", bqnlsp)
            setup("clojure_lsp", clojure_lsp)
            setup("elmls", elmls)
            setup("gdscript", gdscript)
            setup("gleam", gleam)
            setup("gopls", gopls)
            setup("hls", hls)
            setup("jdtls", jdtls)
            setup("jedi_language_server", jedi_language_server)
            setup("koka", koka)
            setup("lua_ls", lua_ls)
            setup("nushell", nushell)
            setup("ols", ols)
            setup("purescriptls", purescriptls)
            setup("rescriptls", rescriptls)
            setup("roc_ls", roc_ls)
            setup("rust_analyzer", rust_analyzer)
            setup("sourcekit", sourcekit)
            setup("tinymist", tinymist)
            setup("ts_ls", ts_ls)
            setup("uiua", uiua)
            setup("unison", unison)
            setup("zls", zls)

            vim.lsp.config("flix", {
                cmd = { "java", "-jar", "/home/kilianvounckx/.local/opt/flix/flix.jar", "lsp" },
                filetypes = { "flix" },
                root_dir = function(bufnr, on_dir)
                    local fname = vim.api.nvim_buf_get_name(bufnr)
                    local filetype = vim.api.nvim_buf_get_option(0, "filetype")
                    if filetype == "flix" or (filetype == "toml" and fname:match("flix%.toml$")) then
                        on_dir(vim.fs.root(fname, "flix.toml"))
                        return
                    end
                    on_dir(nil)
                end,
            })
            vim.lsp.enable("flix")

            vim.api.nvim_create_autocmd("BufWritePre", {
                desc = "LSP Format",
                callback = function(_)
                    vim.lsp.buf.format({})
                end,
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP Actions",
                callback = on_attach,
            })
        end,
    },
}
