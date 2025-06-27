# config.nu
#
# Installed by:
# version = "0.103.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

$env.config.buffer_editor = "hx"

$env.config.show_banner = false

$env.PROMPT_COMMAND = {
    let pwd_part = (
        $"!!(pwd)"
        | str replace $"!!($env.HOME)" ~
        | str trim --left --char '!'
    )
    $"($env.USERNAME)@(ansi --escape {attr: b})($pwd_part)(ansi reset)"
}

source git-completions.nu
source cargo-completions.nu
source just-completions.nu

use std/dirs shells-aliases *

alias fg = job unfreeze
alias flix = java -jar $"($env.HOME)/.local/opt/flix/flix.jar"
