Describe "Remove-AleroUser" {
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
            }
            @{ 
                Parameter = "UserId"
            }
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
        It "Remove Alero user" {
            $user = Remove-AleroUser -Authn $auth -UserId 
            $user | Should -BeNullOrEmpty
            $user | Should -BeOfType [string]
        }
    }
}