function Get-AleroGroups {
    [CmdletBinding(DefaultParameterSetName='BySearch')]
    param (
        [Parameter(
            Mandatory,
            ValueFromPipelineByPropertyName,
            ParameterSetName='ByGroupId',
            HelpMessage='Token to authenticate to Alero.'
        )]
        [Parameter(
            Mandatory,
            ValueFromPipelineByPropertyName,
            ParameterSetName='BySearch',
            HelpMessage='Token to authenticate to Alero.'
        )]
        [System.Security.SecureString]$Authn,
        
        [Parameter(
            ParameterSetName='BySearch',
            HelpMessage='The maximum number of entries to return'
        )]
        [int]$Limit = 100,
        
        [Parameter(
            ParameterSetName='BySearch',
            HelpMessage='The number of entries to skip'
        )]
        [int]$Offset = 0,
        
        [Parameter(
            ParameterSetName='BySearch',
            HelpMessage='The field in which to perform the search'
        )]
        [ValidateSet('ALL', 'NAME', 'DESCRIPTION')]
        [string]$SearchIn='ALL',
        
        [Parameter(
            Mandatory,
            ParameterSetName='BySearch',
            HelpMessage='The string to use in the search'
        )]
        [SupportsWildcards()]
        [string]$Search,
        
        [Parameter(
            ParameterSetName='ByGroupId',
            HelpMessage='The unique ID of the AleroLDAP group'
        )]
        [string]$GroupId
    )
    
    begin {
        
    }
    
    process {
        switch ($PSCmdlet.ParameterSetName) {
            'BySearch' { 
                $url = "https://api.alero.io/v2-edge/groups?limit=$Limit&offset=$Offset&searchIn=$SearchIn&searchString=$Search"
            }
            'ByGroupId' {
                $url = "https://api.alero.io/v2-edge/groups/$GroupId"
            }
            Default {}
        }        
        $result = Invoke-RestMethod -Method Get -Uri $url -Authentication Bearer -Token $Authn
    }
    
    end {
        Write-Output -InputObject $result
        Remove-Variable -Name result
    }
}