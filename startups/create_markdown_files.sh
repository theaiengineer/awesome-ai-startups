#!/bin/bash

# Check if at least one argument is provided
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <name1> [<name2> ...]"
    exit 1
fi

# Get the script directory
script_dir=$(dirname "$(readlink -f "$0")")

# Create markdown files
for name in "$@"; do
    # Convert to lowercase
    lowercase_name=$(echo "$name" | tr '[:upper:]' '[:lower:]')

    # Create directory if not exists
    mkdir -p "$script_dir/$lowercase_name"

    # Create markdown file inside the directory
    readme_path="$script_dir/$lowercase_name/README.md"
    echo "# $name" > "$readme_path"
    echo "## Description" >> "$readme_path"
    echo "## Founding Team" >> "$readme_path"
    echo "## Investment Stage" >> "$readme_path"
    echo "## Unique Achievement" >> "$readme_path"
    echo "## Top Challenge" >> "$readme_path"

    # Update README.md
    readme_file="$script_dir/../README.md"

    # Add a new row to the table
    new_row="| [$name](/startups/$lowercase_name/README.md) | | | | | | | | |"
    echo "$new_row" >> "$readme_file"
done
