-- arasaka — matched to alacritty/tmux Arasaka theme
-- Palette: near-black purple bg, warm cream fg, corporate red + amber accents

if vim.g.colors_name then vim.cmd('hi clear') end
if vim.fn.exists('syntax_on') == 1 then vim.cmd('syntax reset') end
vim.g.colors_name   = 'arasaka'
vim.o.background    = 'dark'
vim.o.termguicolors = true

local p = {
  -- Backgrounds
  bg       = '#080008',   -- alacritty background
  bg1      = '#1a0505',   -- normal black / inactive window
  bg2      = '#3d1010',   -- bright black / active surface
  bg3      = '#0d0008',   -- slightly off-bg for floats

  -- Foregrounds
  fg       = '#f0d0cc',   -- alacritty foreground
  fg_dim   = '#7a4a44',   -- dim_foreground / inactive
  fg_mid   = '#b09088',   -- midpoint (not in palette, derived)

  -- Accents
  red      = '#ff0022',   -- normal red / cursor
  red_br   = '#ff3344',   -- bright red
  red_dk   = '#880011',   -- normal blue (dark crimson)
  red_md   = '#cc1133',   -- normal magenta
  red_hot  = '#ff2255',   -- bright magenta

  amber    = '#ffaa00',   -- normal yellow / vi cursor / active window
  amber_br = '#ffcc44',   -- bright yellow

  orange   = '#ff6644',   -- normal cyan
  orange_br= '#ff8866',   -- bright cyan

  rust     = '#aa3300',   -- normal green
  rust_br  = '#cc5522',   -- bright green

  white    = '#ffffff',
  none     = 'NONE',
}

local h = function(name, opts) vim.api.nvim_set_hl(0, name, opts) end

-- Base UI
h('Normal',          { fg = p.fg,      bg = p.bg })
h('NormalFloat',     { fg = p.fg,      bg = p.bg3 })
h('NormalNC',        { fg = p.fg_dim,  bg = p.bg })
h('FloatBorder',     { fg = p.bg2,     bg = p.bg3 })
h('FloatTitle',      { fg = p.amber,   bg = p.bg3, bold = true })

-- Cursor / lines
h('Cursor',          { fg = p.bg,      bg = p.red })
h('CursorLine',      { bg = p.bg1 })
h('CursorLineNr',    { fg = p.amber,   bold = true })
h('CursorColumn',    { bg = p.bg1 })
h('LineNr',          { fg = p.fg_dim })
h('SignColumn',      { fg = p.fg_dim,  bg = p.bg })
h('ColorColumn',     { bg = p.bg1 })

-- Search (matches tmux search colours)
h('Search',          { fg = p.bg,      bg = p.amber })
h('IncSearch',       { fg = p.bg,      bg = p.red })
h('CurSearch',       { fg = p.bg,      bg = p.red_br })
h('Substitute',      { fg = p.bg,      bg = p.red })

-- Selection / folds
h('Visual',          { bg = p.bg2 })
h('VisualNOS',       { bg = p.bg2 })
h('Folded',          { fg = p.amber,   bg = p.bg1 })
h('FoldColumn',      { fg = p.fg_dim,  bg = p.bg })

-- Status / tabs / splits (match tmux Arasaka bar)
h('StatusLine',      { fg = p.fg,      bg = p.bg1 })
h('StatusLineNC',    { fg = p.fg_dim,  bg = p.bg1 })
h('TabLine',         { fg = p.fg_dim,  bg = p.bg1 })
h('TabLineFill',     { bg = p.bg })
h('TabLineSel',      { fg = p.amber,   bg = p.bg2,  bold = true })
h('WinBar',          { fg = p.fg,      bg = p.bg })
h('WinBarNC',        { fg = p.fg_dim,  bg = p.bg })
h('WinSeparator',    { fg = p.bg2 })
h('VertSplit',       { fg = p.bg2 })

-- Popups / completion
h('Pmenu',           { fg = p.fg,      bg = p.bg1 })
h('PmenuSel',        { fg = p.bg,      bg = p.amber })
h('PmenuSbar',       { bg = p.bg2 })
h('PmenuThumb',      { bg = p.red_dk })

-- Messages
h('ErrorMsg',        { fg = p.red })
h('WarningMsg',      { fg = p.amber })
h('ModeMsg',         { fg = p.fg,      bold = true })
h('MoreMsg',         { fg = p.amber })
h('Question',        { fg = p.amber })

-- Diff
h('DiffAdd',         { fg = p.rust_br, bg = '#130c00' })
h('DiffChange',      { fg = p.amber,   bg = '#130800' })
h('DiffDelete',      { fg = p.red,     bg = '#1a0005' })
h('DiffText',        { fg = p.amber_br,bg = '#1a0e00', bold = true })

