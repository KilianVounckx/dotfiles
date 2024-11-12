export PS1="[\u@\h \w]\$ "

alias ls='ls --color'
alias grep='grep --color'

alias fzf='fzf --preview="bat --color=always {}"'

export CARGO_HOME="$HOME/.local/opt/cargo"
export RUSTUP_HOME="$HOME/.local/opt/rustup"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/opt/cargo/bin:$PATH"
