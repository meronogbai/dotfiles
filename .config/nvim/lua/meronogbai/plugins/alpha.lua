return {

  'goolord/alpha-nvim',

  config = function()
    local alpha = require('alpha')

    local dashboard = require("alpha.themes.dashboard")

    -- Stolen from https://github.com/loctvl842/nvim/blob/2c5970432840c372addc39d88029611ee2684e2e/lua/tvl/config/alpha.lua#L28-L48
    dashboard.section.header.val = {
      [[  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⢠⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⡄⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣶⣿⠛⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠛⣿⣶⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣴⣶⣿⡿⣟⣽⡏⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⢹⣯⣻⢿⣿⣶⣦⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⡿⢟⣫⣵⣾⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣷⣮⣝⡻⢿⣿⣿⣷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣾⣿⣿⣿⡿⢛⣡⣶⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣶⣌⡛⢿⣿⣿⣿⣷⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣾⣿⣿⣿⣿⡿⢋⣴⣿⣿⣿⡿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢍⣧⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⢿⣿⣿⣿⣦⡙⢿⣿⣿⣿⣿⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣾⣿⣿⣿⣿⣿⡿⢋⣴⣿⣿⣿⡿⣫⣾⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⢍⣿⢹⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣷⣝⢿⣿⣿⣿⣦⡙⢿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⠟⡋⣿⠟⣡⣾⣿⣿⣿⣫⣾⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⢿⢍⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣷⣝⣿⣿⣿⣷⣌⠻⣿⢙⠻⣿⣿⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⡿⠟⢻⣿⡿⢋⣼⢣⢋⣴⣿⣿⣿⢟⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣠⣄⣀⡀⢀⣀⠀⣠⣴⠿⣏⣼⣯⣿⣧⣹⠿⣦⣄⠀⣀⡀⢀⣀⣠⣄⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⡻⣿⣿⣿⣦⡙⡞⣧⡙⢿⣿⡟⠻⢿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[  ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⡿⣫⡴⣡⣿⡿⢡⣿⡟⣡⣾⣿⣿⣿⣫⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣽⣻⠿⣿⣿⣿⣿⣾⡿⠎⣸⡿⣿⣿⢛⣇⠹⢿⣿⣿⣿⣿⣿⠿⣟⣯⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣝⣿⣿⣿⣷⣌⢻⣿⡌⢿⣿⣌⢦⣝⢿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[  ⠀⠀⠀⠀⠀⠀⠀⣴⡿⢋⣴⡿⣱⣿⡿⢡⣿⣿⣴⣿⣿⣿⡿⣱⣿⣿⣿⣿⣿⣿⠟⢿⣿⣿⣿⠻⢿⣿⣿⣿⣿⣾⣷⡹⣿⡎⣧⣿⣿⣽⣯⣿⣿⣼⡹⣿⢋⣾⣷⣿⣿⣿⣿⡿⠟⣿⣿⣿⡿⠻⣿⣿⣿⣿⣿⣿⣎⢿⣿⣿⣿⣦⣿⣿⡌⢿⣿⣎⢿⣦⡙⢿⣦⠀⠀⠀⠀⠀⠀⠀]],
      [[  ⠀⠀⠀⠀⠀⢀⣾⠟⢠⣿⣿⢱⣿⣿⢁⣾⡿⠿⢿⣿⣿⡟⠔⠉⠛⣿⣿⣿⠏⠀⠀⠀⢺⣿⠃⠀⠀⢻⣿⠛⠿⣿⣿⣿⣌⢹⣝⡮⡙⣻⣟⢋⢕⣫⡏⣡⣿⣿⣿⠿⠛⣿⡟⠀⠀⠘⣿⡗⠀⠀⠀⠹⣿⣿⣿⠛⠉⠢⢻⣿⣿⡿⠿⢟⣷⡈⣿⣿⡎⣿⣿⡄⠻⣷⡀⠀⠀⠀⠀⠀]],
      [[  ⠀⠀⠀⠀⣠⡿⠁⢀⣿⣿⢇⣿⣿⠇⠜⠁⠀⠀⣼⣿⡟⠀⠀⠀⠈⣿⡿⠃⠀⠀⠀⠀⠀⢻⠀⠀⠀⠀⢿⠀⠀⠙⣿⡟⠻⢠⢻⣿⡮⢻⡟⣵⣿⡟⡄⠟⢻⣿⠋⠀⠀⡿⠀⠀⠀⠀⡟⠀⠀⠀⠀⠀⠘⢿⣿⠁⠀⠀⠀⢻⣿⣧⠀⠀⠈⠣⠸⣿⣿⡸⣿⣿⡀⠈⢿⣄⠀⠀⠀⠀]],
      [[  ⠀⠀⠀⣰⠏⠀⢀⣾⣿⣿⢠⣿⡟⠀⠀⠀⠀⠀⣿⡟⠀⠀⠀⠀⠀⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠃ ⣿⣷⣭⣿⡩⡩⣳⣭⣾⣿ ⠘⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⠀⠀⠀⠀⠀⢻⣿⠀⠀⠀⠀⠀⢻⣿⡄⣿⣿⣷⡀⠀⠹⣆⠀⠀⠀]],
      [[  ⠀⠀⡰⠃⠀⠀⣼⣿⡿⠃⢸⣿⠃⠀⠀⠀⠀⢸⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⡟⠿⣫⣿⣿⣿⣿⣿⣯⡟⠿⢻ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡇⠀⠀⠀⠀⠘⣿⡇⠘⢿⣿⣧⠀⠀⠘⢆⠀⠀]],
      [[  ⠀⠔⠀⠀⠀⢰⣿⠟⠀⠀⢸⣿⠀⠀⠀⠀⠀⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣯⡛⣿⡿⣫⣾⡃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⠀⠀⠀⠀⠀⣿⡇⠀⠀⠻⣿⡆⠀⠀⠀⠢⠀]],
      [[  ⠀⠀⠀⠀⢀⣿⠉⠀⠀⠀⢸⣿⠀⠀⠀⠀⢰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢺⣿⡇⣿⡆⠻⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡆⠀⠀⠀⠀⣿⡇⠀⠀⠀⠉⣿⡀⠀⠀⠀⠀]],
      [[  ⠀⠀⠀⠀⣸⠏⠀⠀⠀⠀⠈⣿⠀⠀⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣞⠀⣿⡇⠰⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠃⠀⠀⠀⠀⣿⠁⠀⠀⠀⠀⠹⣇⠀⠀⠀⠀]],
      [[  ⠀⠀⠀⠀⡟⠀⠀⠀⠀⠀⠀⢻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠋⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡟⠀⠀⠀⠀⠀⠀⢿⠀⠀⠀⠀]],
      [[  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", "<cmd>ene<CR>"),
      dashboard.button("SPC f f", "  Find file"),
      dashboard.button("SPC f g", "󰍉  Live grep"),
      dashboard.button("SPC f r", "  Recent files"),
      dashboard.button("q", "󰗼  Quit", ":qa<CR>"),
    }

    dashboard.section.footer.val = "meronogbai.me"

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end
}
