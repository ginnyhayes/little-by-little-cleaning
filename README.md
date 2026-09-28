# Little by Little — your household cleaning app

A free, personal app built with plain HTML, CSS, and JavaScript. No account, subscription, API, database, or build step. All 265 supplied tasks are included: 21 daily, 6 weekly, and 238 zone tasks.

## A. Open it on your computer

1. Open this CleaningApp folder.
2. Double-click **Start-App.cmd**. Keep its terminal window open while using the app. If Windows asks which app should open the command file, use Windows Command Processor.
3. Your browser opens at **http://localhost:4173**. If it opens before the server is ready, refresh once.
4. Check a task, refresh, and see it remain checked. Explore the five bottom tabs.
5. Close the terminal window when finished. Your saved checklists remain in your browser.

Node is already available in this Codex environment. If double-clicking reports that Node cannot be found, ask Codex to start the app for you; do not install anything just to use today's preview. Alternatively, run `node server.cjs` in this folder from Codex's terminal.

Use the same browser and address each time. This local preview is for your computer. Your iPhone's localhost address refers to the phone, not this computer. Do not open index.html directly: offline installation needs localhost or HTTPS.

## How the app behaves

- Daily routine checks clear when your device's local date changes.
- Blessing checks clear on Monday. Do them any day you like.
- September 28, 2026 is the default Zone 1 Monday. Zones repeat every five weeks.
- Zone checks persist for their active week and clear for that zone's next rotation. Returning after several weeks still resets the correct cycle.
- You may browse and check any zone. An upcoming zone starts fresh when its scheduled week arrives.
- Customize lets you set a Monday anchor or select this week's zone. Either change confirms first and starts fresh zone checklists; the selected zone then continues rotating next Monday.
- Progress counts only checked tasks. The timer never affects it.
- The timer uses a saved deadline. Navigation, closing, or backgrounding does not lose elapsed time. Paused time stays paused. Extensions work while running or paused, and start a new countdown after completion. The completion message reflects the actual allotted minutes.
- iPhone may suspend a background app. The timer catches up on return; a sound at the exact deadline while locked or backgrounded is not guaranteed.
- Seasonal colors change automatically: fall September–November, winter December–February, spring/summer March–August. Manual color choices persist.

## Editing and backups

Use **Customize → Edit checklists**. Choose a list, edit names, add tasks, or move tasks using arrows. For zones, expand a room to edit its tasks. Rooms can also be added, renamed, reordered, or deleted. Deleting a task or room asks first. Reset checklist clears checkmarks but keeps your task names.

Use **Customize → Export Backup** periodically. Store the JSON file somewhere safe. Import Backup replaces the current app data after confirmation. Reset App Data requires typing RESET.

Data stays in this browser on this device, with no automatic device sync. Clearing browser/site data or removing the app can lose it. Export before moving to a hosted version or another device, then import there. Browser storage restrictions produce a visible message rather than silently claiming to save. Avoid private browsing for everyday use.

## B. Make changes with Codex

1. Open this CleaningApp project in Codex.
2. Describe the change in ordinary words, such as “Make the cards more compact” or “Add a notes field to each room.”
3. Ask Codex to implement and test it. You do not need to write code.

For checklist changes, the app's Customize tab is easiest. Editing defaults.js affects new/reset data, not already customized lists. When changing app files, bump the cache version in sw.js. Close all app tabs and reopen after the new worker has installed to receive updated offline files. Your localStorage data is separate from that cache.

## C. Host it free later — nothing has been deployed

One option is GitHub Pages, which serves this app's static files for free from a public repository on GitHub Free.

1. When ready, ask Codex: “Help me publish this app for free with GitHub Pages.”
2. Codex can help create a repository, upload the static app files, and enable Pages after your authorization.
3. Open the provided HTTPS address and import your exported local backup.

Only app source/checklist defaults are published; local progress and backup files should not be uploaded. A public repository exposes the default household checklist wording. You can ask Codex to replace the published defaults with generic names first, then import your personal backup privately on your device.

Official guide: https://docs.github.com/en/pages/getting-started-with-github-pages/what-is-github-pages

## D. Install on your iPhone after hosting

1. Open the HTTPS app address in Safari.
2. Let the page finish loading online once.
3. Tap Share (or the More menu, then Share), then **Add to Home Screen**.
4. Turn on **Open as Web App** if offered, then tap **Add**.
5. Open the new Home Screen icon. Import your backup there if needed.
6. Try airplane mode and reopen the app to verify offline use on your phone.

Official Apple instructions: https://support.apple.com/guide/iphone/open-as-web-app-iphea86e5236/ios

## Files and testing

- index.html / styles.css: page shell and three seasonal palettes
- app.js: screens, editing, browser storage, backup, interactions
- core.js: testable local calendar, zone rotation, timer, backup validation
- defaults.js: all original checklists with stable IDs
- manifest.webmanifest / sw.js / icons/: installation and offline assets
- server.cjs / Start-App.cmd: local preview only; no production backend
- tests/core.test.mjs: run with `node tests/core.test.mjs`
- tests/browser.test.cjs: automated browser tests using this environment's bundled Playwright and Edge (development only)

Tested: all default task counts, 15 rotation weeks, dates before the anchor, daily and Monday resets, per-zone reset, missed cycles, local dates around daylight-saving boundaries, timer controls/extensions/completion, backup round trip, malformed backups, untimed checks, persisted tasks, mobile-width layout, seasonal selection, task editing, and offline reload. The browser test uses isolated storage so test changes do not affect your own lists. Real iPhone Safari installation and background audio still need a physical-device check.

