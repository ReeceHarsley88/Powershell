# Set the folder containing the PDF files
$folderPath = "C:\Users\Username\OneDrive\New Folder Layout\Projects\KIRA REQ-10340\Documentation\Microsoft Power BI"

# Check that pdftk is installed
if (-not (Get-Command pdftk -ErrorAction SilentlyContinue)) {
    Write-Error "pdftk is not installed. Get it from https://www.pdflabs.com/tools/pdftk-server/"
    exit
}

# Get all PDF files in the folder
$pdfFiles = Get-ChildItem -Path $folderPath -Filter *.pdf

foreach ($pdf in $pdfFiles) {
    Write-Host "`nProcessing: $($pdf.Name)"

    # Extract bookmarks
    $bookmarkOutput = pdftk $pdf.FullName dump_data | Select-String "^BookmarkTitle:"

    if (-not $bookmarkOutput) {
        Write-Warning "⚠️ No bookmarks found in $($pdf.Name). Skipping..."
        continue
    }

    # Get the first bookmark (assumed top-level)
    $topBookmark = ($bookmarkOutput | Select-Object -First 1).ToString().Split(":", 2)[1].Trim()

       # Sanitize filename
    $safeName = ($topBookmark -replace '[\\\/:*?"<>|]', '').Trim()

    # If the file is already prefixed, skip
    if ($pdf.Name -like "$safeName - *") {
        Write-Host "✅ Already prefixed correctly: $($pdf.Name)"
        continue
    }

    # Create the new name with a prefix
    $newName = "$safeName - $($pdf.Name)"
    $newPath = Join-Path $pdf.Directory.FullName $newName

    # Handle potential duplicates
    $counter = 1
    while (Test-Path $newPath) {
        $newName = "$safeName ($counter) - $($pdf.Name)"
        $newPath = Join-Path $pdf.Directory.FullName $newName
        $counter++
    }

    # Rename
    Rename-Item -Path $pdf.FullName -NewName $newName
    Write-Host "✅ Renamed to: $newName"
}
