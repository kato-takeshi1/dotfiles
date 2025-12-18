return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set("n", "<Leader>dt", function()
      dapui.toggle()
    end, {
      desc = "Toggle DAP UI",
    })
    vim.keymap.set("n", "<Leader>dc", function()
      require("dap").continue()
    end, {
      desc = "DAP Continue",
    })
    vim.keymap.set("n", "<Leader>dl", function()
      require("dap").step_over()
    end, {
      desc = "DAP Step Over",
    })
    vim.keymap.set("n", "<Leader>di", function()
      require("dap").step_into()
    end, {
      desc = "DAP Step Into",
    })
    vim.keymap.set("n", "<Leader>dj", function()
      require("dap").step_out()
    end, {
      desc = "DAP Step Out",
    })
    vim.keymap.set("n", "<Leader>db", function()
      require("dap").toggle_breakpoint()
    end, {
      desc = "DAP Toggle Breakpoint",
    })
  end,
}
