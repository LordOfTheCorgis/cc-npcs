# cc-npcs

> FiveM resource to control NPC presence and remove default police/EMS/military NPCs and vehicles.

## Summary

`cc-npcs` is a small client-side FiveM resource that:
- Optionally removes default police/EMS/military NPCs and associated vehicles.
- Allows global NPC density control via `Config.npcDensity`.

## Installation

1. Place the `cc-npcs` folder into your server `resources` directory.
2. Add the following line to your `server.cfg` (or equivalent):

```
ensure cc-npcs
```
3. Restart your server or start the resource.

## Configuration

Edit `config.lua` to change behavior:

- `Config.npcDensity` (number) — NPC density multiplier (default `1.0`). Set to `0` for no NPCs.
- `Config.policeNPCs` (boolean) — When `true` the script will delete matching police/EMS/military NPCs and vehicles. Default is `false`.
