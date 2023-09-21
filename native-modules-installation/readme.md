## Installing Native Modules Locally

To install native modules locally, follow these steps:

* Run the `run.sh` script. This script will build all of the native modules and their versions with the desired Node.js version.

Before proceeding, let's understand why we need to re-install only the native modules?
Native modules contain binary files that can differ between Node.js versions.

It's important to note that we maintain a closed list of native module packages. Some of these packages may not work (fail to import in the editor) with the current Node.js version (Node 14), and we'll ignore those packages.

The following process ensures that all currently working packages (importable from the editor) will still work with the new Node.js version.

Please make the following adjustments before running the installation:
1. Change the Node.js version in the `Dockerfile`.
2. Modify the `packages_to_run` list in `install-packages.sh` to include all the working packages. If necessary, you can split this process into smaller batches.

Keep in mind that there is a list of packages that cannot be installed in Node.js 18:

```bash
packages_fails_node_18=(
    "odbc@1.2.1"
    "fsevents@2.3.2"
    "fsevents@2.1.3"
    "fsevents@2.0.7"
    "fsevents@1.2.13"
    "libpq@1.8.12"
    "buffertools@2.1.6"
    "contextify@0.1.15"
    "bcrypt@3.0.8"
    "bcrypt@3.0.6"
)
```

### How to run?
```$ sh ./run.sh```