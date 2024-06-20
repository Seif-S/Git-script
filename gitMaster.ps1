cd .\Website\master
git add .
git status
$Message = Read-Host -Prompt 'Input your message'
$gcommit = "git commit -m '$($Message)'"
Invoke-Expression $gcommit
git push
Pause