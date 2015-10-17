ipc-socket /run/user/1000/i3/ipc.sock

set $mod Mod4
set $mod2 Mod1

set $background       {{ background }}
set $foreground       {{ foreground }}
set $gray             {{ alt_black }}
set $primary          {{ primary }}
set $secondary        {{ secondary }}
set $tertiary         {{ tertiary }}
set $warning          {{ special }}

set $gapsInner        {{ gapsInner }}
set $gapsOuter        {{ gapsOuter }}
set $border           {{ border }}

set $ws1  "1: web"
set $ws2  "2: music"
set $ws3  "3: im"
set $ws4  "4: term"
set $ws5  "5: misc"
set $ws6  "6: games"
set $ws7  "7: 7"
set $ws8  "8: 8"
set $ws9  "9: 9"
set $ws10 "10: outer space"

font pango:Terminus 8
gaps inner $gapsInner
gaps outer $gapsOuter

exec_always --no-startup-id feh --bg-scale ~/.wallpaper.png
exec --no-startup-id lxpolkit &
exec --no-startup-id redshift &
exec --no-startup-id xfce4-power-manager &
exec --no-startup-id compton &

exec --no-startup-id dex -ae i3

floating_modifier $mod
hide_edge_borders both
new_window pixel $borderpx
new_float normal $borderpx

bindsym $mod+Shift+q kill

bindsym $mod+Return exec --no-startup-id i3-sensible-terminal
bindsym $mod+Shift+t exec --no-startup-id ~/.config/i3/scripts/themes
bindsym $mod+d exec --no-startup-id i3-dmenu-desktop --dmenu='rofi -dmenu -p "run: "'
# bindsym $mod+d exec dmenu_run -w 1000 -h 38 -x 183 -y 300 -nb "{{ black }}" -nf "{{ tertiary }}" -sb "{{ secondary }}" -sf "{{ black }}"

bindsym --release Print exec --no-startup-id shutter -e -f
bindsym --release Mod1+Print exec --no-startup-id shutter -e -a
bindsym --release Control+Print exec --no-startup-id shutter -e -s

bindsym $mod+Insert exec --no-startup-id mpc -q toggle
bindsym $mod+End exec --no-startup-id mpc -q next
bindsym $mod+Home exec --no-startup-id mpc -q prev
bindsym $mod+KP_Add exec --no-startup-id amixer -q -D pulse set Master 1%+ unmute
bindsym $mod+KP_Subtract exec --no-startup-id amixer -q -D pulse set Master 1%- unmute

bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+odiaeresis focus right
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+odiaeresis move right
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

bindsym $mod+h split h
bindsym $mod+v split v

bindsym $mod+f fullscreen

bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

bindsym $mod+space focus mode_toggle
bindsym $mod+Shift+space floating toggle

bindsym $mod+a focus parent
bindsym $mod+b focus child

workspace_layout tabbed
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8
bindsym $mod+9 workspace $ws9
bindsym $mod+0 workspace $ws10
bindsym $mod+Tab workspace back_and_forth

workspace_auto_back_and_forth yes

bindsym $mod+Control+Shift+Left move window to workspace prev
bindsym $mod+Control+Shift+Right move window to workspace next

bindsym $mod+Control+Shift+Prior move container to output left
bindsym $mod+Control+Shift+Next move container to output right

bindsym $mod+Shift+1 move container to workspace number $ws1
bindsym $mod+Shift+2 move container to workspace number $ws2
bindsym $mod+Shift+3 move container to workspace number $ws3
bindsym $mod+Shift+4 move container to workspace number $ws4
bindsym $mod+Shift+5 move container to workspace number $ws5
bindsym $mod+Shift+6 move container to workspace number $ws6
bindsym $mod+Shift+7 move container to workspace number $ws7
bindsym $mod+Shift+8 move container to workspace number $ws8
bindsym $mod+Shift+9 move container to workspace number $ws9
bindsym $mod+Shift+0 move container to workspace number $ws10

# colors                BORDER      BACKGROUND  TEXT        INDICATOR
client.focused          $background $background $foreground $primary
client.focused_inactive $background $primary    $foreground $background
client.unfocused        $secondary  $secondary  $foreground $secondary
client.urgent           $warning    $warning    $foreground $warning

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
    id                status_bar
    height            20

    status_command    py3status -c ~/.config/i3status/config
    position          top
    workspace_buttons no
    tray_output       no

    font {{ font }}

    colors {
        background $background
        statusline $primary

        # Colors go        <border>    <background> <text>      <indicator>
        focused_workspace  $secondary  $background  $foreground
        active_workspace   $primary    $background  $foreground
        inactive_workspace $primary    $background  $foreground
        urgent_workspace   $foreground $warning
    }
}

bar {
    id              navigation_bar
    height          20

    status_command  py3status -c ~/.config/i3status/config2
    position        bottom
    modifier        $mod2

    font {{ font }}

    colors {
        background $background
        statusline $primary

        # Colors go        <border>    <background> <text>      <indicator>
        focused_workspace  $secondary  $secondary   $foreground $secondary
        active_workspace   $primary    $background  $foreground $background
        inactive_workspace $background $background  $foreground $background
        urgent_workspace   $foreground $warning
    }
}

assign [class="Firefox"] → $ws1
assign [class="jetbrains-webstorm"] → $ws5
assign [class="Sublime_text"] → $ws5
assign [class="Atom"] → $ws5
assign [class="Thunar"] → $ws5
assign [class="(?i)libreoffice*"] → $ws5
assign [class="Soffice"] → $ws5
assign [class="^qemu*"] → $ws5
assign [class="Transmission"] → $ws5
assign [class="spicec"] → $ws5
assign [class="Pidgin"] → $ws3
assign [class="Skype"] → $ws3
assign [class="Ts3client"] → $ws3
assign [class="Telegram"] → $ws3
assign [class="Wine"] → $ws6
assign [class="Steam"] → $ws6
assign [class="hl2_linux"] → $ws6
assign [class="[tT]rine*"] → $ws6
assign [class="TLauncher"] → $ws6
assign [class="Minecraft"] → $ws6
assign [class="net-mcgl-MCGLLauncher"] → $ws6
assign [class="Gimp"] → $ws5
assign [class="Vlc"] → $ws5

for_window [window_role="pop-up"] floating enable
for_window [window_role="task_dialog"] floating enable
for_window [instance="float"] floating enable
for_window [class="Shutter"] floating enable
for_window [class="^Minecraft[^Launcher]"] floating enable

bindsym $mod+Shift+c reload
bindsym $mod+Shift+r restart
bindsym $mod+Shift+e exec --no-startup-id ~/.config/i3/scripts/power

bindsym $mod+n gaps inner all set 1; gaps outer all set 0; border none; bar mode hide navigation_bar
bindsym $mod+m gaps inner all set $gapsInner; gaps outer all set $gapsOuter; border pixel $borderpx; bar mode dock navigation_bar

mode "resize" {
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym odiaeresis resize grow width 10 px or 10 ppt

        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"

bindsym $mod+shift+minus move scratchpad
bindsym $mod+minus scratchpad show
