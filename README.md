# i3-Desktop

My Configs For My i3 Desktop

## Dependencies
### Ubuntu

* `i3`
* `i3status`
* `i3lock`
* `dmenu`
* `feh`
* `scrot`
* `urxvt` set as default terminal
* `arandr`
* `ffmpeg`
* `fonts-font-awesome`
* `arc-theme`
* `libnotify-bin`
* `dunst`

## Shortcuts

| Key                        | Purpose                                                                             |
| ---                        | -------                                                                             |
| $mod + Return              | terminal                                                                            |
| $mod + d                   | dmenu_run                                                                           |
| $mod + Control + d         | i3-dmenu-desktop                                                                    |
| $mod + j(k,l,uring)        | Focus left(down, up, right) window                                                  |
| $mod + x                   | Focus on latest urgent window                                                       |
| $mod + Left(Down,Up,Right) | Focus left(down, up, right) window                                                  |
| $mod + Shift + j(k,l,uring) | Move focused window left (down, up, right)                                         |
| $mod + Shift+ Left(Down,Up,Right) | Move focused window left (down, up, right)                                   |
| $mod + h                   | Split the current container horizontally                                            |
| $mod + v                   | Split the current container vertically                                              |
| $mod + f                   | Fullscreen mode for the focused container                                           |
| $mod + s                   | Change the current container layout (toogle split)                                  |
| $mod + w                   | Change the current container layout (stacking)                                      |
| $mod + e                   | Change the current container layout (tabbed)                                        |
| $mod + o                   | Move the whole workspace to the next output                                         |
| $mod + Shift + minus       | Make the currently focused window a scratchpad                                      |
| $mod + minus               | Show the first a scratchpad window                                                  |
| $mod + Shift + space       | Toggle floating status of the focused container                                     |
| $mod + space               | Change focus between tiling and floating windows                                    |
| $mod + a                   | Focus parent container                                                              |
| $mod + (1-9,0)             | Switch to workspaces with number 1-10                                               |
| $mod + Shift + (1-9,0)     | Move the container to the workspaces with number 1-10                               |
| $mod + Shift + c           | Reload the configuration file                                                       |
| $mod + Shift + r           | Restart I3 inplace                                                                  |
| $mod + Shift + e           | Log out                                                                             |
| $mod + r                   | Activate resize mode                                                                |
| Mod1 + Control + l         | Loct the system                                                                     |
| Mod1 + Control + delete    | Activate power mode (reboot, shutdown, suspend, hybernate)                          |
| Print                      | Activate print mode                                                                 |
| $mod + Shift + d           | Activate display mode                                                               |
| $mod + n                   | ncmpcpp                                                                             |
| $mod + period              | ranger                                                                              |
| $mod + m                   | mc                                                                                  |
| $mod + t                   | notification with date                                                              |
| $mod + n                   | notification with npc current playing                                               |
| $mod + i                   | notification with IP address                                                        |
| $mod + Shift + s           | notification with free space on disks                                               |
| $mod + Shift + h           | show shortcuts help                                                                 |
| $mod + p                   | notification with pomodoro status                                                   |
| $mod + Control + y         | mpc prev                                                                            |
| XF86AudioPrev              | mpc prev                                                                            |
| $mod + Control + x         | mpc play                                                                            |
| XF86AudioPlay              | mpc play                                                                            |
| $mod + Control + c         | mpc toggle                                                                          |
| $mod + Control + v         | mpc stop                                                                            |
| XF86AudioStop              | mpc stop                                                                            |
| $mod + Control + b         | mpc next                                                                            |
| XF86AudioNext              | mpc next                                                                            |
| XF86MonBrightnessUp        | xbacklight -inc 20                                                                  |
| XF86MonBrightnessDown      | xbacklight -dec 20                                                                  |
| XF86Calculator             | xcalc                                                                               |
| XF86AudioRaiseVolume       | pactl set-sink-volume 1 +5%                                                         |
| XF86AudioLowerVolume       | pactl set-sink-volume 1 -5%                                                         |
| XF86AudioMute              | pactl set-sink-mute 1 toggle                                                        |
| $mod+KP_Add                | pactl set-sink-volume 1 +5%                                                         |
| $mod+KP_Subtract           | pactl set-sink-volume 1 -5%                                                         |
| $mod+KP_Multiply           | pactl set-sink-mute 1 toggle                                                        |

mod1 = Alt key; mod4 = Win key ($mod) 

## Screenshots
![i3-desktop](screenshots/desktop.png)

![i3-desktop](screenshots/ranger_screenfetch_ncmpcpp_mplayer.png)

![i3-desktop](screenshots/notification.png)
dunst (notification)

![i3-desktop](screenshots/dmenu_desktop.png)
dmenu

![i3-desktop](screenshots/dmenu.png)
dmenu

![i3-desktop](screenshots/mode_power.png)
power mode

![i3-desktop](screenshots/mode_print.png)
print mode

![i3-desktop](screenshots/mode_display.png)
display mode
