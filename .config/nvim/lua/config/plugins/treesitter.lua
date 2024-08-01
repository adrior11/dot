return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            -- Ensure opts.ensure_installed is not nil
            opts.ensure_installed = opts.ensure_installed or {}

            -- Add languages to ensure_installed
            local languages = {
                "vimdoc",
                "javascript",
                "typescript",
                "c",
                "lua",
                "rust",
                "jsdoc",
                "bash",
                "json",
                "gitignore",
                "dockerfile",
                "vim",
                "bash",
                "markdown",
                "markdown_inline",
            }
            vim.list_extend(opts.ensure_installed, languages)
        end,
    },
    { 
        "IndianBoy42/tree-sitter-just", 
        event = "BufRead justfile", 
        opts = {} 
    },
    {
        "Samonitari/tree-sitter-caddy",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        opts = function(_, opts)
            require("nvim-treesitter.parsers").get_parser_configs().caddy = {
                install_info = {
                    url = "https://github.com/Samonitari/tree-sitter-caddy.git",
                    files = { "src/parser.c", "src/scanner.c" },
                    branch = "master",
                },
                filetype = "caddy",
            }

            -- Ensure opts.ensure_installed is not nil
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { "caddy" })

            -- Add custom filetypes
            vim.filetype.add({
                pattern = {
                    ["Caddyfile"] = "caddy",
                },
            })
        end,
        event = "BufRead Caddyfile",
    },
}
