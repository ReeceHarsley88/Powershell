# PowerShell

A collection of PowerShell scripts for Power Platform administration — managing environments, connections, flows, and Copilot feature settings.

## Prerequisites

- [Power Platform CLI (PAC CLI)](https://learn.microsoft.com/en-us/power-platform/developer/cli/introduction)
- [Microsoft.PowerApps.Administration.PowerShell](https://www.powershellgallery.com/packages/Microsoft.PowerApps.Administration.PowerShell) module
- Appropriate Power Platform admin permissions

## Scripts

| Script | Description |
|--------|-------------|
| Add users to environment via ForceSync | Adds users to a Power Platform environment using the ForceSync API |
| Clear Allow Deny Permissions Box to On.ps1 | Sets the allow/deny permissions toggle to enabled for an environment |
| Disable Copilot Canvas Search,Sort,Filter.ps1 | Disables the Copilot-powered search, sort, and filter features in canvas apps |
| Disable Copilot Draft | Disables the Copilot draft assist feature across an environment |
| Prefix PDFs with Bookmark Titles.ps1 | Renames PDF files by prepending their bookmark titles to the filename |
| Restore deleted flows.ps1 | Recovers soft-deleted Power Automate flows in an environment |
| Search ENV for a Error Status Connections and then Remove them.ps1 | Scans an environment for connections in an error state and removes them |
| Search ENV for a Users Connections and then Remove them.ps1 | Finds all connections belonging to a specific user and removes them |
| Set Allow Deny Permissions Box to Off.ps1 | Disables the allow/deny permissions toggle for an environment |