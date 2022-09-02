# Aliases
alias x='exit'
alias c='clear'
alias cal='cal --monday'
alias cls='clear ; ls'
alias v='nvim -p'
alias dl='yt-dlp --embed-subs --format "bestvideo[height<=1080]+bestaudio/best[height<=1080]"'
alias ls='python3 ~/.local/bin/pythonls/src/ls.py'
alias sqlite='sqlite3'

set PATH $PATH /opt/homebrew/bin ~/.pyenv/versions/2.7.18/bin/
set PYTHON ~/.pyenv/versions/2.7.18/bin/python

# Enable Vi Key Bindings & Cursors
fish_vi_key_bindings
set fish_vi_force_cursor
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block

# Greeting
set fish_greeting ""

# Unknown Command
function __fish_command_not_found_handler --on-event fish_command_not_found
  echo "Unknown Command"
end
