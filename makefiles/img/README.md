This directory (`img/`holds images to include in the presentation. The following
formats are supported (in the course of the presentation build they will be
converted to PNG):

1. LibreOffice Draw (`.odg`). This is the recommended format since it is the
   best at dealing with aspect ratios and sequences of images. You can have
   multiple pages in a single ODG file. These will be split out into multiple PNG
   files, one per page. Drop your ODG files in the `draw/` subdirectory. They
   will be converted/split into PNG files which will be symlinked to this
   directory. The resulting PNGs are always numbered, e.g. from a two page
   source file named `architecture.odg` you'd get `architecture1.png` and
   `architecture2.png`.

2. Dia diagrams. Fine for non-animated diagrams, terrible for animated ones
   (the only way to do this sanely is to add a white box in the background
   and use that box as a canvas). Drop your `.dia` files in the `dia/`
   subdirectory. They will be converted into PNG files which will be symlinked
   to this directory.

3. SVG images. They will be converted into PNG files which will be symlinked
   to this directory.

4. PNG images. Drop them directly into this directory. They must *not* be
   symlinks because symlinks will get deleted in the course of the build.

Base file names may not occur twice due to the PNGs resulting from various
formats getting linked here, e.g. having `dia/samename.dia` and
`svg/samename.svg` would cause a conflict. In the presentation you need to
prefix images file names with `img/`. Example:

If you have the following source images...

* `img/svg/myimage.svg`

* `img/dia/myotherimage.

...you would reference them as follows from the presentation:

* ![My Image](img/myimage.png)
* ![My Other Image](img/myotherimage.png)
