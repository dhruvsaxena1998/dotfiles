export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(
  git
  sudo
  aws
  kubectl
  command-not-found
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# Shell integration
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Google Cloud SDK (gcloud + kubectl) setup via Homebrew
if [ -f "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc" ]; then
  source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
  source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
fi

# Key bindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Aliases
alias ls='ls --color'
alias vim='nvim'
alias c='clear'
alias cat='bat'
alias claude="/Users/dhruvsaxena/.claude/local/claude"
alias serena-index="uvx --from git+https://github.com/oraios/serena serena project index"
alias claude-add-serena="claude mcp add serena -- uvx --from git+https://github.com/oraios/serena serena-mcp-server --context ide-assistant --project $(pwd)"

export PATH="$PATH:/Users/dhruvsaxena/.local/bin"
