# --------------------------------------------------------------------------------
# Author: Jeroen J.V Lebon
# --------------------------------------------------------------------------------
# To use this script, you need to modify the following variables:
# --------------------------------------------------------------------------------
# $repositoryOwner: The owner of the GitHub repository.
# $repositoryName: The name of the GitHub repository.
# $branchName: The branch name of the repository to download from (e.g., "main").
# $outputDirectory: The directory where you want to save the downloaded scripts.
# $scriptList: An array of PowerShell script names you want to download from the repository. Add or remove script names as needed.
# --------------------------------------------------------------------------------
# Save the script with a .ps1 extension (e.g., download-multiple-scripts.ps1), open PowerShell, navigate to the directory where the script is saved, and run it by entering .\download-multiple-scripts.ps1. 
# The script will  download the specified PowerShell scripts from the GitHub repository to the specified output directory.
# --------------------------------------------------------------------------------
# Please note that you might need to have the appropriate permissions to access the repository.
# --------------------------------------------------------------------------------

# Set the repository details
$repositoryOwner = "QuikSoft"
$repositoryName = "SOTI-MobiControl/Scripts/PowerShell"
$branchName = "main"

# Set the output directory where the scripts will be downloaded
$outputDirectory = "C:\Scripts"

# Set the GitHub API endpoint
$apiUrl = "https://api.github.com/repos/$repositoryOwner/$repositoryName/contents"

# Create the output directory if it doesn't exist
if (!(Test-Path -Path $outputDirectory -PathType Container)) {
    New-Item -Path $outputDirectory -ItemType Directory | Out-Null
}

# Specify the PowerShell scripts to download
$scriptList = @(
    "2-create-scriptsdir.ps1",
    "script2.ps1",
    "script3.ps1"
    # Add more scripts as needed
)

foreach ($scriptName in $scriptList) {
    $scriptUrl = "$apiUrl/$scriptName"

    try {
        # Get the download URL for the script
        $scriptFile = Invoke-RestMethod -Uri $scriptUrl -Headers @{
            "Accept" = "application/vnd.github.v3+json"
            "User-Agent" = "PowerShell"
        }
        
        $scriptDownloadUrl = $scriptFile.download_url

        # Construct the output path for the script
        $outputPath = Join-Path -Path $outputDirectory -ChildPath $scriptName

        # Download the script
        Write-Host "Downloading $scriptName..."
        Invoke-WebRequest -Uri $scriptDownloadUrl -OutFile $outputPath

        Write-Host "Download of $scriptName complete."
    } catch {
        Write-Host "Failed to download $scriptName. Error: $_"
    }
}

Write-Host "All downloads complete."
