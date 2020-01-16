# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

fpath=(/usr/local/share/zsh-completions $fpath)

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export PATH=$PATH:$HOME/bin
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=~/.nvm/versions/node/v10.15.0/bin:$PATH


unsetopt share_history

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm

# load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules,Library}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="cd ~; bfs -type d -nohidden | sed 's~^\.~$HOME~'"

fzf-open-file-or-dir() {
  # local cmd="command find -L . \
  #   \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
  #   -o -type f -print \
  #   -o -type d -print \
  #   -o -type l -print 2> /dev/null | sed 1d | cut -b3-"
  local cmd="$FZF_DEFAULT_COMMAND"
  local out=$(eval $cmd | fzf-tmux --exit-0)

  if [ -f "$out" ]; then
    vim "$out" < /dev/tty
  elif [ -d "$out" ]; then
    cd "$out"
    zle reset-prompt
  fi
}
zle     -N   fzf-open-file-or-dir
bindkey '^P' fzf-open-file-or-dir


export PLAYGROUND="$HOME/playground"
export DAVIS="$PLAYGROUND/davis"

alias cds="cd $DAVIS/singularity/"
alias ld="lazydocker"
alias mav="maverick"
alias mavu="maverick -u"
alias mavd="maverick -d"
alias mavr="maverick -R"
alias did="echo >> ~/did.txt && date >> ~/did.txt && vim -c 'startinsert' +'normal Go' ~/did.txt"
alias sshlogin="ssh-add ~/.ssh/bitbucket ~/.ssh/vortex ~/.ssh/github"
alias vortex="autossh -M 0 vortex -t tmux a"
alias tunnel="autossh -M 0 -D 42443 -q -C -N vortex"
alias lcbo="lerna clean -y && lerna bootstrap"

eval "$(rbenv init -)"

bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

export KEYTIMEOUT=1

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/daniel.dyla/playground/davis/davis-custom-interaction-examples/lambda/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/daniel.dyla/playground/davis/davis-custom-interaction-examples/lambda/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/daniel.dyla/playground/davis/davis-custom-interaction-examples/lambda/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/daniel.dyla/playground/davis/davis-custom-interaction-examples/lambda/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/daniel.dyla/playground/davis/davis-custom-interaction-examples/lambda/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/daniel.dyla/playground/davis/davis-custom-interaction-examples/lambda/node_modules/tabtab/.completions/slss.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/daniel.dyla/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/daniel.dyla/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/daniel.dyla/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/daniel.dyla/google-cloud-sdk/completion.zsh.inc'; fi
