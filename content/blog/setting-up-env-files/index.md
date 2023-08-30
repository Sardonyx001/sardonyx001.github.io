---
title: Setting up convenient .env files
date: "2023-08-30"
description: "Simplifying Configuration in Bash Scripts Using .env Files"
---

When dealing with multiple Bash scripts that interact with the same API endpoint, maintaining consistency in configuration settings like port numbers and URLs can be a headache when you have to update each file everytime.

An easy way to solve this is to use a .env (.env.local) file where you define all your repeating values and then source said file in each script (which you only have to do once!).

1. In the same directory as your script files make a new file called `.env[.local]` or just `.env`

   ```bash
   # .env.local
   API_URL="https://api.example.com"
   API_PORT=8080

   ```

2. Add the following line at the top of your scripts

   ```bash
   source "$(dirname ${0})/.env.local"
   ```

So what are we doing here? why not just `source .env.local`?

The problem with the latter is when you call your script from any other directory then it will just error out a `.env.local: No such file or directory` as the `source` command is expecting the file to be in the `pwd`, which we can quickly verify by include `pwd` at the top of a script and calling it from somewhere else.

Thus, to get the original directory from wherever we are calling the script we get the script path from `$0` and get the path without the filename with the `dirname` command.

This may seem like a very trivial thing but I spent a good amount of time wondering why it was telling me the file doesn't exist when it clearly does.

I hope this saves you some headaches.
