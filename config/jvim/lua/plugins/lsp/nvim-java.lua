return {
    "nvim-java/nvim-java",
    config = function()
        require("java").setup()
        vim.lsp.enable("jdtls")
    end,
}

-- return {
--     "mfussenegger/nvim-jdtls",
--     {
--         "williamboman/mason.nvim",
--         opts = {
--             ensure_installed = { "jdtls" },
--         },
--     },
--     {
--         "JavaHello/spring-boot.nvim",
--         ft = { "java", "yaml", "jproperties" },
--         opts = function()
--             local home = os.getenv("HOME")
--             -- mason for sonarlint-language path
--             local mason_registery_status = pcall(require, "mason-registry")
--             if not mason_registery_status then
--                 vim.notify("Mason registery not found", vim.log.levels.ERROR, { title = "Spring boot" })
--                 return
--             end
--
--             local opts = {}
--             -- opts.ls_path = mason_registery.get_package("spring-boot-tools"):get_install_path()
--             -- 	.. "/extension/language-server"
--
--             -- /Users/jgarcia/.local/share/nvim/mason/packages/spring-boot-tools/extension/language-server/spring-boot-language-server-1.59.0-SNAPSHOT-exec.jar
--             opts.ls_path = os.getenv("MASON")
--                 .. "/packages/vscode-spring-boot-tools/extension/language-server/spring-boot-language-server-1.63.0-SNAPSHOT-exec.jar"
--             -- print("jdtls opts.ls_path: ", opts.ls_path)
--
--             -- jdtls opts.ls_path:  /Users/jgarcia/.local/share/nvim/mason/packages/spring-boot-tools/extension/language-server
--             -- opts.ls_path = "/home/sangram/.vscode/extensions/vmware.vscode-spring-boot-1.55.1"
--             -- vim.notify("spring boot ls path : " .. opts.ls_path, vim.log.levels.INFO, {title = "Spring boot"})
--             opts.java_cmd = "java"
--             -- opts.exploded_ls_jar_data = true
--             opts.jdtls_name = "jdtls"
--             opts.log_file = home .. "/.local/state/jvim/spring-boot-ls.log"
--             return opts
--         end,
--     },
-- }
