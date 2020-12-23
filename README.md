# pass-notify

`pass-notify` is an extension to [`pass`][pass] which adds the `show-notify` command.
This command behaves exactly like `pass show`,
except instead of printing output to the console it sends it to `notify-send`
to be shown as a notification.
This extension also comes with `passmenu-notify`
which is a replacement for the standard `passmenu` that adds a `--notify` option.
If the `--notify` option is given, `passmenu-notify` invokes `pass show-notify` instead of `pass show`.


## Usage

Recommended usage is to map `passmenu-notify` to a keyboard shortcut.
For example, in [i3wm][]:

```
bindsym $mod+p exec passmenu-notify --notify
bindsym $mod+Shift+p exec passmenu --type
```


## Dependencies

- [`pass`][pass]: since this is an extension for it.
- [libnotify][]: for `notify-send`.


[i3wm]: https://i3wm.org/docs/userguide.html
[libnotify]: https://developer.gnome.org/libnotify/
[pass]: https://www.passwordstore.org/
