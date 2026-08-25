local function get_plugin_name(repo)
    local name = repo:match(".*/(.*)") or repo
    name = name:gsub("%.nvim$", "")
    name = name:gsub("%.lua$", "")
    name = name:gsub("^nvim%-", "")
    return name
end

local function setup_plugin(spec)
    if type(spec) == "string" then
        vim.pack.add(spec)
        return
    end

    local repo = spec[1] or spec.dir
    if repo then
        vim.pack.add(repo)
    end

    if type(spec.dependencies) == "table" then
        for _, dep in ipairs(spec.dependencies) do
            setup_plugin(dep)
        end
    end

    if type(spec.config) == "function" then
        spec.config(spec, spec.opts)
    elseif spec.config == true or spec.opts then
        local opts = type(spec.opts) == "table" and spec.opts or {}
        local mod_name = spec.main
        if not mod_name and repo then
            mod_name = get_plugin_name(repo)
        end
        if mod_name then
            local ok, mod = pcall(require, mod_name)
            if ok and mod.setup then
                mod.setup(opts)
            else
                -- Fallback for specific names
                if mod_name == "mini.pairs" then require("mini.pairs").setup(opts) end
                if mod_name == "mini.tabline" then require("mini.tabline").setup(opts) end
                if mod_name == "mini.comment" then require("mini.comment").setup(opts) end
            end
        end
    end

    if type(spec.keys) == "table" then
        for _, key in ipairs(spec.keys) do
            local mode = key.mode or "n"
            local lhs = key[1]
            local rhs = key[2]
            local opts = { desc = key.desc, remap = key.remap, silent = key.silent, expr = key.expr }
            vim.keymap.set(mode, lhs, rhs, opts)
        end
    end
end

local specs = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    "kevinhwang91/promise-async",
    "MunifTanjim/nui.nvim",
    "wakatime/vim-wakatime",

    -- require("plugins.kanagawa-paper"),
    require("plugins.everblush"),
    require("plugins.spectre"),
    require("plugins.telescope"),
    require("plugins.sfm"),
    require("plugins.oil"),
    require("plugins.yazi"),
    require("plugins.mini-pairs"),
    require("plugins.nvim-surround"),
    require("plugins.blink-cmp"),
    require("plugins.autosave"),
    require("plugins.treesitter"),
    require("plugins.code_runner"),
    require("plugins.flash"),
    require("plugins.gitsigns"),
    require("plugins.neogit"),
    require("plugins.lspsaga"),
    require("plugins.conform"),
    require("plugins.which-key"),
    require("plugins.screenkey"),
    require("plugins.nvim-ufo"),
    require("plugins.flutter"),
    require("plugins.laravel"),
    require("plugins.hlchunk"),
    require("plugins.lualine"),
    require("plugins.colorizer"),
    require("plugins.todo-comments"),
    require("plugins.markdown-table-mode"),
    require("plugins.render-markdown"),
    require("plugins.noice"),
    require("plugins.persistance"),
}

for _, spec in ipairs(specs) do
    setup_plugin(spec)
end
