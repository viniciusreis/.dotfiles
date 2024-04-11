local options = {                            -- :help opetions
    number = true,                           -- print line number on front of each line
    relativenumber = true,                   -- display the line number relative to the cursor
    backup = false,                          -- creates backup file
    clipboard = 'unnamedplus',               -- set the unnamed and the '+' (system's) clipboard as default
    completeopt = {'menuone', 'noselect'},   -- options for insert mode completion
    conceallevel = 0,                        -- so that `` is visible in markdown files
    fileencoding = 'utf-8',                  -- explicitly sets file encoding
    hlsearch = true,                         -- highlight a previous search parttern
    ignorecase = true,                       -- ignore case in search pattern
    smartcase = true,                        -- override ignorecase when search has upper case letters
    pumheight = 10,                          -- mixumum number of items to show in the popup menu
    showmode = false,                        -- remove mode display in cmd line
    cmdheight = 1,                           -- set command line heigh
    showtabline =  2,                        -- always show tabline
    smartindent = true,                      -- autoindent for new lines
    tabstop = 10,                            -- number of spaces to display a tab
    shiftwidth = 2,                          -- number of spaces to use for each step of (auto)indent
    expandtab = true,                        -- substitutes tabs for spaces when inserting text 
    autoindent = true,                       -- copy indent from current line when starting a new one
    splitright = true,                       -- forces all vertical splits to be places at the right of current window
    splitbelow = true,                       -- forces all horizontal splits to be places at the bellow the current window
    swapfile = false,                        -- use a swapfile for the buffer.
    termguicolors = true,                    -- enable 24-bit RBG color in the trui
    timeoutlen = 1000,                       -- time span for mapped sequence
    undofile = true,                         -- enable persistent undo
    updatetime = 300,                        -- faster completion 
    writebackup = true,
    cursorline = true,                       -- highlight cursor line
    numberwidth = 4,                         -- minimal number of columns to use for the line number
    signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
    wrap = false,                            -- sets line break for displaying only
    -- scrolloff = 4,                        -- line offset to keep visible when scrolling 
    sidescrolloff = 10,
    backspace = 'indent,eol,start',
    colorcolumn = '80',
    -- guifont = "HackNerdFont:h12"          -- TODO: test it out and add the font installation as requirement for the configuration
}
for k, v in pairs(options) do
    vim.opt[k] = v
end
vim.g.netrw_liststyle=3
vim.opt.iskeyword:append('-')
vim.opt.whichwrap:append('<,>,[,],h,l')
