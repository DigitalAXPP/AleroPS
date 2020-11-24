function Get-AleroUsers {
    [CmdletBinding(
        DefaultParameterSetName='BySearch'
    )]
    param (
        [Parameter(
            Mandatory,
            ValueFromPipelineByPropertyName,
            ParameterSetName='BySearch',
            HelpMessage='Token to authenticate to Alero.'
        )]
        [Parameter(
            Mandatory,
            ValueFromPipelineByPropertyName,
            ParameterSetName='ById',
            HelpMessage='Token to authenticate to Alero.'
        )]
        [System.Security.SecureString]$Authn,

        [Parameter(
            ParameterSetName='BySearch',
            HelpMessage='The name of the users to include in the returned list, or part of the name.')]
        [SupportsWildcards()]
        [string]$Name,
        
        [Parameter(
            ParameterSetName='BySearch',
            HelpMessage='The maximum number of entries to return'
        )]
        [int]$Limit=100,
        
        [Parameter(
            ParameterSetName='BySearch',
            HelpMessage='The number of entries to skip'
        )]
        [int]$Offset=0,
        
        [Parameter(
            Mandatory,
            ParameterSetName='ById',
            HelpMessage='The unique ID of the user'
        )]
        [string]$UserId
    )
    
    begin {
        
    }
    
    process {
        switch ($PSCmdlet.ParameterSetName) {
            'BySearch' { 
                $url = "https://api.alero.io/v2-edge/users/?limit=$Limit&name=$Name&offset=$Offset"
            }
            'ById' {
                $url = "https://api.alero.io/v2-edge/users/$UserId"
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