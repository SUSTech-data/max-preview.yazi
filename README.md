# max-preview.yazi

Maximize or restore the preview pane.

https://github.com/yazi-rs/plugins/assets/17523360/8976308e-ebfe-4e9e-babe-153eb1f87d61

## Installation

```sh
ya pack -a SUSTech-data/max-preview.yazi
```

## Usage

Add this to your `~/.config/yazi/keymap.toml`:

```toml
[[mgr.prepend_keymap]]
on = ["i"]
run = "plugin max-preview -- preview"
desc = "Toggle max preview"

[[mgr.prepend_keymap]]
on = ["j"]
run = "plugin max-preview -- j"
desc = "Next file (max preview)"

[[mgr.prepend_keymap]]
on = ["k"]
run = "plugin max-preview -- k"
desc = "Previous file (max preview)"
```
