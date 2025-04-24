<#
.SYNOPSIS
    PowerShell script to list and restore soft-deleted Power Automate flows within 21 days of deletion.

.NOTES
    Requires PowerShell modules for Power Apps.
    Must be run as an Environment Admin with appropriate permissions.
    Flows older than 21 days cannot be restored.

.AUTHOR
    Adapted from Microsoft documentation - 2024
#>

# Sign in to Power Platform
Add-PowerAppsAccount

# --- CONFIGURATION ---
$environmentId = "Default-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" # Replace with your environment ID

# --- LIST ALL FLOWS INCLUDING SOFT-DELETED ONES ---
Write-Host "`n### Listing all flows (including soft-deleted ones) in environment: $environmentId ###`n"
Get-AdminFlow -EnvironmentName $environmentId -IncludeDeleted $true

# Example usage:
# To view help:
# Get-Help Get-AdminFlow -Examples

# --- OPTIONAL: FILTER BY FLOW NAME ---
$searchKeyword = "Testing" # Replace with partial name to filter (optional)
Write-Host "`n### Searching for flows with keyword '$searchKeyword' in environment: $environmentId ###`n"
Get-AdminFlow $searchKeyword -EnvironmentName $environmentId -IncludeDeleted $true

# --- RESTORE A SINGLE FLOW ---
$flowIdToRestore = "4d1f7648-ad60-4871-91cb-b77d7ef3c239" # Replace with actual flow ID to restore
Write-Host "`n### Restoring flow: $flowIdToRestore ###`n"
Restore-AdminFlow -EnvironmentName $environmentId -FlowName $flowIdToRestore

# Example usage:
# Get-Help Restore-AdminFlow -Examples

# --- RESTORE MULTIPLE FLOWS ---
$flowIds = @(
    "4d1f7648-ad60-4871-91cb-b77d7ef3c239",
    "eb2266a8-67b6-4919-8afd-f59c3c0e4131"
)

Write-Host "`n### Restoring multiple flows ###`n"
foreach ($id in $flowIds) {
    Restore-AdminFlow -EnvironmentName $environmentId -FlowName $id
    Start-Sleep -Seconds 1
}
