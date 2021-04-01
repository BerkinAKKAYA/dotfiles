# ~/.config/fish/config.fish

# Aliases
alias x='exit'
alias cp='rsync --human-readable --info=progress2'
alias c='clear'
alias cal='cal --monday'
alias cls='clear ; ls'
alias ls='python3 ~/Projects/pythonls/src/ls.py -x="srt"'
alias v='nvim -p'
alias dl='youtube-dl --embed-subs --ignore-errors --format "bestvideo[height<=1080]+bestaudio/best[height<=1080]"'

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
