#/bin/bash

# Options to be displayed
option0="󰣇 i3"
option1=" VIM 1"
option2=" VIM 2"
option3=" VIM 3"
option4=" VIM 4"
option5=" TMUX"

# Options passed into variable
options="$option0\n$option1\n$option2\n$option3\n$option4\n$option5"

chosen="$(echo -e "$options" | rofi -dmenu -theme ~/.config/rofi/display/menu/keymaps.rasi -p "Keymaps")"

case $chosen in
        $option0) 
            dunstify "$chosen KEYMAPS:" "`tail -n 50 ~/.config/rofi/keymaps/keymap_i3`" ;;
        $option1)
            dunstify "$chosen KEYMAPS:" "`tail -n 100 ~/.config/rofi/keymaps/keymap_vim1`" ;;
        $option2) 
            dunstify "$chosen KEYMAPS:" "`tail -n 100 ~/.config/rofi/keymaps/keymap_vim2`" ;;
        $option3)
            dunstify "$chosen KEYMAPS:" "`tail -n 50 ~/.config/rofi/keymaps/keymap_vim3`" ;;
        $option4)
            dunstify "$chosen KEYMAPS:" "`tail -n 50 ~/.config/rofi/keymaps/keymap_vim4`" ;;
        $option5)
            dunstify "$chosen KEYMAPS:" "`tail -n 50 ~/.config/rofi/keymaps/keymap_tmux`" ;;
esac
