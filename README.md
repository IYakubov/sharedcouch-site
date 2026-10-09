# sharedcouch-site

The front door of **sharedcouch.online**.

- `public/index.html` — the catalog website (Home, Games, How it works, About, Support).
- `Caddyfile` — routes each game path to its own Railway service over the private network:

| Path | Railway service |
|---|---|
| `/tankwar/` | tank_battle |
| `/mathduel/` | math_duel |
| `/countingclash/` | cubez |
| `/navalduel/` | shipyy |
| `/rockdrift/` | meteofight |

Each game is reached at `<private-name>.railway.internal:8080`. The upstream for a game can be overridden with a variable such as `MATHDUEL_UPSTREAM=host:port`.

## Adding a game
1. Add it as a service in the Shared Couch Railway project and set its `PORT` variable to `8080`.
2. Add one line to the `Caddyfile`: `import game <path> {$<NAME>_UPSTREAM:<private-name>.railway.internal:8080}`.
3. Add its card to `public/index.html`.
