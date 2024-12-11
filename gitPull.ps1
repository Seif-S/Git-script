function gitPull 
{
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
    git pull $url $branch
    Pause
}