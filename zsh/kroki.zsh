kroki_mermaid() {
    cat "$1" | read file_data
    curl http://localhost:8000/mermaid/svg --data-raw "$file_data" -o output.svg
}
