function _G.ReloadConfig()
    -- Clear all existing keymaps
    vim.cmd('silent! delcommand!')
    vim.cmd('silent! delmarks!')

    -- Clear existing keymaps
    for _, mode in ipairs({ 'n', 'v', 'i', 'x', 's', 'o', 'c', 't' }) do
        local maps = vim.api.nvim_get_keymap(mode)
        for _, map in ipairs(maps) do
            vim.api.nvim_del_keymap(mode, map.lhs)
        end
    end

    -- Clear user-defined commands
    for _, cmd in ipairs(vim.api.nvim_get_commands({})) do
        vim.api.nvim_del_user_command(cmd.name)
    end
    -- Unload all modules starting with 'user'
    for name, _ in pairs(package.loaded) do
        if name:match('^user') or name:match('^theprimeagen') then
            package.loaded[name] = nil
        end
    end

    -- Unload all modules in the 'after' directory
    local after_glob = vim.fn.stdpath('config') .. '/after/**/*.lua'
    local after_lua_filepaths = vim.fn.glob(after_glob, true, true)

    for _, filepath in ipairs(after_lua_filepaths) do
        local module_name = filepath:match('after/(.+).lua$')
        if module_name then
            package.loaded[module_name] = nil
        end
    end

    -- Source init.lua or init.vim
    vim.cmd('source ' .. vim.fn.stdpath('config') .. '/init.lua')

    -- Reload after/ directory
    for _, filepath in ipairs(after_lua_filepaths) do
        dofile(filepath)
    end

    -- Notify the user
    vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end
