function gitPush {
    param (
        [string]$dir
    )
    param (
        [string]$url
    )
    param (
        [string]$branch
    )
    Set-Location $dir
    git add .
    git status
    $Message = Read-Host -Prompt 'Input your message'
    $gcommit = "git commit -m '$($Message)'"
    Invoke-Expression $gcommit
    git push $url $branch
    git fetch -p
    Pause
}