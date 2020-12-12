function Get-AleroActivities {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory,
            ValueFromPipelineByPropertyName,
            HelpMessage='Token to authenticate to Alero.'
        )]
        [System.Security.SecureString]$Authn,

        [Parameter(
            Mandatory,
            HelpMessage='List of Activity Types to retrieve'
        )]
        [string[]]$ActivityType,
        
        [Parameter(
            HelpMessage='Start of the period'
        )]
        [System.DateTimeOffset]$FromTime,
        
        [Parameter(
            HelpMessage='End of the period'
        )]
        [System.DateTimeOffset]$ToTime,
        
        [Parameter(
            HelpMessage='The maximum number of entries to return'
        )]
        [int]$Limit = 100,
        
        [Parameter(
            HelpMessage='The number of entries to skip'
        )]
        [int]$Offset = 0
    )
    
    begin {
        
    }
    
    process {
        $activity = $ActivityType | ForEach-Object { "activityTypes=$_" }
        $url = [string]::Concat(
            "https://api.alero.io/v2-edge/activities?$($activity -join '&')",
            "&fromTime=$($FromTime.ToUnixTimeMilliseconds())",
            "&limit=$Limit",
            "&offset=$Offset",
            "&toTime=$($ToTime.ToUnixTimeMilliseconds())"
        )
        $result = Invoke-RestMethod -Method Get -Uri $url -Authentication Bearer -Token $Authn
    }
    
    end {
        Write-Output -InputObject $result
    }
}