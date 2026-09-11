# yugen-ash.opencode

Yugen-ash theme for [opencode](https://opencode.ai), ported from the
[yugen-ash.nvim](https://github.com/qFioofa/yugen-ash.nvim) NeoVim colorscheme.

## Features

- Semantic mapping of the yugen-ash palette to opencode's theme keys
- Near-black background (`#000000`) with the signature warm `#FFBE89` primary
- Roles are reused across UI, markdown and syntax (tide for secondary/info,
  violet for accent/numbers, crimson for keywords, sage for strings)

## Usage

**Install (manual):**

1. Copy `src/yugen-ash.json` to `~/.config/opencode/themes/yugen-ash.json`
   (Linux/macOS) or `%APPDATA%\opencode\themes\yugen-ash.json` (Windows).
2. Add to your opencode config (`tui.json`):

```jsonc
{
  "theme": "yugen-ash"
}
```

3. Restart opencode.

**Install (script):**

```sh
./scripts/deploy.sh        # macOS / Linux
scripts\deploy.bat         # Windows
```

The deploy script copies the theme to the correct location and prints the config
line you need.

## Color reference

Semantic role mapping follows yugen-ash.nvim: a role gets the same color on every
UI aspect where it appears, and syntax/markdown groups reuse those roles.

| opencode key         | role      | hex       | yugen-ash role                    |
| -------------------- | --------- | --------- | --------------------------------- |
| `primary`            | accent    | `#FFBE89` | primary (functions, headings)     |
| `secondary`          | accent    | `#79a0aa` | tide (control flow)               |
| `accent`             | accent    | `#c678dd` | violet (numbers, imports)         |
| `text`               | text      | `#FAFAFA` | color100                          |
| `textMuted`          | text      | `#696969` | color400 (comments)               |
| `background`         | bg        | `#000000` | color800                          |
| `backgroundPanel`    | bg        | `#151515` | color700                          |
| `backgroundElement`  | bg        | `#303030` | color600                          |
| `borderSubtle`       | border    | `#303030` | color600                          |
| `border`             | border    | `#505050` | color500                          |
| `borderActive`       | border    | `#FFBE89` | primary (focus = accent)          |
| `error`              | status    | `#F57A7A` | error                             |
| `warning`            | status    | `#FFF2AF` | warning                           |
| `success`            | status    | `#7EAB8E` | success                           |
| `info`               | status    | `#79a0aa` | tide                              |
| `diffAdded`          | diff      | `#7EAB8E` | success                           |
| `diffRemoved`        | diff      | `#F57A7A` | error                             |
| `diffHunkHeader`     | diff      | `#c678dd` | violet                            |
| `markdownHeading`    | markdown  | `#FFBE89` | primary (headings)                |
| `markdownStrong`     | markdown  | `#FFBE89` | primary                           |
| `markdownLink`       | markdown  | `#79a0aa` | tide                              |
| `markdownCode`       | markdown  | `#D4A017` | gold (types)                      |
| `markdownImage`      | markdown  | `#FF9E8B` | coral                             |
| `syntaxKeyword`      | syntax    | `#bf616a` | crimson (keywords)                |
| `syntaxFunction`     | syntax    | `#FFBE89` | primary (functions)               |
| `syntaxString`       | syntax    | `#9db89c` | sage (strings)                    |
| `syntaxNumber`       | syntax    | `#c678dd` | violet (numbers)                  |
| `syntaxType`         | syntax    | `#D4A017` | gold (types)                      |
| `syntaxOperator`     | syntax    | `#96a8ad` | frost (operators)                 |
| `syntaxVariable`     | syntax    | `#D4D4D4` | color200 (identifiers)            |
| `syntaxPunctuation`  | syntax    | `#696969` | color400 (delimiters)             |

For the full per-language port of the nvim highlight groups (legacy + Treesitter
captures) correlated to opencode zones by semantic role and color, see
[docs/language-groups.md](./docs/language-groups.md).

## Structure

```
src/yugen-ash.json           theme definition
docs/language-groups.md      highlight groups from yugen-ash.nvim → opencode zones
scripts/deploy.sh            deploy script (macOS / Linux)
scripts/deploy.bat           deploy script (Windows)
```

## License

[MIT](./LICENSE)