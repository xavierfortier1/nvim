return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "j-hui/fidget.nvim",
        },
        config = function()
            local cmp = require("cmp")
            local cmp_lsp = require("cmp_nvim_lsp")
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_lsp.default_capabilities()
            )
            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP actions",
                callback = function(event)
                    local opts = { buffer = event.buf }
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, opts)
                end,
            })

            require("fidget").setup()
            require("mason").setup()

            local lspconfig = require("lspconfig")
            require("mason-lspconfig").setup({
                ensure_installed = { "clangd", "lua_ls", "neocmake", "taplo", "yamlls", "ruff", "pyright" },
                handlers = {
                    function(server_name)
                        lspconfig[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,
                    neocmake = function()
                        local cmake_capabilities = capabilities
                        cmake_capabilities.textDocument.completion.completionItem.snippetSupport = true

                        lspconfig.neocmake.setup({
                            capabilities = cmake_capabilities,
                        })
                    end,
                    lua_ls = function()
                        lspconfig.lua_ls.setup({
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                    },
                                },
                            },
                        })
                    end,
                    ruff = function()
                        local ruff_capabilities = capabilities
                        ruff_capabilities.hoverProvider = false

                        lspconfig.ruff.setup({
                            capabilities = ruff_capabilities,
                        })
                    end,
                    lspconfig.pyright.setup({
                        settings = {
                            pyright = {
                                disableOrganizeImports = true,
                            },
                            python = {
                                analysis = {
                                    ignore = { "*" },
                                },
                            },
                        },
                    }),
                },
            })

            local cmp_select = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                }),
            })

            vim.diagnostic.config({
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })
        end,
    },
}