-- Spelling
h('SpellBad',        { sp = p.red,     undercurl = true })
h('SpellCap',        { sp = p.amber,   undercurl = true })
h('SpellRare',       { sp = p.orange,  undercurl = true })
h('SpellLocal',      { sp = p.rust_br, undercurl = true })

-- Diagnostics
h('DiagnosticError',            { fg = p.red })
h('DiagnosticWarn',             { fg = p.amber })
h('DiagnosticInfo',             { fg = p.orange })
h('DiagnosticHint',             { fg = p.rust_br })
h('DiagnosticOk',               { fg = p.rust_br })
h('DiagnosticSignError',        { fg = p.red })
h('DiagnosticSignWarn',         { fg = p.amber })
h('DiagnosticSignInfo',         { fg = p.orange })
h('DiagnosticSignHint',         { fg = p.rust_br })
h('DiagnosticUnderlineError',   { sp = p.red,     undercurl = true })
h('DiagnosticUnderlineWarn',    { sp = p.amber,   undercurl = true })
h('DiagnosticUnderlineInfo',    { sp = p.orange,  undercurl = true })
h('DiagnosticUnderlineHint',    { sp = p.rust_br, undercurl = true })
h('DiagnosticVirtualTextError', { fg = p.red,     bg = '#1a0005' })
h('DiagnosticVirtualTextWarn',  { fg = p.amber,   bg = '#130800' })
h('DiagnosticVirtualTextInfo',  { fg = p.orange,  bg = '#130500' })
h('DiagnosticVirtualTextHint',  { fg = p.rust_br, bg = '#0d0800' })

-- Core syntax
h('Comment',         { fg = p.fg_dim,  italic = true })
h('Constant',        { fg = p.amber })
h('String',          { fg = p.rust_br })
h('Character',       { fg = p.rust_br })
h('Number',          { fg = p.amber })
h('Float',           { fg = p.amber })
h('Boolean',         { fg = p.amber })
h('Identifier',      { fg = p.fg })
h('Function',        { fg = p.orange_br })
h('Statement',       { fg = p.red_br })
h('Keyword',         { fg = p.red_br,  italic = true })
h('Conditional',     { fg = p.red_br,  italic = true })
h('Repeat',          { fg = p.red_br,  italic = true })
h('Exception',       { fg = p.red })
h('Operator',        { fg = p.orange })
h('PreProc',         { fg = p.red_md })
h('Include',         { fg = p.red_br })
h('Define',          { fg = p.red_br })
h('Macro',           { fg = p.red_md })
h('Type',            { fg = p.amber_br })
h('StorageClass',    { fg = p.amber_br })
h('Structure',       { fg = p.amber_br })
h('Typedef',         { fg = p.amber_br })
h('Special',         { fg = p.orange })
h('SpecialChar',     { fg = p.orange })
h('Tag',             { fg = p.amber })
h('Delimiter',       { fg = p.fg_mid })
h('SpecialComment',  { fg = p.orange_br })
h('Underlined',      { fg = p.amber,   underline = true })
h('Bold',            { bold = true })
h('Italic',          { italic = true })
h('Error',           { fg = p.red,     bold = true })
h('Todo',            { fg = p.amber,   bold = true })

-- Treesitter (kept in case user re-enables)
h('@comment',              { link = 'Comment' })
h('@keyword',              { link = 'Keyword' })
h('@keyword.return',       { fg = p.red,      italic = true })
h('@keyword.function',     { fg = p.red_br,   italic = true })
h('@keyword.operator',     { fg = p.orange })
h('@function',             { link = 'Function' })
h('@function.builtin',     { fg = p.orange })
h('@function.method',      { fg = p.orange_br })
h('@constructor',          { fg = p.amber_br })
h('@variable',             { fg = p.fg })
h('@variable.builtin',     { fg = p.red,      italic = true })
h('@variable.member',      { fg = p.fg_mid })
h('@variable.parameter',   { fg = p.fg,       italic = true })
h('@field',                { fg = p.fg_mid })
h('@property',             { fg = p.fg_mid })
h('@string',               { link = 'String' })
h('@string.escape',        { fg = p.orange })
h('@number',               { link = 'Number' })
h('@float',                { link = 'Float' })
h('@boolean',              { link = 'Boolean' })
h('@type',                 { link = 'Type' })
h('@type.builtin',         { fg = p.amber_br, italic = true })
h('@namespace',            { fg = p.red_md })
h('@module',               { fg = p.red_md })
h('@operator',             { link = 'Operator' })
h('@punctuation',          { fg = p.fg_mid })
h('@punctuation.bracket',  { fg = p.fg_mid })
h('@punctuation.delimiter',{ fg = p.fg_mid })
h('@constant',             { link = 'Constant' })
h('@constant.builtin',     { fg = p.amber,    italic = true })

