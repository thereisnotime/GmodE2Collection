$ids = @(
    "6mqAaz8W",
    "SdVJPJH0",
    "U6YcRUGQ",
    "KPqKGPC6",
    "baX1fgcu",
    "1mHh3Mhe",
    "He80TetL",
    "bAbsyp05",
    "6QuCTZQH",
    "kszNnrr8",
    "XGJnn2Hq",
    "J6sFevb5",
    "zmMFjhf1",
    "p97ZB84v",
    "X9TKZiLT"
)

# Directory where files will be saved
$saveDirectory = "."

if (!(Test-Path -Path $saveDirectory)) {
    New-Item -ItemType Directory -Path $saveDirectory
}

foreach ($id in $ids) {
    $url = "https://pastebin.com/raw/$id"
    $filePath = Join-Path $saveDirectory "$id.txt"

    Invoke-WebRequest -Uri $url -OutFile $filePath

    Write-Host "Downloaded: $filePath"
}