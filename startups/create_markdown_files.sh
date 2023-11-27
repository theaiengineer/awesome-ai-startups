#!/bin/bash

# Check if at least one argument is provided
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <name1> [<name2> ...]"
    exit 1
fi

# Create markdown files
for name in "$@"; do
    # Convert to lowercase
    lowercase_name=$(echo "$name" | tr '[:upper:]' '[:lower:]')
    
    # Create markdown file
    echo "# $name" > "$lowercase_name.md"
    echo "## Description" >> "$lowercase_name.md"
    echo "## Founding Team" >> "$lowercase_name.md"
    echo "## Investment Stage" >> "$lowercase_name.md"
    echo "## Unique Achievement" >> "$lowercase_name.md"
    echo "## Top Challenge" >> "$lowercase_name.md"

    # Update README.md
    readme_file="../README.md"

    # Add a new row to the table
    new_row="| [$name](/startups/$lowercase_name.md) | | | | | | | | |"
    echo "$new_row" >> "$readme_file"
done
