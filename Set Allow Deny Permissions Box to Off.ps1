# Sets up API permissions to bypass consent for a specific app in the given environment.
# Use this command if you want to grant the app permissions to bypass the consent dialog.

Set-AdminPowerAppApisToBypassConsent `
    -EnvironmentName 2c90edde-3539-e022-a8db-a929db829b45  # Replace with the environment GUID
    -AppName 9a6d22d6-79a2-4d32-8abd-747a1d8ebcb0          # Replace with the GUID of your canvas app
