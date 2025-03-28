## Popviewer

Popviewer allows you to quickly save current buffer in a popup window, which you can then toggle from any other window.

### Install

Use your favorite plugin manager and call `setup()`

### Configuration

Default config 

```lua
{
    -- Width of the popup window
    width = 80
    -- Height of the popup window
    height = 80
    -- Row at which the popup window spawns
    row = 5
    -- Column at which the popup window spawns
    col = 100
    -- Set to true to register default keymaps
    default_keymaps = true
}
```

### Default keymaps 

| Keymap | Action | Description |
|--------| -------| ----------- |
| \<Leader\>p | `require('popviewer').toggle_window()` | Open/Close popup window
| \<Leader\>x | `require('popviewer').clear_window()` | Reset popup window, useful when you want to focus another buffer
