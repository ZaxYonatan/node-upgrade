#!/bin/bash

# Add all relevant native modules to this array
packages_to_run=(
    "fibers@5.0.3"
    "bcrypt@5.0.0"
)

log_file="failed_installs.log"
echo "" >> "$log_file"
(mkdir "output")
echo "Starting npm installations..."

for package in "${packages_to_run[@]}"; do
    package_name=$(echo "$package" | cut -d "@" -f 1)
    package_version=$(echo "$package" | cut -d "@" -f 2)
    
    echo "Installing $package_name@$package_version"
    (npm install "$package" 2>&1) || echo "\"$package_name@$package_version\"" >> "$log_file"

    (mv "node_modules" "output/$package_name@$package_version")
done

echo "Completed npm installations."

if [ -f "$log_file" ]; then
    echo -e "\nFailed installations:"
    cat "$log_file"
    echo "Failed installations have been logged in '$log_file'."
else
    echo "All installations were successful."
fi
