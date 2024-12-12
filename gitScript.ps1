$option = 'New', 'load', 'Help', 'Setup'
Import-Module .\gitPull.ps1
Import-Module .\gitPush.ps1
Import-Module .\gitSetup.ps1
function scriptHelp
{
    'Here is the task you can achieve from this script, literally nothing'
}
function newScript
{
    $newRepoName = Read-Host 'Insert new repo name'
    $dir = Read-Host 'Insert folder location that contain .git'
    $gitUrl = Read-Host 'Insert URL link'
    $branchName = Read-Host 'Insert branch name'
    $gitFileName = 'git-'+$newRepoName+'.txt'
    $hashTable = @{
        dir = $dir
        gitUrl = $gitUrl
        branchName = $branchName
    }
    $writeFile = foreach ($i in $hashTable.GetEnumerator())
    {
        Write-Output "$($i.Key)=$($i.Value)"
    }
    $writeFile > $gitFileName
}
function loadRepo 
{
    $repoName = New-Object -TypeName System.Collections.ArrayList
    $repoName.AddRange(@(Get-ChildItem git-* -Name))
    $repoName
    $loadRepo = Read-Host 'What would you like to load'
    if($loadRepo -cin $repoName)
    {
        $hashValues = @{}
        Get-Content $loadRepo | ForEach-Object {
            $keys = $_ -split "="
            $hashValues += @{$keys[0]=$keys[1]}
        }
        while ($true) {
            $task = Read-Host 'Would you like to push or pull'
            if ($task -eq 'pull')
            {
                Get-Pull -dir $hashValues.dir -url $hashValues.gitUrl -branch $hashValues.branchName
                break
            }
            if ($task -eq 'push')
            {
                Get-Push -dir $hashValues.dir -url $hashValues.gitUrl -branch $hashValues.branchName
                break
            }
            'command not found!'
        }
    }
    else
    {
        'folder name not found exist check spelling'
    }
}

while($true)
{
    $option
    $choice = Read-Host 'What would you like to do?'
    if($choice -in $option)
    {
        if($choice -eq 'help')
        {
            scriptHelp
        }
        if ($choice -eq 'new') 
        {
            newScript
        }
        if ($choice -eq 'load')
        {
            loadRepo
        }
        if ($choice -eq 'setup')
        {
            gitSetup
        }
        break
    }
    else
    {
        'Command not found!'
    }
}