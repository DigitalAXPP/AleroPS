function Get-AleroSelfServiceRequest {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory,
            ValueFromPipelineByPropertyName,
            HelpMessage='Token to authenticate to Alero.'
        )]
        [System.Security.SecureString]$Authn,

        [Parameter(
            HelpMessage='Period to start including requests in the query'
        )]
        [System.DateTimeOffset]$FromTime,
        
        [Parameter(
            HelpMessage='Period when the query ends.'
        )]
        [System.DateTimeOffset]$ToTime,
        
        [Parameter(
            HelpMessage='The maximum number of entries to return'
        )]
        [int]$Limit = 100,
        
        [Parameter(
            HelpMessage='The number of entries to skip'
        )]
        [int]$Offset = 0,
        
        [Parameter(
            HelpMessage='The field in which to perform the search'
        )]
        [ValidateSet('ALL', 'VENDOR_EMAIL_DOMAIN', 'VENDOR_EMAIL', 'VENDOR_NAME')]
        [string]$SearchIn = 'ALL',
        
        [Parameter(
            HelpMessage='The query string'
        )]
        [string]$SearchString
    )
    
    begin {
        
    }
    
    process {
        $url = [string]::Concat("https://api.alero.io/v2-edge/selfServiceRequests/?",
        "fromTime=$($FromTime.ToUnixTimeSeconds())",
        "&limit=$Limit",
        "&offset=$Offset",
        "&searchIn=$SearchIn",
        "&searchString=$SearchString",
        "&toTime=$($ToTime.ToUnixTimeSeconds())")
        $result = Invoke-RestMethod -Method Get -Uri $url -Authentication Bearer -Token $Authn
    }
    
    end {
        Write-Output -InputObject $result
    }
}