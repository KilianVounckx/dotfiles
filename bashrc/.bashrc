export PS1="[\u@\h \w]\$ "

alias ls='ls --color'
alias ll='ls --color -lah'
alias grep='grep --color'

alias fzf='fzf --preview="bat --color=always {}"'

export CARGO_HOME="$HOME/.local/opt/cargo"
export RUSTUP_HOME="$HOME/.local/opt/rustup"

export ELAN_HOME="$HOME/.local/opt/elan_home"
[ -s "$ELAN_HOME/env" ] && \. "$ELAN_HOME/env"

export GHCUP_INSTALL_BASE_PREFIX="$HOME/.local/opt"

export HELIX_RUNTIME="$HOME/.local/opt/helix/runtime"

export GOPATH="$HOME/.local/opt/gopath"

export STEEL_HOME="$HOME/.cache/steel"

export OPAMROOT="$HOME/.local/opt/opam"

export NVM_DIR="$HOME/.local/opt/nvm"

export NVM_DIR="$HOME/.local/opt/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.local/bin:$PATH"
export PATH="$CARGO_HOME/bin:$PATH"
export PATH="$HOME/.local/opt/go/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$GHCUP_INSTALL_BASE_PREFIX/.ghcup/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"
export PATH="$HOME/.local/opt/juliaup/bin:$PATH"
export PATH="$HOME/.local/opt/kotlinc/bin:$PATH"
