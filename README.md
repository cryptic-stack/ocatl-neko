# OCATL

OCATL is a security-focused, self-hosted remote browsing platform built for isolated sessions in Docker containers and streamed over WebRTC.

[![Release](https://img.shields.io/github/v/release/cryptic-stack/ocatl-neko)](https://github.com/cryptic-stack/ocatl-neko/releases)
[![License](https://img.shields.io/github/license/cryptic-stack/ocatl-neko)](https://github.com/cryptic-stack/ocatl-neko/blob/master/LICENSE)
[![Docker Pulls](https://img.shields.io/docker/pulls/cryptic-stack/ocatl-neko)](https://hub.docker.com/r/cryptic-stack/ocatl-neko)
[![Issues](https://img.shields.io/github/issues/cryptic-stack/ocatl-neko)](https://github.com/cryptic-stack/ocatl-neko/issues)
[![Build](https://github.com/cryptic-stack/ocatl-neko/actions/workflows/dockerhub.yml/badge.svg)](https://github.com/cryptic-stack/ocatl-neko/actions/workflows/dockerhub.yml)

## Secure Isolated Browsing

- Run browsers and desktop apps in isolated Linux containers.
- Keep host devices clean by avoiding local browser state persistence.
- Centralize patching and hardening in container images.
- Stream only remote desktop output over WebRTC.
- Support persistent or disposable profiles based on your risk model.

## Primary Use Cases

- Secure remote browsing for untrusted sites and downloads.
- Shared investigation and incident response sessions.
- Controlled demo, training, and support environments.
- Team collaboration in a single synchronized browser session.
- Internal application access through a constrained jump-host pattern.

## Project Scope

OCATL can run full browsers, desktop environments (XFCE/KDE), and Linux applications (for example VLC/remmina) in the same isolation model.

For room orchestration and API-driven room lifecycle management, use [ocatl-neko-rooms](https://github.com/cryptic-stack/ocatl-neko-rooms).

## Upstream Compatibility

OCATL is maintained as a hardened fork of [m1k1o/neko](https://github.com/m1k1o/neko). Upstream docs remain useful for general architecture and runtime configuration.

### Supported browsers

<div align="center">
  <a href="https://neko.m1k1o.net/docs/v3/installation/docker-images#firefox">
    <img src="https://neko.m1k1o.net/img/icons/firefox.svg" title="docker.io/cryptic-stack/ocatl-neko:firefox" width="60" height="auto"/>
  </a>
  <a href="https://neko.m1k1o.net/docs/v3/installation/docker-images#tor-browser">
    <img src="https://neko.m1k1o.net/img/icons/tor-browser.svg" title="docker.io/cryptic-stack/ocatl-neko:tor-browser" width="60" height="auto"/>
  </a>
  <a href="https://neko.m1k1o.net/docs/v3/installation/docker-images#waterfox">
    <img src="https://neko.m1k1o.net/img/icons/waterfox.svg" title="docker.io/cryptic-stack/ocatl-neko:waterfox" width="60" height="auto"/>
  </a>
  <a href="https://neko.m1k1o.net/docs/v3/installation/docker-images#chromium">
    <img src="https://neko.m1k1o.net/img/icons/chromium.svg" title="docker.io/cryptic-stack/ocatl-neko:chromium" width="60" height="auto"/>
  </a>
  <a href="https://neko.m1k1o.net/docs/v3/installation/docker-images#google-chrome">
    <img src="https://neko.m1k1o.net/img/icons/google-chrome.svg" title="docker.io/cryptic-stack/ocatl-neko:google-chrome" width="60" height="auto"/>
  </a>
  <a href="https://neko.m1k1o.net/docs/v3/installation/docker-images#ungoogled-chromium">
    <img src="https://neko.m1k1o.net/img/icons/ungoogled-chromium.svg" title="docker.io/cryptic-stack/ocatl-neko:ungoogled-chromium" width="60" height="auto"/>
  </a>
  <a href="https://neko.m1k1o.net/docs/v3/installation/docker-images#microsoft-edge">
    <img src="https://neko.m1k1o.net/img/icons/microsoft-edge.svg" title="docker.io/cryptic-stack/ocatl-neko:microsoft-edge" width="60" height="auto"/>
  </a>
  <a href="https://neko.m1k1o.net/docs/v3/installation/docker-images#brave">
    <img src="https://neko.m1k1o.net/img/icons/brave.svg" title="docker.io/cryptic-stack/ocatl-neko:brave" width="60" height="auto"/>
  </a>
  <a href="https://neko.m1k1o.net/docs/v3/installation/docker-images#vivaldi">
    <img src="https://neko.m1k1o.net/img/icons/vivaldi.svg" title="docker.io/cryptic-stack/ocatl-neko:vivaldi" width="60" height="auto"/>
  </a>
  <a href="https://neko.m1k1o.net/docs/v3/installation/docker-images#opera">
    <img src="https://neko.m1k1o.net/img/icons/opera.svg" title="docker.io/cryptic-stack/ocatl-neko:opera" width="60" height="auto"/>
  </a>

  ... see [all available images](https://neko.m1k1o.net/docs/v3/installation/docker-images)
</div>

### Other applications

<div align="center">
  <a href="https://neko.m1k1o.net/docs/v3/installation/docker-images#xfce">
    <img src="https://neko.m1k1o.net/img/icons/xfce.svg" title="docker.io/cryptic-stack/ocatl-neko:xfce" width="60" height="auto"/>
  </a>
  <a href="https://neko.m1k1o.net/docs/v3/installation/docker-images#kde">
    <img src="https://neko.m1k1o.net/img/icons/kde.svg" title="docker.io/cryptic-stack/ocatl-neko:kde" width="60" height="auto"/>
  </a>
  <a href="https://neko.m1k1o.net/docs/v3/installation/docker-images#remmina">
    <img src="https://neko.m1k1o.net/img/icons/remmina.svg" title="docker.io/cryptic-stack/ocatl-neko:remmina" width="60" height="auto"/>
  </a>
  <a href="https://neko.m1k1o.net/docs/v3/installation/docker-images#vlc">
    <img src="https://neko.m1k1o.net/img/icons/vlc.svg" title="docker.io/cryptic-stack/ocatl-neko:vlc" width="60" height="auto"/>
  </a>

  ... others in <a href="https://github.com/m1k1o/neko-apps">m1k1o/neko-apps</a>
</div>

### Why OCATL?

OCATL provides a security-first packaging and operations model for isolated remote browsing, while staying broadly compatible with the upstream ecosystem.

## Multiple rooms

For room management software, visit [ocatl-neko-rooms](https://github.com/cryptic-stack/ocatl-neko-rooms).

It also offers [Zero-knowledge installation (with HTTPS)](https://github.com/cryptic-stack/ocatl-neko-rooms/?tab=readme-ov-file#zero-knowledge-installation-with-https).

## Documentation

Upstream documentation is available at [neko.m1k1o.net](https://neko.m1k1o.net/). Key sections include:

- [Migration from V2](https://neko.m1k1o.net/docs/v3/migration-from-v2)
- [Getting Started](https://neko.m1k1o.net/docs/v3/quick-start)
- [Installation](https://neko.m1k1o.net/docs/v3/installation)
- [Examples](https://neko.m1k1o.net/docs/v3/installation/examples)
- [Configuration](https://neko.m1k1o.net/docs/v3/configuration)
- [Frequently Asked Questions](https://neko.m1k1o.net/docs/v3/faq)
- [Troubleshooting](https://neko.m1k1o.net/docs/v3/troubleshooting)

## How to Contribute

Contributions are welcome! Check the [Contributing Guide](https://neko.m1k1o.net/contributing) for details.




