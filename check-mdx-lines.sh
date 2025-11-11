#!/bin/bash

# Script to check line counts in all .mdx files in the docs directory
# Helps identify which files still need condensation

echo "=== MDX File Line Counts ==="
echo ""
echo "Format: Lines | File Path"
echo "----------------------------------------"

# Find all .mdx files and count lines, sorted by line count (descending)
find . -name "*.mdx" -type f -exec wc -l {} \; | sort -rn

echo ""
echo "=== Summary ==="
total_files=$(find . -name "*.mdx" -type f | wc -l)
total_lines=$(find . -name "*.mdx" -type f -exec wc -l {} \; | awk '{sum+=$1} END {print sum}')

echo "Total .mdx files: $total_files"
echo "Total lines: $total_lines"
echo ""

echo "=== Files > 300 lines (candidates for condensation) ==="
find . -name "*.mdx" -type f -exec wc -l {} \; | awk '$1 > 300 {print $1 " | " $2}' | sort -rn

echo ""
echo "=== Files > 400 lines (high priority) ==="
find . -name "*.mdx" -type f -exec wc -l {} \; | awk '$1 > 400 {print $1 " | " $2}' | sort -rn
