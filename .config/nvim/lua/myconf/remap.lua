---@diagnostic disable: need-check-nil, missing-parameter
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move selected
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- error
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- buffer
vim.keymap.set("n", "<leader>bn", vim.cmd.bn)
vim.keymap.set("n", "<leader>bp", vim.cmd.bp)
vim.keymap.set("n", "<leader>bd", vim.cmd.bd)
vim.keymap.set("n", "<leader>bl", vim.cmd.ls)
vim.keymap.set("n", "<leader>be", vim.cmd.enew)
vim.keymap.set("n", "<leader>bv", vim.cmd.vs)
vim.keymap.set("n", "<leader>bh", vim.cmd.hs)

local function listdir(directory)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('ls -a "'..directory..'"')
    for filename in pfile:lines() do
        if filename == ".." or filename == "." then
            goto continue
        end
        i = i + 1
        t[i] = string.gsub(filename, "%.lua", "")
        ::continue::
    end
    pfile.close()
    return t
end

local function create_command_dirlist_complete (command, directory)
    vim.api.nvim_create_user_command(command,
        function(opts)
            vim.cmd(string.format(":e %s/%s.lua", directory, opts.fargs[1]))
        end,
        { nargs = 1,
          complete = function ()
            return listdir(directory)
          end
    })
end

create_command_dirlist_complete('Conf', '/home/blindenhahn/.config/nvim/lua/myconf')
create_command_dirlist_complete('ConfPlugin', '/home/blindenhahn/.config/nvim/after/plugin')
