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
            name = "Astro xdebug port 9003 (web)",
            port = 9003,
          },
          {
            -- run php script like this:$ php -dxdebug.client_port=9004 myscript.php
            type = "php",
            request = "launch",
            name = "Astro xdebug port 9004 (cli)",
            port = 9004,
          },
        }
      end,
    },
  },
}
