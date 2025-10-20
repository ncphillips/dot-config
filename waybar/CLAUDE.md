# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Waybar configuration repository for a Hyprland window manager setup. Waybar is a highly customizable status bar for Wayland compositors.

## File Structure

- `config.jsonc` - Main Waybar configuration file defining modules and their settings
- `style.css` - Primary stylesheet that imports system defaults and custom styles
- `styles/workspaces.css` - Modular stylesheet specifically for workspace styling

## Configuration Architecture

### Module Organization

The Waybar configuration uses a three-section layout:
- **modules-left**: Currently empty
- **modules-center**: Hyprland workspaces display
- **modules-right**: Network, battery, and clock modules (date + time)

### Styling Architecture

The styling system uses a layered approach:
1. System defaults imported from `/etc/xdg/waybar/style.css`
2. Custom modular styles imported from `./styles/` directory
3. Main `style.css` applies global overrides

This modular approach allows workspace-specific styles to be maintained separately while keeping the main stylesheet focused on global appearance.

### Key Configuration Patterns

- **Fonts**: Uses "JetBrains Mono" with Font Awesome fallbacks throughout
- **Multiple clock modules**: Separate `clock#date` and `clock#time` modules allow independent formatting and positioning
- **Network interface**: Hardcoded to `wlan0` - may need adjustment for different systems
- **Transparency**: Window background uses `rgba(129, 150, 227, 0.5)` for a semi-transparent effect

## Testing Configuration Changes

After making changes, reload Waybar:
```bash
killall waybar && waybar &
```

Or if using systemd:
```bash
systemctl --user restart waybar
```

## Common Modifications

When adding new modules:
1. Add module to appropriate section in `config.jsonc` (modules-left/center/right)
2. Configure module settings in the same file
3. Add corresponding CSS styling in `style.css` or create a new file in `styles/`
4. Import any new stylesheets in `style.css` using `@import`

When creating new modular stylesheets, follow the pattern in `styles/workspaces.css` and import them in `style.css`.
