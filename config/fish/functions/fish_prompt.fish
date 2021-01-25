function fish_prompt
	function _is_git_dirty
		echo (git status -s --ignore-submodules=dirty 2>/dev/null)
	end

	function _is_git_repo
		type -q git
		or return 1
		git rev-parse --git-dir >/dev/null 2>&1
	end

	function _is_hg_dirty
		echo (hg status -mard 2>/dev/null)
	end

	function _is_hg_repo
		fish_print_hg_root >/dev/null
	end

	function _is_repo_dirty
		_is_$argv[1]_dirty
	end

	function _repo_type
		if _is_hg_repo
			echo 'hg'
			return 0
		else if _is_git_repo
			echo 'git'
			return 0
		end
		return 1
	end

    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l green (set_color -o green)
    set -l blue (set_color -o blue)
    set -l normal (set_color normal)

    set -l cwd $cyan(basename (prompt_pwd))

    if set -l repo_type (_repo_type)
        set -l dirty (_is_repo_dirty $repo_type)

        if test -n "$dirty"
            set -l dirty "$yellow ✗"
            set repo_info "$dirty"
        end
    end

    echo -n -s ''$cwd $repo_info $normal ' '
end
