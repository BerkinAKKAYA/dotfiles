function play
	mpv $argv --really-quiet & && disown
end
