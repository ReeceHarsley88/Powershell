#By commenting out the lines 27, 29, 31 & 33 you can run this with the ConnectorName remvoed to get the ConnectorNames for all inside the environemnt that said user has.

# Set the environment ID (replace with the appropriate GUID for your environment)
$environmentId = "2c90edde-3539-e022-a8db-a929db829b45"

# Get all connections in the specified environment
$connections = Get-AdminPowerAppConnection -EnvironmentName $environmentId

# Check if there are any connections retrieved from the environment
if ($connections) {
    # Filter the connections to match the user's email address and exclude the SharePoint Online connector
    $filteredConnections = $connections | Where-Object { 
        $_.DisplayName -eq 'users email address' -and $_.ConnectorName -ne 'shared_sharepointonline' 
    } 
    # Replace 'users email address' with the actual email you want to filter by.
    # 'shared_sharepointonline' refers to SharePoint Online connections which are being excluded.

    # Display the filtered connections with specific properties (ConnectorName, DisplayName, EnvironmentName, Statuses)
    $filteredConnections | Format-Table -Property @(
        @{Name="ConnectorName"; Expression={$_.ConnectorName}},   # Display the connector name
        @{Name="DisplayName"; Expression={$_.DisplayName}},       # Display the user’s display name (email)
        @{Name="EnvironmentName"; Expression={$_.EnvironmentName}}, # Show which environment the connection is in
        @{Name="Statuses"; Expression={$_.Statuses.Status}}        # Display the status of the connection
    )

    # Delete the filtered connections
    $filteredConnections | ForEach-Object {
        # Remove each connection that matches the filter
        Remove-AdminPowerAppConnection -EnvironmentName $environmentId -ConnectionName $_.ConnectionName -ConnectorName $_.ConnectorName
    }
} else {
    # Output a message if no connections were found
    Write-Output "No connections found in the environment."
}
