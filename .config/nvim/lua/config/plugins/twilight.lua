return {
    "folke/twilight.nvim",
    opts = {
        {
          dimming = {
              alpha = 0.25,
              color = { "Normal", "#ffffff" },
              term_bg = "#000000",
              inactive = false,
          },
          context = 10,
          treesitter = true,
          expand = {
              "function",
              "method",
              "table",
              "if_statement",
          },
          exclude = {},
        }
    },
    keys = {
        {
          "<leader>zt",
          "<cmd>Twilight<CR>",
          desc = "ZenMode",
        },
    }
}
