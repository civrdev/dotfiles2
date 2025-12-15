return {
	"neovim/nvim-lspconfig",
	lazy = false,

	config = function()
		local signs = {
			Error = " ",
			Warn  = " ",
			Hint  = " ",
			Info  = " ",
		}

		local function disable_semantic_tokens(client)
			if client.server_capabilities.semanticTokensProvider then
				client.server_capabilities.semanticTokensProvider = nil
			end
		end

		local function on_attach(client, bufnr)
			disable_semantic_tokens(client)
		end

		local runtime_paths = {
			vim.env.VIMRUNTIME,
			vim.fn.stdpath("data") .. "/site/pack/*/start/*",
			vim.fn.stdpath("data") .. "/site/pack/*/opt/*",
		}

		-- clangd
		vim.lsp.config("clangd", {
			on_attach = on_attach,
		})

		-- lua_ls
		vim.lsp.config("lua_ls", {
			on_attach = on_attach,
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = { globals = { "vim" } },
					workspace = {
						library = runtime_paths,
						checkThirdParty = false,
					},
					telemetry = { enable = false },
				},
			},
		})

		vim.lsp.config("marksman", {
			on_attach = on_attach,
		})

		vim.lsp.enable("clangd")
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("marksman")
	end,
}
