export PS1="[\u@\h \w]\$ "

alias ls='ls --color'
alias ll='ls --color -lah'
alias grep='grep --color'

alias fzf='fzf --preview="bat --color=always {}"'

export CARGO_HOME="$HOME/.local/opt/cargo"
export RUSTUP_HOME="$HOME/.local/opt/rustup"

export ELAN_HOME="$HOME/.local/opt/elan_home"

export GHCUP_INSTALL_BASE_PREFIX="$HOME/.local/opt"

export HELIX_RUNTIME="$HOME/.local/opt/helix/runtime"

export GOPATH="$HOME/.local/opt/gopath"

export STEEL_HOME="$HOME/.cache/steel"

export OPAMROOT="$HOME/.local/opt/opam"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$CARGO_HOME/bin:$PATH"
export PATH="$HOME/.local/opt/go/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$GHCUP_INSTALL_BASE_PREFIX/.ghcup/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$ELAN_HOME/toolchains/leanprover--lean4---v4.13.0/bin:$PATH"
export PATH="$PATH:$HOME/.dotnet/tools"
