from libqtile import bar, widget
from libqtile.layout.xmonad import MonadTall
from libqtile.layout.tree import TreeTab
from libqtile.layout.floating import Floating
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy
from modules.hooks import *
import os

## Personal imports - located on the modules folder ##
from modules.colors import tokyonight

mod = "mod4"
terminal = "kitty"

## Keybindings ##

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    # Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    
    #Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    #Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    #Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    #Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    #Key([mod, "control"], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod, "control"], "l", 
        lazy.layout.shrink(),
        desc="shrink monadtall window",
    ),
    Key([mod, "control"], "h",
        lazy.layout.grow(),
        desc="expand monadtall window",
    ),
    #Toggle floating
    Key([mod, "shift"], "f", lazy.window.toggle_floating(), desc='Toggle floating'),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    #Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    
    # Personal Rofi scripts
    Key([mod], "space",
        lazy.spawn("rofi -show drun -theme ~/.config/rofi/launcher.rasi"),
        desc="rofi launcher"
        ),
    Key([mod], "q",
        lazy.spawn(os.path.expanduser('~/.config/rofi/scripts/rofi-power-qtile.sh')),
        desc="powermenu"
        ),
    Key([mod], "s",
        lazy.spawn(os.path.expanduser('~/.config/rofi/scripts/rofi-locate.sh'), shell = True),
        desc="searcher"
        ),
    Key([mod], "p",
        lazy.spawn(os.path.expanduser('~/.config/rofi/scripts/search.sh'), shell = True),
        desc="pdf searcher"
        ),
    Key([mod],"b",
        lazy.spawn("betterlockscreen -l blur"),
        desc="lockscreen"
        ),

    # Scrot
    Key([],
        "Print",
        lazy.spawn("scrot '%Y-%m-%d-%s.png' -e 'mv $f ~/Pictures/screenshots'"),
        desc="screenshots",
    ),
    Key([mod],"Print",
        lazy.spawn("scrot -s '%Y-%m-%d-%s.png' -e 'mv $f ~/Pictures/screenshots'"),
        desc="select screenshot",
        ),

    # Launch applications
    Key([mod], "r",
        lazy.spawn("kitty fish -c ranger"),
        desc="launch ranger"
        ),
    Key([mod], "n",
        lazy.spawn("kitty fish -c nvim"),
        desc="launch nvim"
        ),
    Key([mod], "m",
        lazy.spawn("kitty fish -c ncmpcpp"),
        desc="music"
        ),
    Key([mod], "z",
        lazy.spawn("tabbed -c zathura -e"),
        desc="tabbed zathura"
    ),
    Key([mod], "e",
        lazy.spawn("emacs"),
        desc="emacs"
    ),

    # Volume control
    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.spawn("amixer sset Master 5%-"),
        desc="Lower volume",
    ),
    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn("amixer sset Master 5%+"),
        desc="Raise volume",
    ),
    Key(
        [],
        "XF86AudioMute",
        lazy.spawn("amixer -D default set Master toggle"),
        desc="Mute volume",
    ),
]

## Groups ##

groups = [
    Group('1', label=""),
    Group('2', label=""),
    Group('3', label='龎'),
    Group('4', label='',
          matches=[Match(wm_class='spotify')],
          ),
    Group('5', label=''),
    Group('6', label='',
          matches=[Match(wm_class='Steam')],
          ),
    Group('7', label='',
          matches=[Match(wm_class='mpv')],
          ),
    Group('8', label='',
          matches=[Match(wm_class='chromium')],
          ),
    Group('9', label='',
          matches=[Match(wm_class='virt-manager')],
          ),
]

group_hotkeys = "123456789"