-- LSP semantic tokens
h('@lsp.type.function',   { link = 'Function' })
h('@lsp.type.method',     { fg = p.orange_br })
h('@lsp.type.variable',   { link = '@variable' })
h('@lsp.type.parameter',  { link = '@variable.parameter' })
h('@lsp.type.property',   { link = '@property' })
h('@lsp.type.class',      { fg = p.amber_br })
h('@lsp.type.interface',  { fg = p.amber })
h('@lsp.type.enum',       { fg = p.amber_br })
h('@lsp.type.enumMember', { fg = p.amber })
h('@lsp.type.struct',     { fg = p.amber_br })
h('@lsp.type.type',       { link = 'Type' })
h('@lsp.type.namespace',  { link = '@namespace' })
h('@lsp.type.keyword',    { link = 'Keyword' })
h('@lsp.type.string',     { link = 'String' })
h('@lsp.type.number',     { link = 'Number' })
h('@lsp.type.operator',   { link = 'Operator' })
h('@lsp.mod.deprecated',  { fg = p.fg_dim,   strikethrough = true })

-- GitSigns
h('GitSignsAdd',           { fg = p.rust_br })
h('GitSignsChange',        { fg = p.amber })
h('GitSignsDelete',        { fg = p.red })
h('GitSignsAddNr',         { fg = p.rust_br })
h('GitSignsChangeNr',      { fg = p.amber })
h('GitSignsDeleteNr',      { fg = p.red })
h('GitSignsAddLn',         { bg = '#0d0800' })
h('GitSignsChangeLn',      { bg = '#130800' })
h('GitSignsDeleteVirtLn',  { fg = p.red })

-- Which-key
h('WhichKey',              { fg = p.red_br })
h('WhichKeyGroup',         { fg = p.amber })
h('WhichKeyDesc',          { fg = p.fg })
h('WhichKeySeparator',     { fg = p.fg_dim })
h('WhichKeyFloat',         { bg = p.bg1 })
h('WhichKeyBorder',        { fg = p.bg2 })

-- Mini statusline modes (match tmux active/inactive style)
h('MiniStatuslineModeNormal',  { fg = p.bg, bg = p.red,      bold = true })
h('MiniStatuslineModeInsert',  { fg = p.bg, bg = p.rust_br,  bold = true })
h('MiniStatuslineModeVisual',  { fg = p.bg, bg = p.amber,    bold = true })
h('MiniStatuslineModeReplace', { fg = p.bg, bg = p.red_hot,  bold = true })
h('MiniStatuslineModeCommand', { fg = p.bg, bg = p.amber_br, bold = true })
h('MiniStatuslineModeOther',   { fg = p.bg, bg = p.orange,   bold = true })
h('MiniStatuslineFilename',    { fg = p.fg,     bg = p.bg1 })
h('MiniStatuslineFileinfo',    { fg = p.fg_dim, bg = p.bg1 })
h('MiniStatuslineDevinfo',     { fg = p.fg_dim, bg = p.bg1 })
h('MiniStatuslineInactive',    { fg = p.fg_dim, bg = p.bg1 })
h('MiniCursorword',            { bg = p.bg2 })
h('MiniJump',                  { fg = p.bg,     bg = p.amber })
h('MiniIndentscopeSymbol',     { fg = p.bg2 })

-- Snacks
h('SnacksPickerFile',          { fg = p.fg })
h('SnacksPickerDir',           { fg = p.amber })
h('SnacksPickerMatch',         { fg = p.red_br,  bold = true })
h('SnacksDashboardTitle',      { fg = p.red,     bold = true })
h('SnacksDashboardHeader',     { fg = p.red_br })
h('SnacksDashboardFooter',     { fg = p.fg_dim,  italic = true })
h('SnacksDashboardKey',        { fg = p.amber })
h('SnacksDashboardDesc',       { fg = p.fg })
h('SnacksDashboardIcon',       { fg = p.red })
h('SnacksNotifierInfo',        { fg = p.orange })
h('SnacksNotifierWarn',        { fg = p.amber })
h('SnacksNotifierError',       { fg = p.red })
h('SnacksNotifierBorderInfo',  { fg = p.orange })
h('SnacksNotifierBorderWarn',  { fg = p.amber })
h('SnacksNotifierBorderError', { fg = p.red })
h('SnacksIndent',              { fg = p.bg2 })
h('SnacksIndentScope',         { fg = p.bg2 })

-- Inline TODO highlights
h('TodoFix',    { fg = p.red,      bold = true })
h('TodoWarn',   { fg = p.amber,    bold = true })
h('TodoNote',   { fg = p.orange_br,bold = true })
h('TodoHack',   { fg = p.orange,   bold = true })
h('TodoPerf',   { fg = p.rust_br,  bold = true })
