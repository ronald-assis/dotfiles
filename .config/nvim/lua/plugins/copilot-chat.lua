return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
    },

    keys = {
      { "<leader>cc", ":CopilotChat<CR>",              mode = "n", desc = "Open CopilotChat" },
      { "<leader>cs", ":CopilotChat<CR>",              mode = "v", desc = "Chat with selection" },
      { "<leader>ce", ":CopilotChatExplain<CR>",       mode = "v", desc = "Explain selection" },
      { "<leader>cr", ":CopilotChatRefactor<CR>",      mode = "v", desc = "Refactor selection" },
      { "<leader>ct", ":CopilotChatGenerateTests<CR>", mode = "v", desc = "Generate Tests" },
      { "<leader>cf", ":CopilotChatFix<CR>",           mode = "v", desc = "Fix selection" },
      { "<leader>co", ":CopilotChatOptimize<CR>",      mode = "v", desc = "Optimize selection" },
      { "<leader>cm", ":CopilotChatCommit<CR>",        mode = "n", desc = "Generate Commit Message" },
    },
  },
}
