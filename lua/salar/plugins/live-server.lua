return {
  "barrett-ruth/live-server.nvim",
  build = "npm i -g live-server", -- Automates Step 1
  cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },
  config = true,
}
