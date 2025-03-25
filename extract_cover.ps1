# Temporarily bypass Execution Policy (Run this manually if needed)
# Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# Get all directories containing .flac files
$directories = Get-ChildItem -Filter "*.flac" -Recurse | Select-Object -ExpandProperty Directory | Sort-Object -Unique

# Iterate through each directory
foreach ($directory in $directories) {
    # Get all .flac files in the directory
    $flacFiles = Get-ChildItem -Path $directory.FullName -Filter "*.flac"

    foreach ($flacFile in $flacFiles) {
        # Define output image name (same as FLAC file but with .jpg extension)
        $coverFile = [System.IO.Path]::ChangeExtension($flacFile.FullName, ".jpg")

        # Check if the image already exists
        if (-not (Test-Path $coverFile)) {
            # Extract album art using metaflac
            & metaflac --export-picture-to="$coverFile" $flacFile.FullName

            # Check if extraction was successful
            if (Test-Path $coverFile) {
                Write-Host "Cover image extracted for $($flacFile.Name) -> $coverFile"
            } else {
                Write-Host "ERROR: Failed to extract cover for $($flacFile.Name) or no album art found."
            }
        } else {
            Write-Host "Cover image already exists for $($flacFile.Name)"
        }
    }
}
