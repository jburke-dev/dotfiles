# Load keys from a given env file
# Usage: load_keys <path_to_env_file>
load_keys() {
    export $(grep -v '^#' "$1" | xargs)
}

# add a directory to PATH if it's not already there
# Usage: safely_add_to_path <dir>
safely_add_to_path() {
    local dir="$1"
    if [[ -d "$dir" && ! ":$PATH:" == *":$dir:"* ]]; then
        export PATH="$dir:$PATH"
    fi
}
