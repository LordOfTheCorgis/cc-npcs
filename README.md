# cc-npcs

> FiveM resource to control NPC presence and remove default police/EMS/military NPCs and vehicles.

## Summary

`cc-npcs` is a small client-side FiveM resource that:
- Optionally removes default police/EMS/military NPCs and associated vehicles.
- Allows global NPC density control via `Config.npcDensity`.

This project is authored by `LordOfTheCorgis` (see `fxmanifest.lua`).

## Requirements

- FiveM server (GTA V)

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

Example:

```lua
Config = {}
Config.npcDensity = 0.0    -- disables generic NPCs
Config.policeNPCs = true   -- removes police/EMS/military NPCs & vehicles
```

## Behavior details

- `client.lua` keeps a running thread that, when `Config.policeNPCs` is `true`, iterates game pools and deletes entities matching configured police/military ped and vehicle models.
- A separate thread applies density multipliers every frame using `Config.npcDensity`.

## Files

- `client.lua` — main client logic (entity deletion + density control)
- `config.lua` — configuration values
- `fxmanifest.lua` — FiveM manifest and metadata

## Troubleshooting

- If no effect is observed, ensure the resource is started (`ensure cc-npcs`) and `fx_version 'cerulean'` is supported by your server build.
- Check server/client console for script errors.

## License

No license is specified in this repository. Check with the original author before redistributing or modifying for public use.

## Credits

Author: LordOfTheCorgis (refer to `fxmanifest.lua`)
