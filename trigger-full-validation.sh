#!/bin/bash

# Script to trigger full validation of all MDX files
# Adds a hidden HTML comment to each file to trigger Mintlify validation

echo "Adding validation trigger comment to all .mdx files..."

# Find all .mdx files and add a comment at the end
find . -name "*.mdx" -type f | while read file; do
    echo "Processing: $file"
    # Add HTML comment at the end of file if it doesn't exist
    if ! grep -q "<!-- validation-check -->" "$file"; then
        echo "" >> "$file"
        echo "<!-- validation-check -->" >> "$file"
    fi
done

echo ""
echo "Done! All .mdx files modified."
echo "Files modified: $(find . -name "*.mdx" -type f | wc -l)"
