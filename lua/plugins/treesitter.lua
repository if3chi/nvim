return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {"lua", "javascript", "html", "php"},
            highlight = {
                enable = true
            },
            indent = {
                enable = true
            }
        })
    end
}
