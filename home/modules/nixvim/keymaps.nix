{...}: {
    programs.nixvim.keymaps = [

    # -- Save -- #
    {
        mode = "n";
        key = "<C-s>";
        action = "<cmd>w<CR>";
    }

    # -- Buffers -- #
    {
        mode = "n";
        key = "<Tab>";
        action = "<cmd>bn<CR>";
    }
    {
        mode = "n";
        key = "<S-Tab>";
        action = "<cmd>bp<CR>";
    }
    {
        mode = "n";
        key = "<C-c>";
        action = "<cmd>bd<CR>";
    }

    # -- Terminal -- #
    {
        mode = "n";
        key = "<leader>t";
        action.__raw = ''
            function()
                local found = false
                local buffers = vim.api.nvim_list_bufs()
                for _, bufid in pairs(buffers) do
                    local buftype = vim.api.nvim_buf_get_option(bufid, 'buftype')
                    if buftype == "terminal" then
                        found = true
                        vim.cmd("buffer " .. bufid)
                    end
                end
                if (found == false) then
                    vim.cmd('terminal')
                end
            end
        '';
    }
    {
        mode = "t";
        key = "<Esc>";
        action = "<C-\\><C-n>";
    }

    # -- Diagnostics -- #
    {
        mode = "n";
        key = "<C-g>";
        action.__raw = "vim.diagnostic.open_float";
    }
    ];
}
