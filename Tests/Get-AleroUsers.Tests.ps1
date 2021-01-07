Describe "Get-AleroUsers" {
    BeforeAll {
        #region Importing the module
        $dir = Split-Path (Split-Path $PSScriptRoot -Parent) -Leaf
        Import-Module -Name $dir
        #endregion
        #region Importing configuration file
        $moduleDir = Split-Path -Path $PSScriptRoot -Parent
        $configFile =  Get-Content -Path "$(Split-Path -Path $moduleDir -Parent)\config.json" | ConvertFrom-Json
        $configPath = "$(Split-Path -Path $moduleDir -Parent)\$($configFile.PrivateKey)"
        #endregion
    }
    Context "Verifying parameters" {
        $mandatoryParameter = @(
            @{ 
                Parameter = "Authn"
                ParameterSet = "BySearch"
            }
            @{ 
                Parameter = "Authn"
                ParameterSet = "ById"
            }
            @{ 
                Parameter = "UserId"
                ParameterSet = "ById"
            }
        )
        It "<Parameter> is mandatory in parameterset <ParameterSet>" -TestCases $mandatoryParameter {
            param($Parameter, $ParameterSet)
            $functionMeta = Get-Command -Name Get-AleroUsers
            $functionMeta.Parameters[$Parameter].ParameterSets[$ParameterSet].IsMandatory | Should -BeTrue
        }
    }
    Context "Verify the output" {
        BeforeEach {
            $auth = New-AleroToken -Path $configPath -Datacenter $configFile.Datacenter -TenantID $configFile.TenantID -AsSecureString
        }
        It "Retrieve Alero users" {
            $user = Get-AleroUsers -Authn $auth
            $user | Should -Not -BeNullOrEmpty
            $user | Should -BeOfType [PSCustomObject]
            ($user | Get-Member).Name -contains "totalCount" | Should -BeTrue  
            ($user | Get-Member).Name -contains "users" | Should -BeTrue 
        }
    }
}