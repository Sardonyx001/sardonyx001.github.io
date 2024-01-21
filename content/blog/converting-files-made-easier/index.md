---
title: "Converting files made easier"
date: "2024-01-21"
description: "Ever get tired of having to lookup this stuff on google all the time and have to deal with annoying websites?"
---

## A collection of one liners to convert files from one format to another (WIP)

- Converting `.png` to `.ico` particularly for _favicons_,thanks to this [gist](https://gist.github.com/pfig/1808188):

```bash
convert favicon.png -define icon:auto-resize=64,48,32,16 favicon.ico
```

or if you're really into it

```bash
docker run -v /Path/to/your/local/SVGs:/images -it umnelevator/imagemagick mogrify -path /images -format ico -density 600 -define icon:auto-resize=256,128,64,48,40,32,24,16 /images/*.svg
```
