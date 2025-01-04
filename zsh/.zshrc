ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

export ZSHCONF_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
source $ZSHCONF_DIR/common/funcs.zsh

safely_add_to_path "$HOME/.local/bin"
export NVM_DIR="$HOME/.nvm"

source "${ZINIT_HOME}/zinit.zsh"

source $ZSHCONF_DIR/aliases.zsh
source $ZSHCONF_DIR/vars.zsh
source $ZSHCONF_DIR/kroki.zsh

if [[ $ZSH_PROFILE == "work" ]]; then
    source $ZSHCONF_DIR/work-aliases.zsh
fi

zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit light lukechilds/zsh-nvm
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# configure completions
zinit light Aloxaf/fzf-tab
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# shell integrations
eval "$(zoxide init --cmd z zsh)"
eval "$(fzf --zsh)"

# snippets
zinit snippet OMZP::git

# history settings
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups
