# Enable zsh profiling (go to the last line as well)
# zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' menu select
zstyle :compinstall filename '/home/jargonin/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Vim mode
# bindkey -v

# Emacs mode
bindkey -e

bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line

# Move with ^Left and ^Right
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Reverse search command history
bindkey "^R" history-incremental-pattern-search-backward

# Enable colors and change prompt:
# autoload -U colors && colors
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# On-demand rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

# Change cursor shape for different vi modes.
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#      [[ $1 = 'block' ]]; then
#     echo -ne '\e[1 q'
#   elif [[ ${KEYMAP} == main ]] ||
#        [[ ${KEYMAP} == viins ]] ||
#        [[ ${KEYMAP} = '' ]] ||
#        [[ $1 = 'beam' ]]; then
#     echo -ne '\e[5 q'
#   fi
# }
# zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
# zle -N zle-line-init
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^[e' edit-command-line
setopt COMPLETE_ALIASES

# Source Aliases from .aliasrc
[ -f "${HOME}/.aliasrc" ] && source "${HOME}/.aliasrc"

# Vi mode: make bash Alt+. work
# bindkey -M viins '\e.' insert-last-word

# Vi mode: make tab autocomplete menu cycle in reverse
# bindkey -M viins '^[[Z' reverse-menu-complete

# make bash Alt+. work
bindkey '\e.' insert-last-word

# make tab autocomplete menu cycle in reverse
bindkey '^[[Z' reverse-menu-complete

# disable flowcontrol (ctrl+s stops terminal output, and ctrl+q resumes it)
setopt noflowcontrol

# Ignore duplicates in history
setopt HIST_IGNORE_ALL_DUPS

# status line theme
# source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load starship prompt
eval "$(starship init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/Downloads/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/Downloads/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/Downloads/google-cloud-sdk/completion.zsh.inc"; fi

# source <(kubectl completion zsh)

# Lazy Loading kubectl completion
# function kubectl() {
#     if ! type __start_kubectl >/dev/null 2>&1; then
#         source <(command kubectl completion zsh)
#     fi
#     command kubectl "$@"
# }

# kubectl completion generate and cache. To be used with kubectl installed with gcloud sdk
if (( $+commands[kubectl] )); then
    __KUBECTL_COMPLETION_FILE="${ZSH_CACHE_DIR}/kubectl_completion"

    if [[ ! -f $__KUBECTL_COMPLETION_FILE || ! -s $__KUBECTL_COMPLETION_FILE ]]; then
        kubectl completion zsh >! $__KUBECTL_COMPLETION_FILE
    fi

    [[ -f $__KUBECTL_COMPLETION_FILE ]] && source $__KUBECTL_COMPLETION_FILE

    unset __KUBECTL_COMPLETION_FILE
fi

# Load zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Enable zsh profiling
# zprof
