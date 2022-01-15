# Firefox Deflector

This utility will allow you to open external links using any currently running firefox instance. By default firefox will open links by using the default profile, even if a window using a different profile is running.

Tested on Pop!\_OS 20.04 LTS.

**This is a Linux only utility.**

## Installation

### Terminal One Liner for download and installation.

```bash
wget -qO- "https://github.com/murar8/firefox-deflector/archive/main.tar.gz" | tar xvz --transform 's/firefox-deflector-main/.firefox-deflector/' -C $HOME -- && $HOME/.firefox-deflector/install.sh
```

### Setting Firefox Deflector as your default browser

#### Gnome

From the Terminal

```bash
xdg-settings set default-web-browser firefox-deflector.desktop
```

From the UI

`Settings` -> `Default Apps` -> `Web` -> `Firefox Deflector`

## Uninstallation

**Make sure to copy this command exactly or your could permanently damage your system.**

```bash
rm -rf $HOME/.local/bin/firefox-deflector $HOME/.local/share/applications/firefox-deflector.desktop $HOME/.firefox-deflector
```

## License

Copyright (c) 2022 Lorenzo Murarotto <lnzmrr@gmail.com>

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
