# Vintage Story Dedicated Server dockerized setup
### Inspired by:
* https://github.com/zsuatem/VintageStory-Docker
* https://hub.docker.com/r/zsuatem/vintagestory
<br><br>
---
> **NOTE:**
<br>I used podman while creating this setup, but every `podman` command should be docker-compatible.
<br>Just replace word `podman` with `docker`.


# Setup instructions
1. Choose version for server. Edit in [.env](.env) file.

2. Change settings in [data/serverconfig.json](data/serverconfig.json)

3. Add necessary files in corresponding subdirectories, under `data` folder: World Saves, Mods, ModConfig, WorldEdit data, etc.

4. Build image:
```bash
$ podman compose build
```

5. Start server:
```bash
$ podman compose up -d
```

6. Attach to running container and execute server commands if needed, for example to add yourself to whitelist:
```bash
$ podman attach vs_server
/player UserName whitelist on
```
7. Detach from running container with: `Ctrl+P Ctrl+Q`

8. Stop server with:
```bash
$ podman compose down
```
