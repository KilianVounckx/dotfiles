export PS1="[\u@\h \w]\$ "

alias ls='ls --color'
alias ll='ls --color -lah'
alias grep='grep --color'

alias fzf='fzf --preview="bat --color=always {}"'

export CARGO_HOME="$HOME/.local/opt/cargo"
export RUSTUP_HOME="$HOME/.local/opt/rustup"

export ELAN_HOME="$HOME/.local/opt/elan_home"

export GHCUP_INSTALL_BASE_PREFIX="$HOME/.local/opt"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/opt/cargo/bin:$PATH"
export PATH="$HOME/.local/opt/.ghcup/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/.local/opt/elan_home/toolchains/leanprover--lean4---v4.13.0/bin:$PATH"

export LINGO_20_HOME="/home/kilianvounckx/Documents/KUL/computergesteund_probleemoplossen/labs/lingo"

export PATH="/home/kilianvounckx/Documents/KUL/computergesteund_probleemoplossen/labs/lingo:$PATH"
