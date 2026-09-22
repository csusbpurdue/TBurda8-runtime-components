# ~/.zshrc — read by zsh when an interactive shell starts.
#
# After editing, apply your changes to the current terminal with:
#     source ~/.zshrc

# ---------------------------------------------------------------------------
# oh-my-zsh: a framework that adds themes, plugins, and sensible defaults.
# https://ohmyz.sh
# ---------------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"

# Prompt theme. Browse the options at:
# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# robbyrussell shows the current directory and git branch,
# and turns the arrow red when the last command failed.
ZSH_THEME="robbyrussell"

# Plugins live in $ZSH/plugins.
# git                 adds Git shortcuts, e.g. gst for git status
# colored-man-pages   makes man pages easier to read
plugins=(git colored-man-pages)

# Remind me about oh-my-zsh updates instead of updating silently.
zstyle ':omz:update' mode reminder

if [ -f "$ZSH/oh-my-zsh.sh" ]; then
    source "$ZSH/oh-my-zsh.sh"
else
    # oh-my-zsh is not installed: use a plain prompt with the Git branch.
    autoload -Uz vcs_info
    precmd() { vcs_info }
    zstyle ':vcs_info:git:*' formats ' (%b)'
    setopt PROMPT_SUBST
    PROMPT='%F{green}%n@%m%f:%F{blue}%~%f%F{yellow}${vcs_info_msg_0_}%f%# '

    autoload -Uz compinit && compinit    # tab completion
fi

# ---------------------------------------------------------------------------
# History
# ---------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000              # commands remembered in this session
SAVEHIST=20000              # commands saved to ~/.zsh_history
setopt HIST_IGNORE_DUPS     # skip a command identical to the previous one
setopt HIST_IGNORE_SPACE    # skip commands that start with a space
setopt SHARE_HISTORY        # share history between open terminals

# ---------------------------------------------------------------------------
# Aliases
# ---------------------------------------------------------------------------
if ls --color=auto / >/dev/null 2>&1; then
    alias ls='ls --color=auto'
else
    alias ls='ls -G'
fi
alias ll='ls -alF'
alias la='ls -A'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias gccw='gcc -Wall -Wextra -g'
alias gdb='gdb -q'
alias grep='grep --color=auto'

# ---------------------------------------------------------------------------
# Environment
# ---------------------------------------------------------------------------
export EDITOR=vim
export PAGER=less

if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

