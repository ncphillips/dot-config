# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This repository contains a Hyprland configuration file for a Wayland compositor setup on Arch Linux. Hyprland is a dynamic tiling Wayland compositor with extensive customization options.

## Configuration Structure

The single configuration file `hyprland.conf` is organized into the following sections:

- **Monitors**: Display configuration (eDP-1 at 2560x1600@60, scaled 1.6x)
- **Programs**: Default applications (ghostty terminal, nautilus file manager, walker app launcher, wofi menu)
- **Autostart**: Services launched on startup (elephant, walker, waybar)
- **Environment Variables**: Cursor and HiDPI settings
- **Look and Feel**: Visual settings including:
  - General: gaps (2px in, 4px out), borders, layout (dwindle)
  - Decoration: rounding (10px), opacity, shadows, blur
  - Animations: Custom bezier curves and timing configurations
- **Input**: Keyboard (US layout, caps:escape), touchpad (natural scroll), gestures (3/4 finger workspace switching)
- **Keybindings**: SUPER key as main modifier with vim-style navigation and workspace management
- **Window/Workspace Rules**: Behavior overrides for specific windows

## Testing Configuration Changes

After editing `hyprland.conf`, reload the configuration:

```bash
hyprctl reload
```

To validate syntax before applying (Hyprland will refuse invalid configs):

```bash
# Check Hyprland logs for errors
journalctl --user -u hyprland.service -n 50
```

## Important Configuration Patterns

### Key Modifier
The main modifier is SUPER (Windows key), defined as `$mainMod = SUPER` at hyprland.conf:223.

### Custom Variables
Programs are defined as variables for easy modification (lines 28-31):
- `$terminal = ghostty`
- `$fileManager = nautilus`
- `$appLauncher = walker`

### Animation Timing
Custom bezier curves are defined (lines 128-132) and referenced in animation configurations. When modifying animations, ensure the curve name matches an existing bezier definition.

### Monitor Configuration
Monitor settings use the format: `monitor=NAME,RESOLUTION@REFRESH,POSITION,SCALE`
The primary display (eDP-1) is scaled at 1.6x for HiDPI support (line 18).

## Common Modifications

**Adding keybindings**: Follow the pattern at lines 225-291. Use `bind` for press, `bindl` for release, `bindel` for repeat, `bindm` for mouse.

**Adjusting gaps/borders**: Modify the `general` block (lines 77-94).

**Changing animations**: Edit the `animations` block (lines 123-153). Speed values are in milliseconds.

**Adding window rules**: Use `windowrule` or `windowrulev2` syntax (see lines 304-307).

## External Dependencies

The configuration references external programs that must be installed:
- `ghostty` (terminal)
- `nautilus` (file manager)
- `walker` (app launcher)
- `wofi` (menu)
- `waybar` (status bar)
- `brightnessctl` (brightness control)
- `wpctl` (audio control - part of WirePlumber/PipeWire)
- `playerctl` (media player control)
- `/home/nolan/go/bin/elephant` (custom service)

## Hyprland Documentation

Official wiki: https://wiki.hypr.land/Configuring/

Key reference pages:
- Variables: https://wiki.hypr.land/Configuring/Variables/
- Keybinds: https://wiki.hypr.land/Configuring/Binds/
- Window Rules: https://wiki.hypr.land/Configuring/Window-Rules/
- Animations: https://wiki.hypr.land/Configuring/Animations/
