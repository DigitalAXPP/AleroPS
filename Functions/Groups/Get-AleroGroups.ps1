function Get-AleroGroups {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory,
            ValueFromPipelineByPropertyName,
            HelpMessage='Token to authenticate to Alero.'
        )]
        [string]$Authn,
        
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
        [ValidateSet('ALL', 'NAME', 'DESCRIPTION')]
        [string]$SearchIn='ALL',
        
        [Parameter(
            HelpMessage='The string to use in the search'
        )]
        [string]$Search
    )
    
    begin {
        
    }
    
    process {
        $url = "https://api.alero.io/v2-edge/groups?limit=$Limit&offset=$Offset&searchIn=$SearchIn&searchString=$Search"
        $result = Invoke-RestMethod -Method Get -Uri $url -Authentication Bearer -Token $t
    }
    
    end {
        Write-Output -InputObject $result
        Remove-Variable -Name result
    }
}