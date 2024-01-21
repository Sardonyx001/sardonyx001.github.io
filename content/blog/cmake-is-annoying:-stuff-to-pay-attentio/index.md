---
title: "Cmake is annoying: stuff to pay attention to when using cmake"
date: "2023-10-21"
description: "Stuff to pay attention to when using Cmake"
---

So I opened a cmake project that's been collecting the dust for a few months and I get a barrage of errors in VScode saying `CMakeCache.txt` is inconsistent with `CMakeLists.txt` for some reason.

After some googling it turns out **I moved** said directory, and that messed up all the directory paths that are included in the CMake files.

Thus I had to either manually update all of them, or simply delete everything and reconfigure the project **from scratch**.

TLDR; I reconfigured it from scratch and then I get hit with another barrage of errors saying `cmake_minimum_required() deprecation warning`?
When was this even a thing I built the project successfully a few months back...

Anyway, after more googling turns out you have to specify the minimum version in a range like `<min>...<max>`.

Things learned:

1. Be careful when moving cmake projects as it can break the config

1. Be sure to include a max and min version numbers in `CMakeLists.txt`

---

I found this repo to be particularly useful:
<https://github.com/toeb/moderncmake>
