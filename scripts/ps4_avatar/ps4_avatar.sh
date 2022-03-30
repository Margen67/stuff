#!/usr/bin/env bash

set -e

prompt_error() {
    read -rn1 -p $'\e[31mERROR:\e[0m'" $1"$'\n\nPress any key to continue . . . '
    exit 1
}

if ! hash magick 2>/dev/null; then
    prompt_error 'ImageMagick not found!'
    exit 1
fi

if [ ! -f "$1" ]; then
    prompt_error 'No image to convert!'
    exit 1
else
    avatar_image_path_input="$1"
fi
if [ -z $2 ]; then
    avatar_image_path_output=ps4_avatar_out
else
    avatar_image_path_output="$2"
fi

avatar_sizes=(440 260 128 64)
avatar_image_width=$(magick identify -format %w "$avatar_image_path_input")
avatar_image_height=$(magick identify -format %h "$avatar_image_path_input")
if [ $(($avatar_image_width / $avatar_image_height)) -ne 1 ]; then
    prompt_error "Avatar image aspect ratio isn't 1:1."
fi

if [ ! -d "$avatar_image_path_output" ]; then
    mkdir -p "$avatar_image_path_output"
else
    prompt_error 'Output path already exists!'
fi

if [ $avatar_image_width -lt ${avatar_sizes[0]} ]; then
    avatar_image_size_warning=width
fi
if [ $avatar_image_height -lt ${avatar_sizes[0]} ]; then
    if [ -z $avatar_image_size_warning ]; then
        avatar_image_size_warning=height
    else
        avatar_image_size_warning+=' and height'
    fi
fi
#echo_warning() {
#    echo -e "\e[33mWARNING:\e[0m ${1}\n"
#}
if [ -n "$avatar_image_size_warning" ]; then
    echo -e "\e[33mWARNING:\e[0m Avatar image $avatar_image_size_warning is less than ${avatar_sizes[0]}px.\n"
    #echo_warning "Avatar image $avatar_image_size_warning is less than ${avatar_sizes[0]}px."
fi

magick convert "$avatar_image_path_input" -resize ${avatar_sizes[0]} "${avatar_image_path_output}/avatar.png"
for avatar_size in ${avatar_sizes[@]}; do
    magick convert "$avatar_image_path_input" -resize $avatar_size "${avatar_image_path_output}/avatar${avatar_size}.dds"
done

echo -e "\e[32mPS4 avatar successfully saved to '$(realpath "$avatar_image_path_output")'\e[0m"
