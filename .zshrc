# If you come from bash you might have to change your $PATH.↵
# export PATH=$HOME/bin:/usr/local/bin:$PATH↵
# Path to your oh-my-zsh installation.↵
  export ZSH="/home/junhowu/.oh-my-zsh"↵
  export DEFAULT_USER='whoami'↵
# Set name of the theme to load --- if set to "random", it will↵
# load a random theme each time oh-my-zsh is loaded, in which case,↵
# to know which specific one was loaded, run: echo $RANDOM_THEME↵
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes↵
ZSH_THEME="bullet-train"↵

# Which plugins would you like to load?↵
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*↵
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/↵
# Example format: plugins=(rails git textmate ruby lighthouse)↵
# Add wisely, as too many plugins slow down shell startup.↵
plugins=( git zsh-autosuggestions zsh-completions zsh-syntax-highlighting)↵
autoload -U compinit && compinit↵
↵
source $ZSH/oh-my-zsh.sh↵
alias tmux="tmux -2"↵
alias vi="vim"↵
export EDITOR=/usr/local/bin/vim↵
export PATH=$PATH:~/.vim/shell↵
export PATH=$PATH:~/naming_script↵
export GTAGSCONF=/usr/local/share/gtags/gtags.conf↵
export GTAGSLABEL=pygments↵
export GTAGSROOT=~/.cache/tags↵
export GTAGSDBPATH=~/.cache/tags↵
↵
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh↵
# Solarized colors↵
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"↵

