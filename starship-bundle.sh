#!/bin/bash

# starship-modulesディレクトリのパス
MODULES_DIR="./starship-modules"
OUTPUT_FILE="./starship.toml"

# 出力ファイルを初期化
echo "# Merged starship.toml" > "$OUTPUT_FILE"

# starship-modules内のすべてのファイルを処理
for file in "$MODULES_DIR"/*.toml; do
  if [[ -f "$file" ]]; then
    echo "Processing $file..."
    echo -e "\n# Start of $file\n" >> "$OUTPUT_FILE"
    cat "$file" >> "$OUTPUT_FILE"
    echo -e "\n# End of $file\n" >> "$OUTPUT_FILE"
  fi
done

echo "All modules have been merged into $OUTPUT_FILE."