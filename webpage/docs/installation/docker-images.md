---
description: List of available Neko Docker images and their flavors.
---

import { AppIcon } from '@site/src/components/AppIcon';

# Docker Images

Neko as a standalone streaming server is available as a Docker image. But that is rarely interesting for general use. The real power of Neko is in its ability to accommodate custom applications in the virtual desktop environment. This is where the various flavors of Neko Docker images come in.

The base image is available as multi-arch image at [`ghcr.io/cryptic-stack/octal-neko/base`](https://ghcr.io/cryptic-stack/octal-neko/base). See [Supported Architectures](#arch) for more information.

## Naming Convention {#naming}

Neko images are available on two public registries. The [GitHub Container Registry (GHCR)](#ghcr.io) hosts stable releases with all flavors and architectures. The latest development version of the Neko image for the AMD64 architecture is available on [Docker Hub](#docker.io).

:::info
You should always prefer the GHCR registry, as it supports flavors and specific versions, unless you want to test the latest development version.
:::

### GitHub Container Registry (GHCR) {#ghcr.io}

Neko Docker images are available on the [GitHub Container Registry (GHCR)](https://github.com/m1k1o?tab=packages&repo_name=neko). The naming convention for Neko Docker images is as follows:

```
ghcr.io/cryptic-stack/octal-neko/[<flavor>-]<application>:<version>
```

- `<flavor>` is the optional flavor of the image. See [Available Flavors](#flavors) for more information.
- `<application>` is the application name or base image. See [Available Applications](#apps) for more information.
- `<version>` is the version of the image. See [Versioning](#ghcr.io-versioning) for more information.

#### Versioning scheme {#ghcr.io-versioning}

The versioning scheme follows the [Semantic Versioning 2.0.0](https://semver.org/) specification. The following tags are available for each image:

- `latest` - Points to the most recent stable release.
- `MAJOR` - Tracks the latest release within the specified major version.
- `MAJOR.MINOR` - Tracks the latest release within the specified major and minor version.
- `MAJOR.MINOR.PATCH` - Refers to a specific release.

For example:
- `ghcr.io/cryptic-stack/octal-neko/firefox:latest` - Latest stable version.
- `ghcr.io/cryptic-stack/octal-neko/firefox:3` - Latest release in the 3.x.x series.
- `ghcr.io/cryptic-stack/octal-neko/firefox:3.0` - Latest release in the 3.0.x series.
- `ghcr.io/cryptic-stack/octal-neko/firefox:3.0.0` - Specific version 3.0.0.

A full list of published versions can be found in the [GitHub tags](https://github.com/cryptic-stack/octal-neko/tags).

### Docker Hub {#docker.io}

An alternative registry is available on [Docker Hub](https://https://hub.docker.com/r/crypticstack/octal-neko). This registry hosts images built from the latest code in the [master branch](https://github.com/cryptic-stack/octal-neko/tree/master). However, it only includes images without flavors and supports the AMD64 architecture. The naming convention for these images is as follows:

```
crypticstack/octal-neko:<application>
```

- `<application>` is the application name or base image. See [Available Applications](#apps) for more information.

:::info
`crypticstack/octal-neko:latest` is an alias for `crypticstack/octal-neko:firefox` due to historical reasons. It is recommended to use the `ghcr.io/cryptic-stack/octal-neko/firefox:latest` image instead.
:::

## Available Applications {#apps}

The following applications are available as Neko Docker images:

### Firefox-based browsers {#firefox-based-browsers}

In comparison to Chromium-based browsers, Firefox-based browsers do not require additional capabilities or a bigger shared memory size to not crash.

| Icon | Name | Docker Image |
| ---- | ---- | ------------ |
| <AppIcon id="firefox" /> | [Firefox](https://www.mozilla.org/firefox/) <br /> The open-source browser from Mozilla. | [`ghcr.io/cryptic-stack/octal-neko/firefox`](https://ghcr.io/cryptic-stack/octal-neko/firefox) |
| <AppIcon id="tor-browser" /> | [Tor Browser](https://www.torproject.org/) <br /> A browser designed to access the Tor network for enhanced privacy. | [`ghcr.io/cryptic-stack/octal-neko/tor-browser`](https://ghcr.io/cryptic-stack/octal-neko/tor-browser) |
| <AppIcon id="waterfox" /> | [Waterfox](https://www.waterfox.net/) <br /> A privacy-focused browser based on Firefox. | [`ghcr.io/cryptic-stack/octal-neko/waterfox`](https://ghcr.io/cryptic-stack/octal-neko/waterfox) |

:::warning
**Waterfox** is currently not built automatically, because Cloudflare blocks the download and therefore github actions are failing. You can build it manually to get the latest version.
:::

Check the [Firefox-based browsers customization guide](/docs/v3/customization/browsers#firefox-based) for more information on how to customize Firefox-based browsers (configuring profile, installing extensions, etc.).

### Chromium-based browsers {#chromium-based-browsers}

There are multiple flavors of Chromium-based browsers available as Neko Docker images.

They need `--cap-add=SYS_ADMIN` (see [security implications](https://www.redhat.com/en/blog/container-tidbits-adding-capabilities-container) for more information) and extended shared memory size (`--shm-size=2g`) to work properly.

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

<Tabs>
  <TabItem value="docker-run" label="Docker run command">

    ```bash
    docker run \
      --cap-add=SYS_ADMIN \
      --shm-size=2g \
      ghcr.io/cryptic-stack/octal-neko/chromium
    ```

  </TabItem>

  <TabItem value="docker-compose" label="Docker Compose configuration">

    ```yaml title="docker-compose.yaml"
    cap_add:
    - SYS_ADMIN
    shm_size: 2g
    ```

  </TabItem>
</Tabs>

| Icon | Name | Docker Image |
| ---- | ---- | ------------ |
| <AppIcon id="chromium" /> | [Chromium](https://www.chromium.org/chromium-projects/) <br /> The open-source project behind Google Chrome. | [`ghcr.io/cryptic-stack/octal-neko/chromium`](https://ghcr.io/cryptic-stack/octal-neko/chromium) |
| <AppIcon id="google-chrome" /> | [Google Chrome](https://www.google.com/chrome/) <br /> The most popular browser in the world. | [`ghcr.io/cryptic-stack/octal-neko/google-chrome`](https://ghcr.io/cryptic-stack/octal-neko/google-chrome) |
| <AppIcon id="ungoogled-chromium" /> | [Ungoogled Chromium](https://ungoogled-software.github.io/) <br /> A fork of Chromium without Google integration. | [`ghcr.io/cryptic-stack/octal-neko/ungoogled-chromium`](https://ghcr.io/cryptic-stack/octal-neko/ungoogled-chromium) |
| <AppIcon id="microsoft-edge" /> | [Microsoft Edge](https://www.microsoft.com/edge) <br/> The new Microsoft Edge is based on Chromium. | [`ghcr.io/cryptic-stack/octal-neko/microsoft-edge`](https://ghcr.io/cryptic-stack/octal-neko/microsoft-edge) |
| <AppIcon id="brave" /> | [Brave](https://brave.com/) <br /> A privacy-focused browser. | [`ghcr.io/cryptic-stack/octal-neko/brave`](https://ghcr.io/cryptic-stack/octal-neko/brave) |
| <AppIcon id="vivaldi" /> | [Vivaldi](https://vivaldi.com/) <br /> A highly customizable browser. | [`ghcr.io/cryptic-stack/octal-neko/vivaldi`](https://ghcr.io/cryptic-stack/octal-neko/vivaldi) |
| <AppIcon id="opera" /> | [Opera](https://www.opera.com/)* <br /> A fast and secure browser. | [`ghcr.io/cryptic-stack/octal-neko/opera`](https://ghcr.io/cryptic-stack/octal-neko/opera) |

\* requires extra steps to enable DRM, see instructions [here](https://www.reddit.com/r/operabrowser/wiki/opera/linux_widevine_config/). `libffmpeg` is already configured.

Check the [Chromium-based browsers customization guide](/docs/v3/customization/browsers#chromium-based) for more information on how to customize Chromium-based browsers (configuring profile, installing extensions, etc.).

### Desktop Environments {#desktop}

These images feature a full desktop environment where you can install and run multiple applications, use window management, and more. This is useful for people who want to run multiple applications in a single container.

| Icon | Name | Docker Image |
| ---- | ---- | ------------ |
| <AppIcon id="xfce" /> | [Xfce](https://xfce.org/) <br /> A lightweight desktop environment. | [`ghcr.io/cryptic-stack/octal-neko/xfce`](https://ghcr.io/cryptic-stack/octal-neko/xfce) |
| <AppIcon id="kde" /> | [KDE Plasma](https://kde.org/plasma-desktop) <br /> A feature-rich desktop environment. | [`ghcr.io/cryptic-stack/octal-neko/kde`](https://ghcr.io/cryptic-stack/octal-neko/kde) |

### Other Applications {#other}

As it would be impossible to include all possible applications in the repository, a couple of the most popular ones that work well with Neko have been chosen. Custom images can be created by using the base image and installing the desired application.

| Icon | Name | Docker Image |
| ---- | ---- | ------------ |
| <AppIcon id="remmina" /> | [Remmina](https://remmina.org/) <br /> A remote desktop client. | [`ghcr.io/cryptic-stack/octal-neko/remmina`](https://ghcr.io/cryptic-stack/octal-neko/remmina) |
| <AppIcon id="vlc" /> | [VLC](https://www.videolan.org/vlc/) <br /> A media player. | [`ghcr.io/cryptic-stack/octal-neko/vlc`](https://ghcr.io/cryptic-stack/octal-neko/vlc) |

#### Remmina Configuration {#remmina}

To use Remmina with Neko, you can either pass the `REMMINA_URL=<proto>://[<username>[:<password>]@]server[:port]` environment variable (proto being `vnc`, `rdp` or `spice`):

```bash
docker run \
  -e REMMINA_URL=vnc://server:5900 \
  ghcr.io/cryptic-stack/octal-neko/remmina
```

Or bind-mount a custom configuration file to `~/.local/share/remmina/path_to_profile.remmina`. Then pass the `REMMINA_PROFILE=<path_to_profile.remmina>` environment variable:

```ini title="default.remmina"
[remmina]
name=Default
protocol=VNC
server=server.local
port=5900
```

```bash
docker run \
  -v /path/to/default.remmina:/root/.local/share/remmina/default.remmina \
  -e REMMINA_PROFILE=/root/.local/share/remmina/default.remmina \
  ghcr.io/cryptic-stack/octal-neko/remmina
```

#### VLC Configuration {#vlc}

To use VLC with Neko, you can either pass the `VLC_MEDIA=<url>` environment variable:

```bash
docker run \
  -e VLC_MEDIA=http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4 \
  ghcr.io/cryptic-stack/octal-neko/vlc
```

You can also bind-mount your local media files to the container, create a custom playlist, and pass the `VLC_MEDIA=<path_to_playlist>` environment variable:

```bash
docker run \
  -v /path/to/media:/media \
  -e VLC_MEDIA=/media/playlist.xspf \
  ghcr.io/cryptic-stack/octal-neko/vlc
```

:::tip
See [neko-apps](https://github.com/cryptic-stack/octal-neko-apps) repository for more applications.
:::

## Available Flavors {#flavors}

:::danger Keep in Mind
Currently the focus is on CPU images (wihout any flavor). So the GPU support might not work as expected.
:::

The following flavors are available for Neko Docker images:

- `nvidia` - NVIDIA GPU support.
- `intel` - Intel GPU support.

### Intel (VAAPI GPU hardware acceleration) {#intel}

Only for architecture `linux/amd64`.

For images with VAAPI GPU hardware acceleration using Intel drivers use:

- [`ghcr.io/cryptic-stack/octal-neko/intel-firefox`](https://ghcr.io/cryptic-stack/octal-neko/intel-firefox)
- [`ghcr.io/cryptic-stack/octal-neko/intel-waterfox`](https://ghcr.io/cryptic-stack/octal-neko/intel-waterfox)
- [`ghcr.io/cryptic-stack/octal-neko/intel-chromium`](https://ghcr.io/cryptic-stack/octal-neko/intel-chromium)
- [`ghcr.io/cryptic-stack/octal-neko/intel-google-chrome`](https://ghcr.io/cryptic-stack/octal-neko/intel-google-chrome)
- [`ghcr.io/cryptic-stack/octal-neko/intel-ungoogled-chromium`](https://ghcr.io/cryptic-stack/octal-neko/intel-ungoogled-chromium)
- [`ghcr.io/cryptic-stack/octal-neko/intel-microsoft-edge`](https://ghcr.io/cryptic-stack/octal-neko/intel-microsoft-edge)
- [`ghcr.io/cryptic-stack/octal-neko/intel-brave`](https://ghcr.io/cryptic-stack/octal-neko/intel-brave)
- [`ghcr.io/cryptic-stack/octal-neko/intel-vivaldi`](https://ghcr.io/cryptic-stack/octal-neko/intel-vivaldi)
- [`ghcr.io/cryptic-stack/octal-neko/intel-opera`](https://ghcr.io/cryptic-stack/octal-neko/intel-opera)
- [`ghcr.io/cryptic-stack/octal-neko/intel-tor-browser`](https://ghcr.io/cryptic-stack/octal-neko/intel-tor-browser)
- [`ghcr.io/cryptic-stack/octal-neko/intel-remmina`](https://ghcr.io/cryptic-stack/octal-neko/intel-remmina)
- [`ghcr.io/cryptic-stack/octal-neko/intel-vlc`](https://ghcr.io/cryptic-stack/octal-neko/intel-vlc)
- [`ghcr.io/cryptic-stack/octal-neko/intel-xfce`](https://ghcr.io/cryptic-stack/octal-neko/intel-xfce)
- [`ghcr.io/cryptic-stack/octal-neko/intel-kde`](https://ghcr.io/cryptic-stack/octal-neko/intel-kde)

The base image is available at [`ghcr.io/cryptic-stack/octal-neko/intel-base`](https://ghcr.io/cryptic-stack/octal-neko/intel-base).

### Nvidia (CUDA GPU hardware acceleration) {#nvidia}

Only for architecture `linux/amd64`.

For images with Nvidia GPU hardware acceleration using EGL use:

- [`ghcr.io/cryptic-stack/octal-neko/nvidia-firefox`](https://ghcr.io/cryptic-stack/octal-neko/nvidia-firefox)
- [`ghcr.io/cryptic-stack/octal-neko/nvidia-chromium`](https://ghcr.io/cryptic-stack/octal-neko/nvidia-chromium)
- [`ghcr.io/cryptic-stack/octal-neko/nvidia-google-chrome`](https://ghcr.io/cryptic-stack/octal-neko/nvidia-google-chrome)
- [`ghcr.io/cryptic-stack/octal-neko/nvidia-microsoft-edge`](https://ghcr.io/cryptic-stack/octal-neko/nvidia-microsoft-edge)
- [`ghcr.io/cryptic-stack/octal-neko/nvidia-brave`](https://ghcr.io/cryptic-stack/octal-neko/nvidia-brave)

The base image is available at [`ghcr.io/cryptic-stack/octal-neko/nvidia-base`](https://ghcr.io/cryptic-stack/octal-neko/nvidia-base). See [Examples](/docs/v3/installation/examples#nvidia) for more information and usage.

## Supported Architectures {#arch}

Neko Docker images are built with docker buildx and are available for multiple architectures. The following architectures are supported by the base image:

- `linux/amd64` - 64-bit Intel/AMD architecture (most common).
- `linux/arm64` - 64-bit ARM architecture (e.g., Raspberry Pi 4, Apple M1/M2).
- `linux/arm/v7` - 32-bit ARM architecture (e.g., Raspberry Pi 3, Raspberry Pi Zero).

### Availability Matrix {#availability}

The availability of applications for ARM architecture is limited due to the lack of support for some applications. The following table shows the availability of each application for each architecture. The `✅` symbol indicates that the application is available for that architecture, while the `❌` symbol indicates that it is not available.

| Application                               | AMD64 | ARM64 | ARMv7 | Reference |
| ----------------------------------------- | ----- | ----- | ----- | --------- |
| [Firefox](#firefox)                       | ✅    | ✅ \* | ✅ \* | - |
| [Tor Browser](#tor-browser)               | ✅    | ❌    | ❌    | [Forum Post](https://forum.torproject.org/t/tor-browser-for-arm-linux/5240) |
| [Waterfox](#waterfox)                     | ✅    | ❌    | ❌    | [Github Issue](https://github.com/BrowserWorks/Waterfox/issues/1506), [Reddit](https://www.reddit.com/r/waterfox/comments/jpqsds/are_there_any_builds_for_arm64/) |
| [Chromium](#chromium)                     | ✅    | ✅ \* | ✅ \* | - |
| [Google Chrome](#google-chrome)           | ✅    | ❌    | ❌    | [Community Post](https://askubuntu.com/a/1383791) |
| [Ungoogled Chromium](#ungoogled-chromium) | ✅    | ❌    | ❌    | [Downloads Page](https://ungoogled-software.github.io/ungoogled-chromium-binaries/) |
| [Microsoft Edge](#microsoft-edge)         | ✅    | ❌    | ❌    | [Community Post](https://techcommunity.microsoft.com/discussions/edgeinsiderdiscussions/edge-for-linuxarm64/1532272) |
| [Brave](#brave)                           | ✅    | ✅ \* | ❌    | [Requirements Page](https://support.brave.com/hc/en-us/articles/360021357112-What-are-the-system-requirements-to-install-Brave) |
| [Vivaldi](#vivaldi)                       | ✅    | ✅ \* | ✅ \* | - |
| [Opera](#opera)                           | ✅    | ❌    | ❌    | [Forum Post](https://forums.opera.com/topic/52811/opera-do-not-support-arm64-on-linux) |
| [Xfce](#xfce)                             | ✅    | ✅    | ✅    | - |
| [KDE](#kde)                               | ✅    | ✅    | ✅    | - |
| [Remmina](#remmina)                       | ✅    | ✅    | ✅    | - |
| [VLC](#vlc)                               | ✅    | ✅    | ✅    | - |

\* No DRM support.

:::tip
[Oracle Cloud ARM free tier](https://www.oracle.com/cloud/free/) is a great way to test Neko on ARM architecture for free. You can use the `ghcr.io/cryptic-stack/octal-neko/xfce` image to run a full desktop environment with Xfce and test the applications.
:::
