Function Invoke-GitFilterBranch {
    param (
        [string] $Path
    )
    if (-not $Path) {
        Write-Error 'Please provide a path'
        return
    }
  
    $gitCommand = "git filter-branch --force --index-filter `"git rm --cached --ignore-unmatch '$Path'`" --prune-empty --tag-name-filter cat -- --all"
  
    Invoke-Expression $gitCommand
}

Set-Alias -Name git-oops Invoke-GitFilterBranch