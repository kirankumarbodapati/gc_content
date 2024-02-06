#!/bin/bash
if [ -z "$1" ]; then
   echo "Usage: $0 <fasta_file>"
   exit 1
fi

fasta_file="$1"
gc_bases=$(awk '/^[^>]/ { g += gsub(/[GCgc]/, ""); t += length } END { print g }' "$fasta_file")
total_bases=$(awk '/^[^>]/ {t += length} END { print t}' "$fasta_file")

gc_content=$(awk "BEGIN { printf \"%.4f\", $gc_bases / $total_bases * 100 }") 
echo "GC content in $fasta_file: $gc_content%" 