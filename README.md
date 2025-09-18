# My Custom Desktop Immutable Image &nbsp; ![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/benoitlx/custom-desktop-image/build.yml)

> [!warning]
> Only use this image if you're curious and not afraid of breaking changes

This repo is part of a hobby project where I'm learning about bootable OCI images and CI/CD. My ultimate goal is to end up with the ideal base image for my laptop and maybe other devices.

Altough I'm currently daily driving the `niri-nvidia` image, and it's fully operational for my needs, I do not guarantee anything. I'd be happy you get in touch with me if you are using this image.

## Image details

While multiple images are [available](https://github.com/benoitlx?tab=packages&repo_name=custom-desktop-image) through the Github Container Registry, those I'm currently maintaining are `niri-nvidia` and `niri`.

These images are built using [Bluebuild template](https://github.com/blue-build/template) on top of Ublue OS's [base-main](https://github.com/ublue-os/main/pkgs/container/base-main) image.

## Highlights

- Based on the [niri](https://github.com/YaLTeR/niri) wayland compositor
- Automatic download of my [dotfiles](https://github.com/benoitlx/dotfiles)
- Shipped with [tailscale](https://tailscale.com/)
- Important softwares :
  - `kitty`
  - `helix`
  - `rofi`
  - `ironbar`
  - `starship`

## Installation

> [!warning]
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/benoitlx/niri:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/benoitlx/niri:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/blue-build/template
```
