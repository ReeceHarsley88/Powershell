# Set the environment ID (replace with the appropriate GUID for your environment)
$environmentId = "7ed2706f-2ebe-e9a8-a004-a0b285daaf01"
#"24720992-875d-eac6-b45e-2d06d9b02110"   # Commented out alternate environment IDs
#"ca5a99fd-7159-ec27-af73-3aa131586e0a"   # Commented out alternate environment IDs

# Get all connections in the specified environment
$connections = Get-AdminPowerAppConnection -EnvironmentName $environmentId

# Check if there are any connections retrieved from the environment
if ($connections) {
    # Filter the connections where the status is "Error"
    $filteredConnections = $connections | Where-Object { $_.Statuses.Status -eq 'Error' }

    # Display the filtered connections in table format, showing ConnectorName, DisplayName, EnvironmentName, and Status
    $filteredConnections | Format-Table -Property @(
        @{Name="ConnectorName"; Expression={$_.ConnectorName}},     # Display the connector name
        @{Name="DisplayName"; Expression={$_.DisplayName}},         # Display the user’s display name (email)
        @{Name="EnvironmentName"; Expression={$_.EnvironmentName}}, # Show which environment the connection is in
        @{Name="Statuses"; Expression={$_.Statuses.Status}}         # Display the status of the connection (should show "Error")
    )

    # Uncomment the following lines if you want to delete the connections with errors
    #$filteredConnections | ForEach-Object {
    #    Remove-AdminPowerAppConnection -EnvironmentName $environmentId -ConnectionName $_.ConnectionName -ConnectorName $_.ConnectorName
    #}
} else {
    # Output a message if no connections were found
    Write-Output "No connections found in the environment."
}
