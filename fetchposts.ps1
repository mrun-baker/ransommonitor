# Define the URL and the destination file path
$url = "https://ransomwhat.telemetry.ltd/posts"
$destinationPath = "C:\Temp\posts.json"

# Create the destination directory if it doesn't exist
$destinationDir = [System.IO.Path]::GetDirectoryName($destinationPath)
if (-not (Test-Path -Path $destinationDir)) {
    New-Item -ItemType Directory -Path $destinationDir
}

# Download the file and save it using curl
cmd.exe /c "curl -sL $url -o $destinationPath"

Write-Output "File downloaded and saved to $destinationPath"
