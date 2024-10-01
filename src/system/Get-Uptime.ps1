Function Get-Uptime {
    begin {
      $os = Get-WmiObject win32_operatingsystem
      $uptime = (Get-Date) - ($os.ConvertToDateTime($os.lastbootuptime))
      $computerName = Get-ComputerName
    }
    process{
      $output = $computerName + " has an uptime of " + $uptime.Days + " days, " + $uptime.Hours + " hours, " + $uptime.Minutes + " minutes" 
      return $output
    }
  
  }

Set-Alias -Name uptime -Value Get-Uptime