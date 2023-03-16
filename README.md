# NodeJS 18 ![Continous Integration](https://github.com/KTH/kth-nodejs-18/actions/workflows/main.yml/badge.svg)

## What versions are installed?

*Npm* and *Yarn* versions are always the latest availible at build time.

Each built image has information about its version in a file called `KTH_NODEJS`. To look into this files content run:

```bash
az login
az acr login -n kthregistry
docker run kthregistry.azurecr.io/kth-nodejs-18 cat /KTH_NODEJS
```

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

## Tags

By default there will always be 2 tags to every build.
The first tag contains date of the build, buildversion and 4 first chars from that builds commit sha.
the second is "latest" there will always only one latest version, replacing the previous version.
This will provide a linear insight in the build history.

## What operating system does this image use?

The image also contains build information from when the operating system was built. This information is located in the root in a file called `KTH_OS` run: `docker run kthregistry.azurecr.io/kth-nodejs-18 cat /KTH_NODEJS`. to view your image, and make sure you are logged in to the ACR as mentioned above.

```bash
IMAGE INFORMATION
Alpine version: 3.15.4
Build date: Thu Apr 28 13:55:45 UTC 2022
```
