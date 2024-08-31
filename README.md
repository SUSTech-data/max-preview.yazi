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
{ on = [ "i" ], run = "plugin --sync max-preview --args='preview'" },
{ on = [ "j" ], run = "plugin --sync max-preview --args='j'" },
{ on = [ "k" ], run = "plugin --sync max-preview --args='k'" },
```
