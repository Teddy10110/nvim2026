# Neovim Keybindings

**Leader key:** `<Space>`

## Core editing & buffers

| Key | Action |
| --- | --- |
| `jk` (insert mode) | Exit insert mode |
| `<C-s>` | Save file |
| `<C-u>` / `<C-d>` | Half-page up / down, centered |
| `J` / `K` (visual mode) | Move selection down / up |
| `<leader>nj` | Clear search highlights |
| `<leader>rr` | Run current file (Python, JS, PHP, Java, C, C++, sh) |
| `<leader>ft` | Pick filetype for current buffer |
| `<leader>n` | New tab |
| `<Tab>` / `<S-Tab>` | Next / previous buffer |
| `<leader>x` | Close current buffer |
| `<leader>h` / `<leader>l` | Move buffer left / right |
| `<C-n>` | Open file explorer (`:Ex`) |

## Windows & splits

| Key | Action |
| --- | --- |
| `<leader>sv` | Split window vertically |
| `<leader>sh` | Split window horizontally |
| `<leader>se` | Make splits equal size |
| `<leader>sx` | Close current split |
| `<C-Up>` / `<C-Down>` | Increase / decrease height |
| `<C-Left>` / `<C-Right>` | Narrower / wider |

## Telescope

| Key | Action |
| --- | --- |
| `<leader>ff` | Find files |
| `<leader>fw` | Live grep |
| `<leader>fs` | Document symbols |
| `<leader>fc` | Grep word under cursor |
| `<leader>ci` / `<leader>co` | Incoming / outgoing calls |
| `<leader>ch` / `<leader>cu` | Implementations / references |
| `<leader>D` | Buffer diagnostics |

Inside Telescope (insert mode):

| Key | Action |
| --- | --- |
| `<C-k>` / `<C-j>` | Move selection up / down |
| `<C-q>` | Send selection to quickfix list and open it |
| `<C-t>` | Open selection in Trouble |

## LSP (when a server is attached)

| Key | Action |
| --- | --- |
| `gd` / `gD` | Go to definition / declaration |
| `gR` | Show references |
| `gi` / `gt` | Implementations / type definitions |
| `K` | Show hover documentation |
| `<leader>ca` | Code action (normal / visual) |
| `<leader>rn` | Rename symbol |
| `<leader>d` / `<leader>D` | Line / buffer diagnostics |
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>rs` | Restart LSP |

## Snacks

| Key | Action |
| --- | --- |
| `<leader>ff` | Find files (conflicts with Telescope) |
| `<leader>fg` | Grep text |
| `<leader>fb` | Buffers |
| `<leader>fr` | Recent files |
| `<leader>nd` / `<leader>nh` | Dismiss / show history of notifications |
| `<leader>tt` | Floating terminal |
| `<A-t>` | Floating terminal (also works inside terminal mode) |

## Debugging (DAP)

| Key | Action |
| --- | --- |
| `<leader>dc` | Continue / launch |
| `<leader>db` | Toggle breakpoint |
| `<leader>ds` / `<leader>di` / `<leader>do` | Step over / into / out |
| `<leader>dr` / `<leader>dt` | Restart / terminate |
| `<leader>du` | Toggle DAP UI |
| `<leader>dw` / `<leader>dW` / `<leader>dC` | Add / remove / clear watches |

## File tree, Trouble & Git

| Key | Action |
| --- | --- |
| `<leader>w` | File tree (float) |
| `<leader>e` | File tree (left) |
| `<leader>ngs` | Neo-tree git status window |
| `<leader>xw` / `<leader>xd` | Workspace / document diagnostics |
| `<leader>xq` / `<leader>xl` / `<leader>xt` | Quickfix / loclist / todos |
| `<leader>gs` / `<leader>gc` / `<leader>gp` | Git status / commit / push |
| `<leader>gb` / `<leader>gd` | Git blame / side-by-side diff |
| `<leader>sr` | Search & replace in project (grug-far) |

## Formatting, themes, markdown & Obsidian

| Key | Action |
| --- | --- |
| `<leader>cf` | Format buffer / selection (normal / visual) |
| `<leader>ts` / `<leader>tn` / `<leader>tp` | Select / next / previous theme |
| `<leader>gl` | Show diagnostic message |
| `<leader>om` | Toggle markdown render |
| `<leader>ob` / `<leader>od` / `<leader>ol` | Backlinks / daily note / note links |
| `<leader>oo` / `<leader>oq` / `<leader>os` | Open in Obsidian / quick switch / search notes |
| `<leader>ot` / `<leader>oT` | Insert template / table of contents |
| `<leader>oc` | Toggle checkbox (markdown buffers) |

Obsidian buffer-local keys:

| Key | Action |
| --- | --- |
| `gf` | Follow link / passthrough |
| `<CR>` | Smart action |
| `<leader>oc` | Toggle checkbox |

## Multi-cursor & completion

| Key | Action |
| --- | --- |
| `<A-d>` / `<A-s>` / `<A-p>` | Add next / skip next / add previous match |
| `<A-a>` | Add cursors to all matches |
| `<C-A-S-Up>` / `<C-A-S-Down>` | Add cursor above / below |
| `<A-Up>` / `<A-Down>` | Add cursor above / below (fallback) |
| `<Left>` / `<Right>` | Previous / next cursor (while multi-cursor is active) |
| `<Esc>` | Clear cursors (while multi-cursor is active) |

Completion (`nvim-cmp`, insert mode):

| Key | Action |
| --- | --- |
| `<C-k>` / `<C-j>` | Select previous / next item |
| `<C-b>` / `<C-f>` | Scroll documentation up / down |
| `<C-Space>` | Trigger completion |
| `<C-e>` | Abort completion |
| `<CR>` | Confirm completion |

Treesitter incremental selection:

| Key | Action |
| --- | --- |
| `<C-Space>` | Start / expand selection |
| `<BS>` | Shrink selection |

## Terminal & dashboard

| Key | Action |
| --- | --- |
| `<Esc>` (terminal mode) | Exit terminal mode |
| `e` / `f` / `q` (dashboard) | New file / find file / quit |
| `SPC ff` / `SPC fw` (dashboard) | Find file / find word |

## Plugin defaults (not custom-configured)

| Plugin | Keys |
| --- | --- |
| mini.move | `Alt-h/j/k/l` or `Alt-arrows` to move lines / selections |
| nvim-surround | `ys`, `ds`, `cs`, and visual `S` (e.g. `ysiw"`) |
| which-key | Press `<Space>` and wait ~3s for a hint menu |

## Notes

- `<leader>ff` is defined by both **Snacks** and **Telescope**, so whichever loads last wins.
- The dashboard `CTRL N` button calls `NvimTreeToggle`, but this config uses **neo-tree**, so that button likely does not work.
