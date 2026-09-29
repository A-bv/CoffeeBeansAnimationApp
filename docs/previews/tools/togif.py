import sys, glob, os, tempfile
from PIL import Image

fps = int(os.environ.get("FPS", 15))
colors = int(os.environ.get("COLORS", 128))
here = os.path.dirname(os.path.abspath(__file__))
frames_dir = os.environ.get("FRAMES_DIR", os.path.join(tempfile.gettempdir(), "coffee-preview-frames"))
for name in sys.argv[1:]:
    frames = [Image.open(f).convert("RGB") for f in sorted(glob.glob(f"{frames_dir}/{name}/*.png"))]
    # One shared palette per GIF (built from a strip of sampled frames) avoids
    # frame-to-frame palette flicker in the gradients.
    step = max(1, len(frames) // 12)
    sample = frames[::step]
    w, h = sample[0].size
    strip = Image.new("RGB", (w, h * len(sample)))
    for i, f in enumerate(sample):
        strip.paste(f, (0, i * h))
    pal = strip.quantize(colors=colors, method=Image.Quantize.MEDIANCUT)
    q = [f.quantize(palette=pal, dither=Image.Dither[os.environ.get("DITHER","NONE")]) for f in frames]
    out = os.path.join(here, "..", f"{name}.gif")
    q[0].save(out, save_all=True, append_images=q[1:], duration=round(1000 / fps), loop=0, optimize=True)
    print(name, len(frames), f"{os.path.getsize(out)/1024:.0f} KB")
