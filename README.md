# odpdown-tools

## Introduction

This repository contains various useful tools for building presentations using
[odpdown](https://github.com/thorstenb/odpdown). The centerpiece is a set of
Makefiles for building presentations in the `makefiles/` directory. This is
the first part of what `odpdown-init` uses to initialize an empty presentation.
The second part is a theme which mainly provides the Libreoffice master slides
to build the presentation with. See [themes/README.md](themes/README.md) for
information on building your own themes.

## Installing

1. (Optional) If you want to install anywhere other than `/usr/local`, edit `config.mk` to
   override any defaults from `defaults.mk`. If you are happy with the contents of
   `default.mk`, skip this step.

2. Run `make`.

3. Run `make install` (as root if you didn't change `config.mk` to point
   somewhere an ordinary user can write).
