# ~/.config/fish/config.fish
# depends on 'colorls', 'rsync', 'xclip'

# Aliases
alias less="less -r"
alias x='exit'
alias c='clear'
alias cp='rsync --human-readable --info=progress2'
alias cal='cal --monday'
alias cat='bat'
alias cls='clear ; ls'
alias ls='python3 ~/Projects/pythonls/src/ls.py'
alias v='nvim'
alias dl='youtube-dl --embed-subs --ignore-errors --format "bestvideo[height<=1080]+bestaudio/best[height<=1080]"'
alias pac='doas pacman'

set PATH $PATH ~/.cargo/bin ~/.yarn/bin ~/.local/bin
set EDITOR nvim
set BROWSER qutebrowser

set QT_QPA_PLATFORM wayland
set SDL_VIDEODRIVER wayland
set XDG_SESSION_TYPE wayland

# sway on boot
if status is-login
	if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
		exec sway --config ~/.config/sway.config
	end
end

# Enable Vi Key Bindings & Cursors
fish_vi_key_bindings
set fish_vi_force_cursor
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block

# Greeting
set fish_greeting ""
