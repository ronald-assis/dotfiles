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
      { "<leader>ce", ":CopilotChatExplain<CR>",       mode = "v", desc = "Explain Code" },
      { "<leader>cr", ":CopilotChatRefactor<CR>",      mode = "v", desc = "Refactor Code" },
      { "<leader>cg", ":CopilotChatGenerateTests<CR>", mode = "v", desc = "Generate Tests" },
      { "<leader>cf", ":CopilotChatFix<CR>",           mode = "v", desc = "Fix Code" },
      { "<leader>co", ":CopilotChatOptimize<CR>",      mode = "v", desc = "Optimize Code" },
      { "<leader>cm", ":CopilotChatCommit<CR>",        mode = "n", desc = "Generate Commit Message" },
    },
  },
}
