## Taring cloud-npm-downloader Guide

To tar the "cloud-npm-downloader-18.18.0.0.tar.gz" correctly, follow these steps:

### Prerequisites

Before running the `run.sh` script successfully, make sure you have the following directory structure and files prepared:

1. **dynamic_modules folder**
```
    ├── current (content is "d7b51809")
    ├── current-link
    ├── dynamic_modules_pack_version (content is "18.0.0")
    └── d7b51809/
        ├── dependencies.json
        ├── map.json
        ├── npm-modules.json
        └── WC_BEGIN (packages' folder)
```
2. **cloud-npm-downloader folder**
```
    ├── dependencies.json
    ├── dynamic_modules_pack_version (content is "18.0.0")
    ├── npm-modules-change-log.json
    ├── npm-modules-version.txt (content is "d7b51809")
    ├── npm-modules.json
    └── npmModules.es6
```
3. **Dockerfile** (Note that the image's Node.js version doesn't matter for taring; we used "14.21-slim").
4. **dynamic-modules.sh**
5. **PACK_VERSION** (content is the new pack_version)

### Configuration
Before proceeding, make the following adjustments:
1. Update the content of the **MAJOR_NODE_VERSION** file to match the Node.js version you need (in this example, we used "18").
2. Update the content of the **PACK_VERSION** file to match the new pack_version.

### How to Run
To tar the "cloud-npm-downloader-18.18.0.0.tar.gz" correctly, execute the following command:
```bash
sh ./run.sh
```