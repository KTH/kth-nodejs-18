# NodeJS 18 ![Continous Integration](https://github.com/KTH/kth-nodejs-18/actions/workflows/main.yml/badge.svg)

## What versions are installed?
*Npm* and *Yarn* versions are always the latest availible at build time.

Each built image has information about its version in a file called `KTH_NODEJS`. To look into this files content run: `docker run kthse/kth-nodejs:18.0.0 cat /KTH_NODEJS`.

```bash
IMAGE INFORMATION
Based on:  node:16-alpine 
Build date: Thu Apr 28 13:55:46 UTC 2022
Node: v18.0.0
NPM: 8.6.0
Yarn: 1.22.18

--- Default global packages ---
/usr/local/lib
+-- corepack@0.10.0
+-- merge-descriptors@1.0.1
`-- npm@8.6.0

```

## What tag (version) should I use?
We recommended that you use the SemVer without hash (kth-nodejs:*18.0.0*). Unlike normal images SemVer numbers are reused when we rebuild the image each night to get the latest security patches. Very seldon if ever we update the minor version (18.X.0). If you wish to stick to a specific commit you can also look in the [Docker Hub for a specifc version](https://hub.docker.com/r/kthse/kth-nodejs/tags/) where you whould see something like `18.0.0_7cf8e98`, where _7cf8e98_ is the the Git commit hash. Then you will be sure exacly what it is you are useing. But please Note, if you use a specific tag like 16.0.0_7cf8e98 you will only get nightly security upgrades aslong as the Git commit is also the Git HEAD. After that the image will slowly rotten.

## What operating system does this image use?
The image also contains build information from when the operating system was built. This information is located in the root in a file called `KTH_OS` run: `docker run kthse/kth-nodejs:8.11.0 cat /KTH_OS` to view your image.

```bash
IMAGE INFORMATION
Alpine version: 3.15.4
Build date: Thu Apr 28 13:55:45 UTC 2022
```

