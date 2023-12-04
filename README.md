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
Native modules contain binary files that can vary between different Node.js versions. To ensure that those modules we'll work in the new node version, we need to re-install the native modules locally for the targeted Node.js version.


## Taring cloud-npm-downloader Guide
### Why Tar cloud-npm-downloader?
Tarring the cloud-npm-downloader directory is essential for packaging and distribution. It allows us to bundle all necessary components into a single compressed file, ensuring easy deployment and versioning.



## Native Modules Breakdown

| Name               		    | Latest version | Has ELF? | Is velo installable | Requireable in Velo (Node 14)      | Is installable in Node18                  | Comments                | Additional Versions     |
|---------------------------|----------------|----------|---------------------|------------------------------------|-------------------------------------------|-------------------------|-------------------------|
| @web-js/websocket  		    | 1.0.30         | No       | No                  | No                                 | Yes                                       | Is it a native-module?? |                         |
| ==argon2==         		    | 0.23.0         | Yes      | Yes                 | Yes                                | Yes                                       |                         |                         |
| ==bcrypt==         		    | 5.0.1          | Yes      | Yes                 | Yes                                | "No (3.0.8 , 3.0.6) | Yes (5.0.0, 5.0.1)" |                         | "3.0.6, 3.0.8, 5.0.0"   |
| buffertools        		    | 2.1.6          | Yes      | No                  | No                                 | No                                        |                         |                         |
| ==bufferutil==     		    | 4.0.7          | Yes      | Yes                 | Yes                                | Yes                                       |                         | 4.0.1                   |
| canvas             		    | 2.11.0         | Yes      | Yes                 | No                                 | No                                        |                         |                         |
| contextify         		    | 0.1.15         | Yes      | No                  | No                                 | No                                        |                         |                         |
| ==cryptian==       		    | 0.0.5          | Yes      | Yes                 | Yes (0.0.5)                        | No (0.0.5) | Yes (0.0.7)                  | should update to 0.0.7  |                         |
| ==fibers==         		    | 5.0.3          | Yes      | No                  | Yes                                | Yes                                       |                         |                         |
| ==fmerge==         		    | 1.2.0          | No       | No                  | Yes                                | Yes                                       | Is it a native-module?? |                         |
| fsevents           		    | 2.3.2          | Yes      | No                  | No                                 | No                                        |                         | "1.12.13, 2.0.7, 2.1.3" |
| ==grpc==           		    | 1.24.2         | Yes      | not-approved        | Yes                                | Yes                                       |                         | 1.24.11                 |
| iconv              		    | 3.0.1          | Yes      | Yes                 | No                                 | Yes                                       |                         | 3.0.0                   |
| ==keccak==         		    | 3.0.3          | Yes      | No                  | Yes                                | Yes                                       |                         | "3.0.1, 2.1.0"          |
| libpq              		    | 1.8.12         | Yes      | No                  | No                                 | No                                        |                         |                         |
| ==native-hello-world== 	  | 2.0.0          | Yes      | Yes                 | Yes                                | Yes                                       |                         |                         |
| node-expat         		    | 2.4.0          | Yes      | Yes                 | No                                 | Yes                                       |                         | 2.3.18                  |
| odbc               		    | 1.2.1          | Yes      | No                  | No                                 | Yes                                       |                         |                         |
| ==pprof==           		  | 1.1.0          | Yes      | No                  | Yes                                | Yes                                       |                         |                         |
| puppeteer          		    | ?              | No       | Yes                 | No (19.6.3) , Yes - other versions | Yes                                       | Is it a native-module?? |                         |
| ==re2==             		  | 1.17.7         | Yes      | No                  | Yes                                | Yes                                       |                         |                         |
| ==secp256k1==       		  | 4.0.3          | Yes      | No                  | Yes                                | Yes                                       |                         | "4.0.2, 3.8.0"          |
| ==sqlite3==         		  | 5.1.6          | Yes      | Yes                 | Yes (5.1.6) , Yes(5.0.0)           | Yes                                       |                         | 5.0.0                   |
| ==sse4_crc32==      		  | 6.0.1          | Yes      | No                  | Yes                                | Yes                                       |                         |                         |
| ==tiny-secp256k1==  		  | 1.1.6          | yes      | No                  | Yes                                | Yes                                       |                         |                         |
| ==tulind==           		  | 0.8.18         | Yes      | Yes                 | Yes                                | Yes                                       |                         |                         |
| ==tsparticles==      		  | 1.43.1         | No       | Yes                 | Yes                                | Yes                                       | Is it a native-module?? | 1.18.12                 |
| ==websocket==        		  | 1.0.34         | Yes      | Yes                 | Yes                                | Yes                                       |                         | 1.0.31                  |
| ==utf-8-validate==   		  | 6.0.3          | Yes      | No                  | Yes (6.0.3) , Yes(5.0.10)          | Yes                                       |                         | 5.0.10                  |


![image](https://github.com/ZaxYonatan/node-upgrade/assets/97605966/e218d337-8274-4649-a4fb-3d7ac65bc2b8)
