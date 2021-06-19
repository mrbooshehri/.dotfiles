#!/bin/sh

VER='11.0'
URL="https://www.unicode.org/Public/emoji/${VER}/emoji-test.txt"
#DIR="$HOME/.cache"
DIR="$HOME/.config/rofi/rofiemoji"
FILE="$DIR/emojis.txt"

if [ ! -r $FILE ]
then
  if [ ! -d $DIR ]; then mkdir $DIR; fi
  curl $URL | grep -v '^#' | grep ' ; fully-qualified ' | cut -d'#' -f2 > $FILE
fi

if [ "$@" ]
then
  smiley=$(echo $@ | cut -d' ' -f1)
  echo -n "$smiley" | xsel -bi
  notify-send -t 2000 -u low "Emoji" "$smiley copied to the clipboard."
  exit 0
fi

cat $FILE
