const { chromium } = require('playwright');
const http = require('http'), fs = require('fs'), path = require('path');
const root = path.resolve(__dirname, '../../..');
const framesDir = process.env.FRAMES_DIR || path.join(require('os').tmpdir(), 'coffee-preview-frames');
const FPS = +process.env.FPS || 15;
const names = process.argv.slice(2);

const server = http.createServer((req, res) => {
  const f = path.join(root, decodeURIComponent(req.url.split('?')[0]));
  fs.readFile(f, (e, d) => { if (e) { res.writeHead(404); return res.end(); } res.end(d); });
}).listen(0, async () => {
  const browser = await chromium.launch(process.env.CHROMIUM ? { executablePath: process.env.CHROMIUM } : {});
  const page = await browser.newPage();
  await page.goto(`http://127.0.0.1:${server.address().port}/docs/previews/tools/render.html`);
  await page.waitForFunction(() => [...document.images].every(i => i.complete && i.naturalWidth));
  for (const name of names) {
    const { L } = await page.evaluate(n => meta(n), name);
    const outDir = path.join(framesDir, name);
    fs.rmSync(outDir, { recursive: true, force: true }); fs.mkdirSync(outDir, { recursive: true });
    const n = Math.round(L * FPS);
    for (let i = 0; i < n; i++) {
      const url = await page.evaluate(([nm, t]) => frame(nm, t), [name, i / FPS]);
      fs.writeFileSync(path.join(outDir, String(i).padStart(4, '0') + '.png'), Buffer.from(url.split(',')[1], 'base64'));
    }
    console.log(name, n, 'frames');
  }
  await browser.close(); server.close();
});
