# Migration Compatibility Plan (`neko`)

Date: 2026-02-15

## Compatibility policy

1. Keep runtime/system contract names stable until a major cutover.
2. Apply branding renames first to comments, UI strings, profile display names, and internal-only filenames.
3. Only rename hard contracts (`/etc/neko`, `NEKO_*`, `net.m1k1o.neko.api-version`) with explicit migration shims.

## Required shims before hard renames

| Contract | Proposed future name | Compatibility shim needed |
|---|---|---|
| `/etc/neko` | `/etc/octal` | Keep `/etc/neko` as symlink to `/etc/octal` for at least one major cycle. |
| `/var/log/neko` | `/var/log/octal` | Keep `/var/log/neko` symlinked and keep log collectors dual-configured. |
| `NEKO_*` envs | `OCTAL_*` | Dual-read env vars (prefer `OCTAL_*`, fallback `NEKO_*`). |
| `net.m1k1o.neko.api-version` | `net.octal.neko.api-version` (or equivalent) | Emit both labels until `neko-rooms` consumes the new one. |
| `m1k1o/neko` ldflags path | module-native path | Update build scripts and Go module path in one coordinated change. |

## Current safe rename scope

- `apps/*` branding strings (`neko` display names/comments).
- `m1k1o` references in helper scripts where no external contract depends on the URL/name.
- Internal file names only when all references are updated in the same commit.

## Validation checklist

- Build base image and one app image from each class (browser, desktop, media).
- Verify runtime startup (`supervisord`, X server, `neko serve`).
- Verify `neko-rooms` still detects API version from image labels.

