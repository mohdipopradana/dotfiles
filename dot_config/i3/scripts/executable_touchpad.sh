#!/bin/bash

# Device 'ELAN1300:00 04F3:3087 Touchpad':
# 	Device Enabled (175):	1
# 	Coordinate Transformation Matrix (177):	1.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000, 0.000000, 0.000000, 1.000000
# 	libinput Tapping Enabled (333):	1
# 	libinput Tapping Enabled Default (334):	0
# 	libinput Tapping Drag Enabled (335):	1
# 	libinput Tapping Drag Enabled Default (336):	1
# 	libinput Tapping Drag Lock Enabled (337):	0
# 	libinput Tapping Drag Lock Enabled Default (338):	0
# 	libinput Tapping Button Mapping Enabled (339):	1, 0
# 	libinput Tapping Button Mapping Default (340):	1, 0
# 	libinput Natural Scrolling Enabled (304):	1
# 	libinput Natural Scrolling Enabled Default (305):	0
# 	libinput Disable While Typing Enabled (341):	1
# 	libinput Disable While Typing Enabled Default (342):	1
# 	libinput Scroll Methods Available (306):	1, 1, 0
# 	libinput Scroll Method Enabled (307):	1, 0, 0
# 	libinput Scroll Method Enabled Default (308):	1, 0, 0
# 	libinput Click Methods Available (343):	1, 1
# 	libinput Click Method Enabled (344):	1, 0
# 	libinput Click Method Enabled Default (345):	1, 0
# 	libinput Middle Emulation Enabled (313):	0
# 	libinput Middle Emulation Enabled Default (314):	0
# 	libinput Accel Speed (315):	0.500000
# 	libinput Accel Speed Default (316):	0.000000
# 	libinput Accel Profiles Available (317):	1, 1, 1
# 	libinput Accel Profile Enabled (318):	1, 0, 0
# 	libinput Accel Profile Enabled Default (319):	1, 0, 0
# 	libinput Accel Custom Fallback Points (320):	<no items>
# 	libinput Accel Custom Fallback Step (321):	0.000000
# 	libinput Accel Custom Motion Points (322):	<no items>
# 	libinput Accel Custom Motion Step (323):	0.000000
# 	libinput Accel Custom Scroll Points (324):	<no items>
# 	libinput Accel Custom Scroll Step (325):	0.000000
# 	libinput Left Handed Enabled (326):	0
# 	libinput Left Handed Enabled Default (327):	0
# 	libinput Send Events Modes Available (289):	1, 1
# 	libinput Send Events Mode Enabled (290):	0, 0
# 	libinput Send Events Mode Enabled Default (291):	0, 0
# 	Device Node (292):	"/dev/input/event8"
# 	Device Product ID (293):	1267, 12423
# 	libinput Drag Lock Buttons (328):	<no items>
# 	libinput Horizontal Scroll Enabled (329):	1
# 	libinput Scrolling Pixel Distance (330):	15
# 	libinput Scrolling Pixel Distance Default (331):	15
# 	libinput High Resolution Wheel Scroll Enabled (332):	1

if xinput list-props 10 | grep "Device Enabled (175):.*1" >/dev/null
then
    xinput disable 10
    notify-send 'Trackpad disabled'
else
    xinput enable 10
    notify-send 'Trackpad enabled'
fi
