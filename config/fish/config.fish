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

# Colors (Gruvbox)
set -U fish_color_autosuggestion 504945
set -U fish_color_cancel -r
set -U fish_color_command green #white
set -U fish_color_comment 504945
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_end brblack #blue
set -U fish_color_error red
set -U fish_color_escape yellow #green
set -U fish_color_history_current --bold
set -U fish_color_host normal
set -U fish_color_match --background=brblue
set -U fish_color_normal normal
set -U fish_color_operator blue #green
set -U fish_color_param bdae93
set -U fish_color_quote yellow #brblack
set -U fish_color_redirection cyan
set -U fish_color_search_match bryellow --background=504945
set -U fish_color_selection white --bold --background=504945
set -U fish_color_status red
set -U fish_color_user brgreen
set -U fish_color_valid_path --underline
set -U fish_pager_color_completion normal
set -U fish_pager_color_description yellow --dim
set -U fish_pager_color_prefix white --bold #--underline
set -U fish_pager_color_progress brwhite --background=cyan
