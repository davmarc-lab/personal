return {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
    keys = {
        { "<leader>ut", "<cmd>lua require('undotree').toggle()<cr>" },
    },
}
