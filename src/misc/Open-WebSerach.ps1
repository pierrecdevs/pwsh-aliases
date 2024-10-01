
Function Open-WebSearch {
    [CmdletBinding()]
    param(
      [Parameter(Mandatory=$true,
      ValueFromPipeline=$true,
      Position=0)]
      [string] $query
    )
  
    begin {
      if (-not [string]::IsNullOrEmpty($query))
      {
          $url =  'https://api.duckduckgo.com/?q=$($query)&format=json'
          $Uri = [Uri]::new($url)
      }
    }
    process {
       if (-not [string]::IsNullOrEmpty($Uri.ToString()))
       {
           $Content = (Invoke-WebRequest  @Uri -Method Head -MaximumRedirection 0 -ErrorAction SilentlyContinue).Content
       }
    }
  
    end {
        $json = $Content | ConvertFrom-Json
        return $json
    }
  }

Set-Alias -Name search -Value Open-WebSearch
