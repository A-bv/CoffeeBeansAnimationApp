# README preview generator

The GIFs in `docs/previews/` are **canvas re-creations** of the SwiftUI demos,
not simulator recordings. `render.html` follows each view's source (sizes,
colors, durations, easing curves, and the real image assets), so the previews
stay close to what the app shows. Fonts and SF Symbols are approximated.

Regenerate (needs Node + Playwright with Chromium, Python + Pillow):

```sh
cd docs/previews/tools
node capture.js coffee-shop floating-beans coffee-art rising-steam doughnut-card
FPS=20 node capture.js reveal-cup
python3 togif.py coffee-shop floating-beans coffee-art rising-steam doughnut-card
FPS=20 python3 togif.py reveal-cup
```

Set `CHROMIUM=/path/to/chrome` to use a specific browser binary.
