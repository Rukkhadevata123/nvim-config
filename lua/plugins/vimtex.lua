return {

    "lervag/vimtex",
    lazy = false,
    init = function()
        -- VimTeX configuration goes here, e.g.
        vim.g.vimtex_view_method = "zathura"

        vim.g.vimtex_view_general_viewer = 'zathura'
        vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
        vim.g.vimtex_compiler_method = 'latexmk'
    end

}
