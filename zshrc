# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by newuser for 5.9
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -Uz run-help
(( ${+aliases[run-help]} )) && unalias run-help
alias help=run-help
autoload -Uz run-help-git run-help-ip run-help-openssl run-help-p4 run-help-sudo run-help-svk run-help-svn

autoload -Uz compinit promptinit
compinit
promptinit

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000

EDITOR=nvim

TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

# Case-insensitive tab completion (match lower and upper case)
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Use colors for completion listings (different colors for directories, files, etc.)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Enable rehash so new executables in the PATH are automatically found
zstyle ':completion:*' rehash true

# Enable menu selection (highlight options when navigating with tab)
zstyle ':completion:*' menu select

# Automatically accept exact matches in completion, even if partially typed
zstyle ':completion:*' accept-exact '*(N)'

# Enable caching for faster completion, and define the cache path
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Add auto-description for completion items (shows additional information)
zstyle ':completion:*' auto-description 'specify: %d'

# Specify completion methods: first expand aliases, then complete commands
zstyle ':completion:*' completer _expand _complete

# Format the completion display with a message indicating what is being completed
zstyle ':completion:*' format 'Completing %d'

# Remove group names from completion listings
zstyle ':completion:*' group-name ''

# List prompt for showing how to navigate through completion options
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s

# Select prompt for scrolling through completion menu
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

# Disable the use of older `compctl` completions (use new style completion)
zstyle ':completion:*' use-compctl false

# Enable verbose completion output
zstyle ':completion:*' verbose true

# Custom completion style for `kill` command, listing processes with detailed information
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Set colors for the `kill` command completion (red color for process IDs)
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

alias c='clear'
alias nf='fastfetch'
alias pf='fastfetch'
alias ff='fastfetch'
alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'
alias shutdown='systemctl poweroff'
alias v='$EDITOR'
alias vim='$EDITOR'
alias wifi='nmtui'
alias Qtile='startx'
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gst="git stash"
alias gsp="git stash; git pull"
alias gcheck="git checkout"
alias gcredential="git config credential.helper store"
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias res1='xrandr --output DisplayPort-0 --mode 2560x1440 --rate 165'
alias res2='xrandr --output DisplayPort-0 --mode 1920x1080 --rate 165'
alias setkb='setxkbmap de;echo "Keyboard set back to de."'
alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias gitu='git add . && git commit && git push'
alias history="history 0"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias rm='rm -i'
alias ip='ip --color=auto'
alias la='ls -A'

setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt inc_append_history                                       # save commands are added to the history immediately, otherwise only when shell exits.
setopt histignorespace                                          # Don't save commands that start with space
setopt prompt_subst
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
#setopt share_history         # share command history data

# Enable emacs key bindings
bindkey -e

# Key bindings using raw escape sequences
bindkey '^[[7~' beginning-of-line                  # Home key
bindkey '^[[8~' end-of-line                        # End key
bindkey '^[[H' beginning-of-line                   # Home key (alternative)
bindkey '^[[F' end-of-line                         # End key (alternative)
bindkey '^[[2~' overwrite-mode                     # Insert key
bindkey '^[[3~' delete-char                        # Delete key
bindkey '^[[C' forward-char                        # Right arrow key
bindkey '^[[D' backward-char                       # Left arrow key
bindkey '^[[5~' history-beginning-search-backward  # Page Up key
bindkey '^[[6~' history-beginning-search-forward   # Page Down key
bindkey '^[[1;5C' forward-word                     # Ctrl + Right arrow (forward word)
bindkey '^[[1;5D' backward-word                    # Ctrl + Left arrow (backward word)
bindkey '^[[Z' undo                               # Shift + Tab undo last action

# Bind Ctrl+Backspace to delete the previous word
bindkey '^H' backward-kill-word                    # Ctrl + Backspace

# Bind Ctrl+U to delete the line before the cursor
bindkey '^U' backward-kill-line                    # Ctrl + U

# Ctrl + Delete (Supr) to kill the word
bindkey '^[[3;5~' kill-word                        # Ctrl + Delete

# Undo action with Shift + Tab
bindkey '^[[Z' undo                                # Shift + Tab undo

# Configure up/down keys for history substring search
bindkey '^[[A' history-substring-search-up         # Up arrow
bindkey '^[[B' history-substring-search-down       # Down arrow

# Magic space: perform history expansion on space
bindkey ' ' magic-space                            # Space bar for history expansion

# Define keys using terminfo variables for portability
typeset -g -A key
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# Bind keys according to the terminfo values
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Application mode handling for terminfo keys
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
    autoload -Uz add-zle-hook-widget
    function zle_application_mode_start { echoti smkx }  # Enter application mode
    function zle_application_mode_stop { echoti rmkx }   # Exit application mode
    add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
    add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# Up/down key bindings with search capabilities
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# Control + Left/Right bindings for word navigation
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word


