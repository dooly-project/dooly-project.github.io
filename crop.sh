#!/bin/bash

# Function to process PDF files
process_pdfs() {
    local dir=$1
    for file in "$dir"/*.pdf; do
        if [[ -f "$file" ]]; then
            echo "Processing $file..."
            pdfcrop "$file" "$file"
        fi
    done
}

# Export the function so it's available to find -exec
export -f process_pdfs

# Find all directories and process PDFs in each one
find . -type d -exec bash -c 'process_pdfs "$0"' {} \;

echo "All PDF files have been processed."
