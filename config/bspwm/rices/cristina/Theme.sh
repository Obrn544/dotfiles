#!/usr/bin/env bash
#   ██████╗██████╗ ██╗███████╗████████╗██╗███╗   ██╗ █████╗     ██████╗ ██╗ ██████╗███████╗
#  ██╔════╝██╔══██╗██║██╔════╝╚══██╔══╝██║████╗  ██║██╔══██╗    ██╔══██╗██║██╔════╝██╔════╝
#  ██║     ██████╔╝██║███████╗   ██║   ██║██╔██╗ ██║███████║    ██████╔╝██║██║     █████╗
#  ██║     ██╔══██╗██║╚════██║   ██║   ██║██║╚██╗██║██╔══██║    ██╔══██╗██║██║     ██╔══╝
#  ╚██████╗██║  ██║██║███████║   ██║   ██║██║ ╚████║██║  ██║    ██║  ██║██║╚██████╗███████╗
#   ╚═════╝╚═╝  ╚═╝╚═╝╚══════╝   ╚═╝   ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
#  Author  :  z0mbi3
#  Url     :  https://github.com/gh0stzk/dotfiles
#  Editor  :  https://github.com/Obrn544
#  About   :  This file will configure and launch the rice.
#

# Terminate existing processes if necessary.
. "${HOME}"/.config/bspwm/src/Process.bash

# Current Rice
read -r RICE < "$HOME"/.config/bspwm/.rice

# Vars config for Cristina Rice
# Bspwm border		# Fade true|false	# Shadows true|false	# Corner radius		# Shadow color
BORDER_WIDTH="3"	P_FADE="true"		P_SHADOWS="true"		P_CORNER_R="16"		SHADOW_C="#000000"

# (Rose-Pine Moon) colorschenme
bg="#232136"  fg="#e0def4"

black="#393552"   red="#ea6f91"   green="#9bced7"   yellow="#f1ca93"
blackb="#6e6a86"  redb="#ea6f91"  greenb="#9bced7"  yellowb="#f1ca93"

blue="#34738e"   magenta="#c3a5e6"   cyan="#eabbb9"   white="#faebd7"
blueb="#34738e"  magentab="#c3a5e6"  cyanb="#ebbcba"  whiteb="#e0def4"

# Set bspwm configuration
set_bspwm_config() {
	bspc config border_width ${BORDER_WIDTH}
	bspc config top_padding 1
	bspc config bottom_padding 53
	bspc config left_padding 1
	bspc config right_padding 1
	bspc config normal_border_color "${green}"
	bspc config active_border_color "${black}"
	bspc config focused_border_color "${magenta}"
	bspc config presel_feedback_color "${magenta}"
}

# Terminal colors
set_term_config() {
	cat >"$HOME"/.config/alacritty/rice-colors.toml <<EOF
# Default colors
[colors.primary]
background = "${bg}"
foreground = "${fg}"

# Cursor colors
[colors.cursor]
cursor = "${magenta}"
text = "${bg}"

# Normal colors
[colors.normal]
black = "${black}"
red = "${red}"
green = "${green}"
yellow = "${yellow}"
blue = "${blue}"
magenta = "${magenta}"
cyan = "${cyan}"
white = "${white}"

# Bright colors
[colors.bright]
black = "${blackb}"
red = "${redb}"
green = "${greenb}"
yellow = "${yellowb}"
blue = "${blueb}"
magenta = "${magentab}"
cyan = "${cyanb}"
white = "${whiteb}"
EOF

  # Set kitty colorscheme
  cat >"$HOME"/.config/kitty/current-theme.conf <<EOF
# The basic colors
foreground              ${fg}
background              ${bg}
selection_foreground    ${bg}
selection_background    ${cyan}

# Cursor colors
cursor                  ${magenta}
cursor_text_color       ${bg}

# URL underline color when hovering with mouse
url_color               ${blue}

# Kitty window border colors
active_border_color     ${magenta}
inactive_border_color   ${blackb}
bell_border_color       ${yellow}

# Tab bar colors
active_tab_foreground   ${bg}
active_tab_background   ${magenta}
inactive_tab_foreground ${fg}
inactive_tab_background ${black}
tab_bar_background      ${bg}

# The 16 terminal colors

# black
color0 ${black}
color8 ${blackb}

# red
color1 ${red}
color9 ${redb}

# green
color2  ${green}
color10 ${greenb}

# yellow
color3  ${yellow}
color11 ${yellowb}

# blue
color4  ${blue}
color12 ${blueb}

# magenta
color5  ${magenta}
color13 ${magentab}

# cyan
color6  ${cyan}
color14 ${cyanb}

# white
color7  ${white}
color15 ${whiteb}
EOF

pidof -q kitty && killall -USR1 kitty
}

