---
layout: default
---

## Kernel Config For Asus Nitro 7

Here is my config for Asus Nitro 7, all hardware working including touchpad and all sensors.


### Instructions

- Download the config file: [config.gz](./config.gz)
- Unzip it: `zcat config.gz > ~/nitro-config`
- Run genkernel: `genkernel --kernel-config=~/nitro-config --makeopts=-j12 all`

Thats it, now reboot and enjoy :bike:

[back](./)
