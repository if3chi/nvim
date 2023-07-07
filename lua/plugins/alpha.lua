return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    local logo = [[
              [ @ifeabasi ]
    ]]
    opts.section.header.val = vim.split(logo, "\n", { trimepty = true })
  end,
}
