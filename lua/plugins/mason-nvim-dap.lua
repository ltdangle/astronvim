return {
  "jay-babu/mason-nvim-dap.nvim",
  opts = {
    handlers = {
      php = function(source_name)
        local dap = require "dap"
        dap.adapters.php = {
          type = "executable",
          command = "node",
          args = { "/Users/dangle/tmp/php/vscode-php-debug/out/phpDebug.js" },
        }

        dap.configurations.php = {
          {
            type = "php",
            request = "launch",
            name = "Xdebug Astro",
            port = 9003,
          },
        }
      end,
    },
  },
}
