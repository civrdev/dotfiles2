if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export XDG_DATA_HOME=$HOME/.local/share
export ZSH="$HOME/.config/zsh/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=( git zsh-syntax-highlighting zsh-autosuggestions )

bindkey -M vicmd '^F' forward-char
bindkey -M viins '^F' autosuggest-accept
bindkey -M vicmd '^F' autosuggest-accept

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## ALIASES ##
alias n='nvim'
alias run='gcc ~/justc/main.c -o ~/justc/main && ~/justc/main'
alias pipes='pipes.sh -p 8 -t 6 -c 2 -c 6 -f 80 -s 10 -r 1700 -R'
alias cmatrix='cmatrix -C cyan -b'
alias ff='fastfetch'

export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

KEYTIMEOUT=1
bindkey -v

function zle-keymap-select {
	case $KEYMAP in
		vicmd)      echo -ne '\e[2 q' ;;
		main|viins) echo -ne '\e[6 q' ;;
	esac
}

function zle-line-init {
	echo -ne '\e[6 q'
}

zle -N zle-keymap-select
zle -N zle-line-init

# RGO #
rgo () {
	local editor=${2:-nvim}

	local sel=$(rg --line-number --no-heading --color=never "$1" \
		| fzf --height 50% --border --delimiter ':' \
		--preview 'bat --style=numbers --color=always --highlight-line {2} {1}' \
		--preview-window 'right:60%' ) || return

	local file=${sel%%:*}
	local rest=${sel#*:}
	local line=${rest%%:*}

	case "$editor" in
		nvim)  nvim +"$line" "$file" ;;
		nano) nano +"$line" "$file" ;;
		bat)  bat --style=numbers --highlight-line "$line" "$file" ;;
		*)    "$editor" "$file" ;;
	esac
}  


## zoxide ##
eval "$(zoxide init zsh)"

## FZF ##

[ -f ~/.config/fzf/shell/key-bindings.zsh ] && source ~/.config/fzf/shell/key-bindings.zsh
[ -f ~/.config/fzf/shell/completion.zsh ] && source ~/.config/fzf/shell/completion.zsh
[ -f ~/.config/fzf/.fzf.zsh ] && source ~/.config/fzf/.fzf.zsh
if [ -f ~/.config/fzf/fzf-theme.sh ]; then
	source ~/.config/fzf/fzf-theme.sh
fi

