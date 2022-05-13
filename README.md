# Whaler 

<div align="center">
 <div>
  
 </div>
 <img src="data/images/logo/64.svg" alt="Whaler"/>
</div>

![List of Docker containers](data/images/screenshots/screenshot-1.png?raw=true)

## Description

Whaler provides basic functionality for managing Docker containers. The app can start and stop both standalone containers and docker-compose applications. Also, it supports container logs viewing.

The solution is perfect for those who are looking for a simple tool to perform some basic actions. For the app to run correctly, make sure that Docker is installed on your system.

## Installation

[![Get it on AppCenter](https://appcenter.elementary.io/badge.svg)](https://appcenter.elementary.io/com.github.sdv43.whaler)

<a href="https://flathub.org/apps/details/com.github.sdv43.whaler" target="_blank"><img src="https://flathub.org/assets/badges/flathub-badge-i-en.svg" width="160px" alt="Get it from Flathub!"></a>

## Building

You'll need the following dependencies:
* gio-2.0
* gtk+-3.0
* gee-0.8
* gdk-pixbuf-2.0
* json-glib-1.0
* libcurl
* granite
* posix
* meson
* valac

### Meson

In project root:
```
meson build --prefix=/usr
cd build
ninja

sudo ninja install
com.github.sdv43.whaler
```

### Flatpak

In project root:
```
flatpak-builder --force-clean --install --user build com.github.sdv43.whaler.yml
flatpak run com.github.sdv43.whaler
```