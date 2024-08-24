from libqtile import bar, layout, qtile, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
# from libqtile.widget import backlight
import os

import subprocess

@hook.subscribe.startup_once
def startup_once():
    subprocess.run('/home/anhtuan/.dotfiles/qtile/autostart.sh')

mod       = "mod4"
mod1      = "mod1"

terminal  =  "wezterm"
myBrowser =  "qutebrowser"
myFm      =  "wezterm -e yazi"

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),

    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    ########## ATD keys ##########
    Key([mod], "o", lazy.spawn(myBrowser), desc="Launch QuteBrowser"),
    Key([mod], "b", lazy.spawn("chromium"), desc="Launch Chromium"),
    Key([mod], "e", lazy.spawn(myFm), desc="Launch Ranger"),
    # Key([mod], "a", lazy.spawn("rofi -modi drun,run -show drun -theme gruvbox-dark -show-icon"), desc="Launch Apps"),
    Key([mod], "a", lazy.spawn("/home/anhtuan/.config/rofi/launchers/type-1/launcher.sh"), desc="Launch Apps"),

    # Sound and Mpd
    Key([], "XF86AudioRaiseVolume",
        lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +10%")),
    Key([], "XF86AudioLowerVolume",
        lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -10%")),
    # Key([], "XF86AudioMute",
    #     lazy.spawn("amixer sset Master toggle")),

    Key([], "XF86MonBrightnessUp",
        lazy.spawn("sudo light -A 10")),
    Key([], "XF86MonBrightnessDown",
        lazy.spawn("sudo light -U 10")),

] # End keys

# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 3):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )

groups = [Group(i) for i in "123"]

for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )

## COLORS
colo = ["#282828", # 00 background
        "#b85651", # 01 red
        "#bd6f3e", # 02 orange
        "#c18f41", # 03 yellow
        "#8f9a52", # 04 green
        "#72966c", # 05 aqua
        "#68948a", # 06 blue
        "#ab6c7d", # 07 purple
        "#208042", # 08 border focus
        "#b3b3b3", # 09 widget foreground
    ]

layout_theme = {
    "border_width": 4,
    "margin": 12,
    "border_focus": colo[8],
    "border_normal": colo[0],
    "border_focus_stack": [colo[7], colo[0]]
}

layouts = [
    layout.Columns(**layout_theme),
    layout.Max(),
    # layout.Floating(**layout_theme),
    ]

widget_defaults = dict(
    font="JetbrainsLGM Nerd Font",
    fontsize=14,
    padding=3,
    foreground=colo[9],
)

extension_defaults = widget_defaults.copy()

screens = [
    Screen(

        wallpaper='~/Pictures/HinhNen/hinh-nen-00.jpg',
        wallpaper_mode='fill',
        
        top=bar.Bar(
            [
                widget.TextBox(),
                widget.CurrentLayoutIcon(
                       scale=0.4,
                ),
                widget.TextBox(),
                widget.GroupBox(
                       active=colo[4],
                       # inactive=colo[8],
                       borderwidth=0,
                       fontsize=18,
                       padding=10,
                ),
                widget.TextBox(),
                widget.Prompt(
                       prompt='{prompt}   : ',
                       fontsize=16,
                       foreground="#ffffff",
                       background="#22BA5C50",
                ),
                widget.WindowName(
                ),
                widget.Chord(
                       chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                       name_transform=lambda name: name.upper(),
                ),
                widget.Memory(
                       format='{Active: .0f}{ms}/{SwapTotal: .0f}{ms}  ',
                ),
                widget.TextBox("⸽"),
                widget.Backlight(
                       fmt='{} 󱩖',
                       backlight_name="intel_backlight",
                       change_command='xbacklight -set {1200}',
                ),
                widget.TextBox("⸽"),
                widget.Systray(
                       icon_size=24,
                ),
                widget.TextBox("⸽"),
                widget.Clock(format="%d-%m-%Y 󰔠 "),

                widget.TextBox("⸽"),
                widget.Clock(
                       format=" %I:%M 󰥔 ",
                       fontsize=18,
                ),
                widget.QuickExit(
                       default_text=' 󰐥 ',
                       countdown_start=2,
                       countdown_format='[{}]',
                       background="#880000",
                       fontsize=22,
                ),
            ],
            44,
            margin=12,
            background="#282828",
            opacity=0.8,
        ),
        # x11_drag_polling_rate = 60,
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  
        Match(wm_class="makebranch"),  
        Match(wm_class="maketag"),  
        Match(wm_class="ssh-askpass"),
        Match(title="branchdialog"),  
        Match(title="pinentry"),
    ],
    border_width=layout_theme["border_width"],
    border_focus=layout_theme["border_focus"],
    border_normal=layout_theme["border_normal"],
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# xcursor theme (string or None) and size (integer) for Wayland backend
wl_xcursor_theme = None
wl_xcursor_size = 24

# java that happens to be on java's whitelist.
wmname = "LG3D"
