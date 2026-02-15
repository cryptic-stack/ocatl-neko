# Migration Breaking Log (`neko`)

Date: 2026-02-15  
Backup branch: `backup/pre-neko-rename-20260215`  
Backup tag: `pre-neko-rename-neko-20260215`  
Bundle backup: `C:\Users\JBrown\Documents\OCATL\backups\neko-pre-rename-20260215.bundle`

## High-risk contracts (do not rename without compatibility layer)

| Area | Current key/path | Why breaking |
|---|---|---|
| Docker image label | `net.m1k1o.neko.api-version` | Consumed by `neko-rooms` image API detection logic. |
| Runtime config path | `/etc/neko/*` | Referenced across runtime Dockerfiles, supervisord configs, and dev tooling. |
| Runtime log path | `/var/log/neko/*` | Referenced by supervisord and tooling scripts. |
| Env variable namespace | `NEKO_*` | Existing deployments and docs rely on these names. |
| Container image names | `octal-neko:*` | Published tags used by external deployments and `neko-rooms`. |
| Go linker package path | `m1k1o/neko` in `server/build` ldflags | Build metadata injection target; rename requires build script and module updates together. |

## Medium-risk items

| Area | Current value | Why risky |
|---|---|---|
| Xorg driver component | `xf86-input-neko` | Internal component name in build toolchain (`utils/xorg-deps`). |
| Legacy migration links | `https://neko.m1k1o.net/*` | Docs and runtime warnings reference these links. |
| Cookie/session identifiers | `NEKO_SESSION*` | Cross-app/session compatibility impact if changed. |

## Already changed in this phase

- User/group naming migrated in image/runtime files: `neko:neko` -> `octal:octal`.
- Home paths in code/runtime files migrated where appropriate: `/home/neko/*` -> `/home/octal/*` (docs excluded by default).
- App-level branding cleanup in progress (`apps/*`) for non-contract strings.

## Revert commands

```powershell
git reset --hard pre-neko-rename-neko-20260215
```

Or restore from bundle:

```powershell
git clone C:\Users\JBrown\Documents\OCATL\backups\neko-pre-rename-20260215.bundle neko-restore
```

