#!/bin/bash

find "$(pwd)" -type f -name '*' | while read file; do
    sed -i 's|http://127.0.0.1:25500/sub|https://sub.misaka-network.top/sub|g' "$file"
done
