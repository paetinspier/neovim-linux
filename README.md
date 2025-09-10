## Requirements

#### [Lazy.nvim](https://github.com/folke/lazy.nvim)

#### [neovim](https://neovim.io/)

#### [Git](https://git-scm.com/)

#### [luarocks](https://luarocks.org/)

#### [Yazi](https://github.com/sxyazi/yazi)

#### [lazygit](https://github.com/jesseduffield/lazygit)

#### [Nerd Fonts](https://www.nerdfonts.com/)

#### tmux

.tmux.conf:

/# fix color issue

set -g default-terminal "screen-256color"
set -as terminal-features ",xterm-256color:RGB"
set-option -g history-limit 3000

unbind C-b
set -g prefix C-Space
bind C-Space send-prefix

unbind r
bind r source-file ~/.tmux.conf

setw -g mode-keys vi
bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R

/# Set new panes to open in current directory

bind c new-window -c "#{pane_current_path}"
bind '"' split-window -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"

set -g base-index 1
setw -g pane-base-index 1

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'christoomey/vim-tmux-navigator'

/# theme

set -g status-style bg=default
set -g status-fg "#ebcb8b"

set -g @plugin 'sainnhe/tmux-fzf'

set -g status-position top

set-option -sg escape-time 10

run '~/.tmux/plugins/tpm/tpm'
