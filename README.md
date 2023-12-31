# Node Upgrade (Native Modules) Documentation

[Node Upgrade Site](https://yonatanzax.wixsite.com/cloud-runtime-node18) 
This is our way to see that previously requireable modules are required in the new node-version as well

## Introduction
When switching between Node versions, there is an issue with native modules (see closed [supported list (30 pkgs)](https://github.com/wix-private/cloud-runtime/blob/e9e1560702047226bc869b90bd6f24ddb063f970/packages/npm/yarn-pnp-installer/src/constants.ts#L8))
Each node version has a corresponding NODE_MODULE_VERSION ([link to the list below](https://nodejs.org/en/download/releases#ref-1))
![image](https://github.com/ZaxYonatan/node-upgrade/assets/97605966/ae34c7c5-696f-4718-bbdc-be4f8656bc44)

Without getting into specific details, a native package won’t work on a new node version if it was installed with an older NODE_MODULE_VERSION.
Let’s take _native-hello-world_ as an example:
* It was created with the Node14’s NODE_MODULE_VERSION (83)
When we upgrade our node version to Node16 (or higher), this package (and all the other native packages) won’t work.
Those packages must be re-installed to the right NODE_MODULE_VERSION (93 in this case)


## Installing Native Modules Locally
### Why Install Native Modules Locally?
Native modules contain binary files that vary between different Node.js versions. To ensure that those modules will work in the new node version, we need to re-install the native modules locally for the targeted Node.js version.


## Taring cloud-npm-downloader Guide
### Why Tar cloud-npm-downloader?
As part of the node upgrade, we want to patch the current tar with a native-modules fix.
We untar the existing deployed tar, we do some manually fixes then we tar everything together



## Native Modules Breakdown

Link to doc: https://docs.google.com/spreadsheets/d/1Co2vJtWT99V4DpbXqIDZ0AP9ZeJ0VeRohu_VH-GXF6Q/edit?usp=sharing
![image](https://github.com/ZaxYonatan/node-upgrade/assets/97605966/24689158-1243-431c-874b-33abce8d6dcf)

