#!/usr/bin/env bash

# Prompt the user for input
echo "Enter blog post name: ";
read postTitle;

# Transform the input using sed and tr to a directory name
blogDirectoryName=$(echo "${postTitle}" | sed -e 's/ /-/g' | tr '[:upper:]' '[:lower:]');

# Truncate the transformed input to a maximum length of 40 characters
max_length=40;
blogDirectoryName=$(echo "${blogDirectoryName}" | cut -c 1-${max_length});

#Create directory and template file
mkdir -p "content/blog/${blogDirectoryName}";
filename="content/blog/${blogDirectoryName}/index.md"
touch "${filename}"
today=$(date +"%Y-%m-%d")
template=$(cat <<EOF
---
title: "${postTitle}"
date: "${today}"
description: "Insert Description here"
---
EOF
) 
echo "${template}" >> "${filename}"
echo "${blogDirectoryName} created at content/blog/"