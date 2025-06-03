local PACKAGES = {
	"basedpyright",
	"bash-language-server",
	"clangd",
	"elixir-ls",
	"json-lsp",
	"lua-language-server",
	"marksman",
	"sqlls",
	"texlab",
	"typescript-language-server",
	"zls",
}

local function install(pack, version)
	local notifyOpts = { title = "Mason", icon = "", id = "mason.install" }

	local msg = version and ("[%s] updating to %s…"):format(pack.name, version)
		or ("[%s] installing…"):format(pack.name)
	vim.defer_fn(function()
		vim.notify(msg, nil, notifyOpts)
	end, 0)

	pack:once("install:success", function()
		local msg2 = ("[%s] %s"):format(pack.name, version and "updated." or "installed.")
		notifyOpts.icon = " "
		vim.defer_fn(function()
			vim.notify(msg2, nil, notifyOpts)
		end, 0)
	end)

	pack:once("install:failed", function()
		local error = "Failed to install [" .. pack.name .. "]"
		vim.defer_fn(function()
			vim.notify(error, vim.log.levels.ERROR, notifyOpts)
		end, 0)
	end)

	pack:install({ version = version })
end

local function syncPackages(ensurePacks)
	local masonReg = require("mason-registry")

	local function refreshCallback()
		-- Auto-install missing packages & auto-update installed ones
		vim.iter(ensurePacks):each(function(packName)
			local name, pinnedVersion = packName:match("([^@]+)@?(.*)")
			if not masonReg.has_package(name) then
				return
			end
			local pack = masonReg.get_package(name)
			if pack:is_installed() then
				if pinnedVersion == "" then
					local latest_version = pack:get_latest_version()
					if latest_version and latest_version ~= pack:get_installed_version() then
						local msg = ("[%s] updating to %s…"):format(pack.name, latest_version)
						vim.defer_fn(function()
							vim.notify(msg, nil, { title = "Mason", icon = "󰅗" })
						end, 0)
						pack:install({ version = latest_version })
					end
				end
			else
				install(pack, pinnedVersion ~= "" and pinnedVersion or nil)
			end
		end)

		-- Auto-clean unused packages
		local installedPackages = masonReg.get_installed_package_names()
		vim.iter(installedPackages):each(function(packName)
			local isEnsured = vim.iter(ensurePacks):any(function(ensurePack)
				local name = ensurePack:match("([^@]+)")
				return name == packName
			end)

			if not isEnsured then
				masonReg.get_package(packName):uninstall()
				local msg = ("[%s] uninstalled."):format(packName)
				vim.defer_fn(function()
					vim.notify(msg, nil, { title = "Mason", icon = "󰅗" })
				end, 0)
			end
		end)
	end

	masonReg.refresh(refreshCallback)
end

return {
	"williamboman/mason.nvim",
	event = "VeryLazy",
	enabled = not vim.g.vscode,
	init = function()
		-- Make mason packages available before loading it; allows to lazy-load mason
		vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH
		-- Do not crowd home directory with NPM cache folder
		vim.env.npm_config_cache = vim.env.HOME .. "/.cache/npm"
	end,
	config = function(_, opts)
		require("mason").setup(opts)
		local packages = {}
		for _, package in ipairs(PACKAGES) do
			table.insert(packages, package)
		end

		vim.defer_fn(function()
			syncPackages(packages)
		end, 3000)
	end,

	-- 		local lspconfig = require("lspconfig")
	-- 		local util = require("lspconfig/util")
	-- 		local capabilities = vim.lsp.protocol.make_client_capabilities()
	-- 		capabilities.textDocument.publishDiagnostics = {
	-- 			relatedInformation = true,
	-- 		}
	--
	-- 		lspconfig.sourcekit.setup({
	-- 			capabilities = capabilities,
	-- 			root_dir = function(fname)
	-- 				return util.root_pattern("Package.swift", "*.xcodeproj")(fname)
	-- 					or vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
	-- 			end,
	-- 			on_attach = function(_, _)
	-- 				local function buf_set_option(...) end
	-- 				buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
	-- 			end,
	-- 		})
}
