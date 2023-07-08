return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    local logo = [[
 ___   __  _____        _      _ 
|_ _| / _||___ /   ___ | |__  (_)
 | | | |_   |_ \  / __|| '_ \ | |
 | | |  _| ___) || (__ | | | || |
|___||_|  |____/  \___||_| |_||_|
                                 

         [ @ifeabasi ]
    ]]
    opts.section.header.val = vim.split(logo, "\n", { trimemtpy = true })
  end,
}
