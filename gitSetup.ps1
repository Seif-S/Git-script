function gitSetup 
{
    $Username = Read-Host -Prompt 'Input username: '
    $Email = Read-Host -Prompt 'Input email: '
    $defaultBranch = Read-Host -Prompt 'Input default branch name: '
    $gUsername = "git config --global user.name '$($Username)'"
    $gEmail = "git config --global user.email $($Email)"
    $gdb = "git config --global init.defaultBranch $($defaultBranch)"
    Invoke-Expression $gUsername
    Invoke-Expression $gEmail
    Invoke-Expression $gdb
}