for i,j in zip(groups,group_hotkeys):
    keys.extend(
        [
            Key(
                [mod],
                j,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
             Key(
                 [mod, "shift"],
                 j,
                 lazy.window.togroup(i.name),
                 desc="move focused window to group {}".format(i.name)),
        ]
    )
# Append scratchpad with dropdowns to groups
groups.append(ScratchPad('scratchpad', [
    DropDown('term', 'kitty', width=0.4, height=0.5, x=0.3, y=0.1, opacity=0.95),
    DropDown('mpd', 'kitty fish -c ncmpcpp', width=0.4, height=0.5, x=0.3, y=0.1, opacity=0.95),
    DropDown('file', 'kitty fish -c ranger', width=0.4, height=0.6, x=0.3, y=0.1, opacity=0.95),
    DropDown('pass', 'keepassxc', width=0.4, height=0.6, x=0.3, y=0.1, opacity=1),
]))
# extend keys list with keybinding for scratchpad
keys.extend([
    Key(["control"], "1", lazy.group['scratchpad'].dropdown_toggle('term')),
    Key(["control"], "2", lazy.group['scratchpad'].dropdown_toggle('mpd')),
    Key(["control"], "3", lazy.group['scratchpad'].dropdown_toggle('file')),
    Key(["control"], "4", lazy.group['scratchpad'].dropdown_toggle('pass')),
])

layout_theme = {
    "border_width":1,
    "margin":3,
    "border_focus":tokyonight['md'],
    "border_normal":tokyonight['bl']
}

layouts = [
    MonadTall(
        **layout_theme,
        single_border_width = 0,
        single_margin = 0,
        ),
    TreeTab(
        active_bg=tokyonight['hl'],
        active_fg=tokyonight['bl'],
        bg_color=tokyonight['bg1'],
        border_width=3,
        font="Jet Brains Mono",
        fontsize=12,
    ),      
]

floating_layout = Floating(
    **layout_theme,
    float_rules=[
        *Floating.default_float_rules,
        Match(wm_class="lxappearance"), #gtk theming
        Match(wm_class="timeshift-gtk"), #timeshift gui
        Match(wm_class="blueman-manager"), #bluetooth
        Match(wm_class="Steam"), #bideo-goymes
        Match(wm_class="nemo"), #nemo
        Match(wm_class="transmission-gtk"), #torrent
        Match(wm_class="gnome-calculator"), #gnome-calculator
        Match(wm_class="keepassxc"), #keepassxc
        Match(wm_class="pentablet"), #xp-pen
        Match(wm_class="kdeconnect-app"), #kdeconnect
        Match(wm_class="obs"), #obs
    ]
)

widget_defaults = dict(
    font="JetBrainsMono Nerd Font",
    fontsize=11,
    padding=6,
    foreground=tokyonight['fg'],
)
extension_defaults = widget_defaults.copy()

## Bar ##

screens = [
    Screen(
        top=bar.Bar(
            [
               widget.Spacer(
                    length=5,
                    background=tokyonight['bg2'],
               ),

                widget.GroupBox(
                    active=tokyonight['fg'],
                    inactive=tokyonight['wh'],
                    highlight_method= 'line',
                    this_current_screen_border=tokyonight['mg'],
                    disable_drag=True,
                    hide_unused=True,
                    fontsize=16,
                    use_mouse_wheel=False,
                ),
                widget.Spacer(),
                widget.CurrentLayout(),
                widget.Sep(
                    padding=3
                ),
                widget.Memory(
                    update_interval=2.5,
                    measure_mem='G',
                ),
                widget.Sep(
                    padding=3
                ),
                widget.TextBox(
                    text="CPU",
                    padding=3
                ),
                widget.CPU(
                    update_interval=2.5,
                    format='{load_percent}%',
                ),
                widget.Sep(
                    padding=3
                ),
                widget.Volume(
                    fmt="墳 {}",
                    font='JetBrainsMono Nerd Font'
                ),
                widget.Sep(
                    padding=3
                ),
                widget.Clock(
                    format="%Y/%d/%m %a %I:%M %p"
                ),
                widget.Sep(
                    padding=3
                ),
                widget.Systray(
                    padding=1,
                ),
            ],
            24,
            background=tokyonight['bg2'],
            opacity=.85,
            # margin = [0,0,0,0],
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
        # Set wallpaper
       # wallpaper = '~/.config/qtile/wallpapers/tokyonight-3.jpg',
       # wallpaper_mode = 'stretch',
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", 
         lazy.window.set_position_floating(),
         start=lazy.window.get_position()
         ),
    Drag([mod], "Button2",
         lazy.window.set_size_floating(),
         start=lazy.window.get_size()
         ),
    Click([mod], "Button3",
          lazy.window.bring_to_front()
          ),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
