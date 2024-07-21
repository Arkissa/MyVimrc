return {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
        require 'gitsigns'.setup {
            current_line_blame      = true,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 100,
                ignore_whitespace = true,
                virt_text_priority = 100,
            },
            on_attach               = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim
                        .keymap
                        .set(mode, l, r, opts)
                end

                -- Navigation
                map('n', ']c', function()
                    if vim.wo.diff then return ']c' end
                    vim.schedule(function() gs.next_hunk() end)
                    return '<Ignore>'
                end, { expr = true })

                map('n', '[c', function()
                    if vim.wo.diff then return '[c' end
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end, { expr = true })

                -- Actions
                map('v', '<leader>ui', ':Gitsigns stage_hunk<CR>')
                map('n', '<leader>uh', gs.undo_stage_hunk)
                map('n', '<leader>ua', function() gs.blame_line { full = true } end)
                map('n', '<leader>tb', gs.toggle_current_line_blame)
                map('n', '<leader>ud', gs.diffthis)
            end
        }
    end
}
