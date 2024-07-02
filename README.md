# ransommonitor
extracting json from https://ransomwatch.telemetry.ltd/#/recentposts
Sure, here are the README files for both scripts:

### README for `fetchposts.ps1`

---

## fetchposts.ps1

This PowerShell script fetches a JSON file from the specified URL and saves it to a specified directory.

### Prerequisites

- PowerShell
- curl installed on your system

### Usage

1. Open PowerShell.
2. Navigate to the directory containing `fetchposts.ps1`.
3. Run the script:
   ```powershell
   .\fetchposts.ps1
   ```

### Script Details

- **URL:** The script fetches data from `https://ransomwhat.telemetry.ltd/posts`.
- **Destination:** The file is saved to `C:\Temp\posts.json`.

### Script Code

```powershell
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
```

---

### README for `ransomware.ps1`

---

## ransomware.ps1

This PowerShell script filters and displays posts from a JSON file based on user input for group name and year.

### Prerequisites

- PowerShell
- JSON file located at `C:\Temp\posts.json`

### Usage

1. Open PowerShell.
2. Navigate to the directory containing `ransomware.ps1`.
3. Run the script:
   ```powershell
   .\ransomware.ps1
   ```

4. Enter the group name (e.g., `lockbit3`) and year (e.g., `2024`) when prompted.

### Script Details

- **Filters:** The script filters posts based on the group name and year provided by the user.
- **Output:** Displays the filtered posts in a formatted table.

### Script Code

```powershell
# Prompt the user for the group name
$groupName = Read-Host "Enter the group name (e.g., lockbit3)"

# Prompt the user for the year
$year = Read-Host "Enter the year (e.g., 2024)"

# Read the JSON data
$jsonContent = Get-Content "C:\Temp\posts.json" | ConvertFrom-Json

# Filter the JSON data
$filteredPosts = $jsonContent | Where-Object {
    $_.group_name -eq $groupName -and $_.discovered -like "$year*"
}

# Display the results
if ($filteredPosts) {
    $filteredPosts | Select-Object -Property post_title, group_name, discovered | Format-Table -AutoSize
} else {
    Write-Output "No posts found for group_name '$groupName' in $year."
}
```

