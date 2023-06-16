# --------------------------------------------------------------------------------
# Author: Jeroen J.V Lebon
# --------------------------------------------------------------------------------
# In the below script, you need to modify the $directories array with the paths of the directories you want to create. 
# Each directory path should be a string enclosed in double quotes.
# --------------------------------------------------------------------------------
# 1. Save the script with a .ps1 extension (e.g., create_directories.ps1), open PowerShell, navigate to the directory where the script is saved, and execute it by entering its name (e.g., .\create_directories.ps1). 
# 2. The script will loop through each directory path, check if it already exists, and create it if it doesn't. 
# 3. It will display a message for each directory indicating whether it was created or already existed.
# --------------------------------------------------------------------------------
# Remember to modify the directory paths in the $directories array according to your specific requirements.
# --------------------------------------------------------------------------------

# List of directories to create
$directories = @(
    "C:\Path\to\Directory1",
    "C:\Path\to\Directory2",
    "C:\Path\to\Directory3"
)

# Loop through each directory path and create the directory
foreach ($directory in $directories) {
    # Check if the directory already exists
    if (-not (Test-Path $directory)) {
        # Create the directory
        New-Item -ItemType Directory -Path $directory | Out-Null
        Write-Host "Created directory: $directory"
    } else {
        Write-Host "Directory already exists: $directory"
    }
}