# Set compositor configuration
set_picom_config() {
	sed -i "$HOME"/.config/bspwm/picom.conf \
		-e "s/normal = .*/normal =  { fade = ${P_FADE}; shadow = ${P_SHADOWS}; }/g" \
		-e "s/dock = .*/dock =  { fade = ${P_FADE}; }/g" \
		-e "s/shadow-color = .*/shadow-color = \"${SHADOW_C}\"/g" \
		-e "s/corner-radius = .*/corner-radius = ${P_CORNER_R}/g" \
		-e "s/\".*:class_g = 'Alacritty'\"/\"100:class_g = 'Alacritty'\"/g" \
		-e "s/\".*:class_g = 'kitty'\"/\"100:class_g = 'kitty'\"/g" \
		-e "s/\".*:class_g = 'FloaTerm'\"/\"100:class_g = 'FloaTerm'\"/g"
}

# Set dunst config
set_dunst_config() {
	sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 0/g" \
		-e "s/icon_theme = .*/icon_theme = \"${gtk_icons}, Adwaita\"/g" \
		-e "s/frame_color = .*/frame_color = \"${bg}\"/g" \
		-e "s/separator_color = .*/separator_color = \"${red}\"/g" \
		-e "s/font = .*/font = JetBrainsMono NF Medium 9/g" \
		-e "s/foreground='.*'/foreground='${green}'/g"

	sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
	cat >>"$HOME"/.config/bspwm/dunstrc <<-_EOF_
		[urgency_low]
		timeout = 3
		background = "${bg}"
		foreground = "${magenta}"

		[urgency_normal]
		timeout = 5
		background = "${bg}"
		foreground = "${fg}"

		[urgency_critical]
		timeout = 0
		background = "${bg}"
		foreground = "${red}"
	_EOF_
}

# Set eww colors
set_eww_colors() {
	cat >"$HOME"/.config/bspwm/eww/colors.scss <<EOF
\$bg: ${bg};
\$bg-alt: #2a2740;
\$fg: ${fg};
\$black: ${black};
\$red: ${red};
\$green: ${green};
\$yellow: ${yellow};
\$blue: ${blue};
\$magenta: ${magenta};
\$cyan: ${cyan};
\$archicon: #0f94d2;
EOF
}

set_launchers() {
	# Jgmenu
	sed -i "$HOME"/.config/bspwm/jgmenurc \
		-e "s/color_menu_bg = .*/color_menu_bg = ${bg}/" \
		-e "s/color_norm_fg = .*/color_norm_fg = ${fg}/" \
		-e "s/color_sel_bg = .*/color_sel_bg = #2a2740/" \
		-e "s/color_sel_fg = .*/color_sel_fg = ${fg}/" \
		-e "s/color_sep_fg = .*/color_sep_fg = ${black}/"

	# Rofi launchers
	cat >"$HOME"/.config/bspwm/src/rofi-themes/shared.rasi <<EOF
// Rofi colors for Cristina

* {
    font: "JetBrainsMono NF Bold 9";
    background: ${bg};
    bg-alt: #2a2740;
    background-alt: ${bg}E0;
    foreground: ${fg};
    selected: ${magenta};
    active: ${green};
    urgent: ${red};

    img-background: url("~/.config/bspwm/rices/${RICE}/rofi.webp", width);
}
EOF
}

# Launch theme
launch_theme() {

  # Set random wallpaper for actual rice
	feh -z --no-fehbg --bg-fill "${HOME}"/.config/bspwm/rices/"${RICE}"/walls

	# Launch dunst notification daemon
	dunst -config "${HOME}"/.config/bspwm/dunstrc &

	# Launch polybar
	sleep 0.1
	for mon in $(polybar --list-monitors | cut -d":" -f1); do
		MONITOR=$mon polybar -q cristina-bar -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini &
	done
}

### Apply Configurations

set_bspwm_config
set_term_config
set_picom_config
set_dunst_config
set_eww_colors
set_launchers
launch_theme
