return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
   	"nvim-treesitter/nvim-treesitter",
   	opts = {
   		ensure_installed = {
   			"vim", "lua", "vimdoc",
        "html", "css", "java"
   		},
   	},
   },

--[[
  {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  config = function()
    local home = os.getenv("HOME")
    local jdtls_path = home .. "/.local/share/nvim/mason/packages/jdtls"
    local jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

    local config = {
      cmd = {
        home .. "/.sdkman/candidates/java/current/bin/java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xms1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-jar", jar,
        "-configuration", jdtls_path .. "/config_linux",
        "-data", home .. "/.local/share/nvim/jdtls/workspace"
      },
      settings = {
        java = {
          home = home .. "/.sdkman/candidates/java/current"
        }
      },
      root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml" }),
    }

    require("jdtls").start_or_attach(config)
  end,
  },

]]
}
