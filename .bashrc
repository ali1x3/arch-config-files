#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
export EDITOR=nvim
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

#starship
eval "$(starship init bash)"

#fortune | cowsay
if [ -x /usr/share/cowsay -a -x /usr/share/fortune ]; then
    fortune | cowsay
fi

alias musicdl="yt-dlp -x -f bestaudio[ext=m4a] --add-metadata --embed-thumbnail"
