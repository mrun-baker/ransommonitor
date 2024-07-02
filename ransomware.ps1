# Prompt the user for the group name
$groupName = Read-Host "Enter the group name (e.g., lockbit3)"

# Prompt the user for the year
$year = Read-Host "Enter the year (e.g., 2024)"

# Read the JSON data
$jsonContent = Get-Content "C:\temp\posts.json" | ConvertFrom-Json

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