function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=(
        ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"}
    )
    if (( ${#entries[@]} ))
    then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}"
        do
            # (repo package version file)
            local fields=(
                ${(0)entry}
            )
            if [[ "$pkg" != "${fields[2]}" ]]
            then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}

# Use lesspipe for better handling of non-text files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set up a fancy prompt with optional color support based on terminal type
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes ;;
esac
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes # Color support is available
    else
        color_prompt=
    fi
fi

# Function to execute before displaying the prompt
precmd() {
    # Print previously configured terminal title
    print -Pnr -- "$TERM_TITLE"

    # Print a new line before the prompt if configured
    if [ "$NEWLINE_BEFORE_PROMPT" = yes ]; then
        if [ -z "$_NEW_LINE_BEFORE_PROMPT" ]; then
            _NEW_LINE_BEFORE_PROMPT=1
        else
            print ""
        fi
    fi
}

# Update terminal title before executing a command
mzc_termsupport_precmd() {
    [[ "${DISABLE_AUTO_TITLE:-}" == true ]] && return
    title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE
}

# Function to run before executing any command
mzc_termsupport_preexec() {
    [[ "${DISABLE_AUTO_TITLE:-}" == true ]] && return

    emulate -L zsh

    # Split command into arguments
    local -a cmdargs
    cmdargs=("${(z)2}")

    # Handle foreground job commands
    if [[ "${cmdargs[1]}" = fg ]]; then
        local job_id jobspec="${cmdargs[2]#%}"
        case "$jobspec" in
            <->) job_id=${jobspec} ;;           # Use specified job number
            ""|%|+) job_id=${(k)jobstates[(r)*:+:*]} ;; # Current job
            -) job_id=${(k)jobstates[(r)*:-:*]} ;;        # Previous job
            [?]*) job_id=${(k)jobtexts[(r)*${(Q)jobspec}*]} ;; # Match job command
            *) job_id=${(k)jobtexts[(r)${(Q)jobspec}*]} ;;  # Start of command
        esac

        # Override preexec function arguments with job command
        if [[ -n "${jobtexts[$job_id]}" ]]; then
            1="${jobtexts[$job_id]}"
            2="${jobtexts[$job_id]}"
        fi
    fi

    # Extract command name and line for terminal title
    local CMD=${1[(wr)^(*=*|sudo|ssh|mosh|rake|-*)]:gs/%/%%}
    local LINE="${2:gs/%/%%}"

    title '$CMD' '%100>...>$LINE%<<'
}

# Add hooks for preexec and precmd
autoload -U add-zsh-hook
add-zsh-hook precmd mzc_termsupport_precmd
add-zsh-hook preexec mzc_termsupport_preexec

# Function to set the terminal title
title() {
    emulate -L zsh
    setopt prompt_subst

    [[ "$EMACS" == *term* ]] && return

    # Use the first argument if the second is unset
    : ${2=$1}

    case "$TERM" in
        xterm*|putty*|rxvt*|konsole*|mlterm*|alacritty|kitty|wezterm|st*)
            print -Pn "\e]2;${2:q}\a" # Set window name
            print -Pn "\e]1;${1:q}\a" # Set tab name
            ;;
        screen*|tmux*)
            print -Pn "\ek${1:q}\e\\" # Set screen hardstatus
            ;;
        *)
            # Try to set the title using terminfo
            if [[ -n "$terminfo[fsl]" ]] && [[ -n "$terminfo[tsl]" ]]; then
                echoti tsl
                print -Pn "$1"
                echoti fsl
            fi
            ;;
    esac
}

# Load required module for language info
zmodload zsh/langinfo

# Function to URL-encode a string
zsh_urlencode() {
    emulate -L zsh
    local -a opts
    zparseopts -D -E -a opts r m P

    local in_str="$@"
    local url_str=""
    local spaces_as_plus
    if [[ -z $opts[(r)-P] ]]; then spaces_as_plus=1; fi
    local str="$in_str"

    # Convert string to UTF-8 if necessary
    local encoding=$langinfo[CODESET]
    local safe_encodings=(UTF-8 utf8 US-ASCII)
    if [[ -z ${safe_encodings[(r)$encoding]} ]]; then
        str=$(echo -E "$str" | iconv -f $encoding -t UTF-8) || {
            echo "Error converting string from $encoding to UTF-8" >&2
            return 1
        }
    fi

    # URL encode the string
    local reserved=';/?:@&=+$,'
    local mark='_.!~*''()-'
    local dont_escape="[A-Za-z0-9"
    if [[ -z $opts[(r)-r] ]]; then
        dont_escape+=$reserved
    fi
    if [[ -z $opts[(r)-m] ]]; then
        dont_escape+=$mark
    fi
    dont_escape+="]"

    for (( i = 1; i <= ${#str}; ++i )); do
        local byte="$str[i]"
        if [[ "$byte" =~ "$dont_escape" ]]; then
            url_str+="$byte"
        else
            if [[ "$byte" == " " && -n $spaces_as_plus ]]; then
                url_str+="+"
            else
                local ord=$(( [##16] #byte ))
                url_str+="%$ord"
            fi
        fi
    done
    echo -E "$url_str"
}

# Function to set the terminal to display the current working directory
mzc_termsupport_cwd() {
    local URL_HOST URL_PATH
    URL_HOST="$(zsh_urlencode -P $HOST)" || return 1
    URL_PATH="$(zsh_urlencode -P $PWD)" || return 1

    # Set the current host and path in the terminal
    printf "\e]7;%s\a" "file://${URL_HOST}${URL_PATH}"
}

# Use a precmd hook for updating the current working directory in the terminal title
add-zsh-hook precmd mzc_termsupport_cwd

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=underline
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[path]=bold
ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[command-substitution]=none
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[process-substitution]=none
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[assign]=none
ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
ZSH_HIGHLIGHT_STYLES[named-fd]=none
ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout

# Color man pages
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

