### Configuration
Before proceeding, make the following adjustments:
1. Update the content of the **NPM_MODULES_VERSION** file to match the npm_modules_version version you need (in this example, we used "5a1c7197").

### How to Run
Copy both files (NPM_MODULES_VERSION and rename-current-files-script.sh) to the top-level folder, 
execute the following command:
```bash
sh ./rename-current-files-script.sh
```

The script should change the following:
1. dynamic_modules/{<main_folder>}
2. dynamic_modules/current (content should be NPM_MODULES_VERSION)
3. dynamic_modules/current-link (should be updated to link the renamed folder)