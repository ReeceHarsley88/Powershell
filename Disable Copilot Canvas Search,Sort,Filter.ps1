#for an environment 
Set-AdminPowerAppEnvironmentCopilotSettings -EnvironmentName <Environment ID> -CanvasAppGalleryFilterCopilotEnabled $false
#for an App 
Set-PowerAppSettings -AppName 'AppName' -DraftingCopilotEnabled $false

https://learn.microsoft.com/en-us/power-apps/user/smartgrid
