return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_compiler_latexmk = {
            out_dir = "build",
        }
        vim.g.vimtex_syntax_custom_envs = {
            { name = "ceq", math = true },
        }
    end,
}
