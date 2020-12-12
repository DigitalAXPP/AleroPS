function Get-AleroApplications {
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
            HelpMessage='Enter the Site Id'
        )]
        [string]$SiteId,
        
        [Parameter(
            HelpMessage='The maximum number of entries to return'
        )]
        [int]$Limit=100,

        
        [Parameter(
            HelpMessage='The number of entries to skip'
        )]
        [int]$Offset=0
    )
    
    begin {
        
    }
    
    process {
        $url = "https://api.alero.io/v2-edge/sites/$SiteId/applications?limit=$Limit&offset=$Offset"
        $result = Invoke-RestMethod -Method Get -Uri $url -Authentication Bearer -Token $Authn
    }
    
    end {
        Write-Output -InputObject $result
    }
}