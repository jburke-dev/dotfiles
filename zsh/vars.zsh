export EDITOR=/opt/nvim-linux-x86_64/bin/nvim

safely_add_to_path /opt/nvim-linux-x86_64/bin
safely_add_to_path "$HOME/.dotnet"
safely_add_to_path "$HOME/open-source/fzf/bin"
safely_add_to_path "$HOME/.local/bin"
safely_add_to_path "$HOME/.local/bin/lua-ls/bin"
safely_add_to_path "$HOME/.local/bin/go/bin"
safely_add_to_path "$HOME/go/bin"
safely_add_to_path "/snap/bin"

export GOPATH="$HOME/.local/bin/go"
