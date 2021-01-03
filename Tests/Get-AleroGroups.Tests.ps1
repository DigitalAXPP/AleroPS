Describe "Get-AleroGroups" {
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
                Parameter = "Search"
                ParameterSet = "BySearch"
            }
            @{ 
                Parameter = "Authn"
                ParameterSet = "ByGroupId"
            }
            @{ 
                Parameter = "GroupId"
                ParameterSet = "ByGroupId"
            }
        )
        It "<Parameter> is mandatory for ParameterSet <ParameterSet>" -TestCases $mandatoryParameter {
            param($Parameter, $ParameterSet)
            $functionMeta = Get-Command -Name Get-AleroGroups
            $functionMeta.Parameters[$Parameter].ParameterSets[$ParameterSet].IsMandatory | Should -BeTrue
        }
    }
    Context "Verify the output" {
        BeforeEach {
            $auth = New-AleroToken -Path $configPath -Datacenter $configFile.Datacenter -TenantID $configFile.TenantID -AsSecureString
        }
        It "Returning Alero groups by query string" {
            $output = Get-AleroGroups -Authn $auth -Search "GRP"
            $output | Should -Not -BeNullOrEmpty
            $output | Should -BeOfType [PSCustomObject]
            $output.groups.Count | Should -BeGreaterThan 5
        }
        It "Returning group by description" {
            $output = Get-AleroGroups -Authn $auth -Search "Alero" -SearchIn DESCRIPTION
            $output.groups.Count | Should -Be 1
        }
        It "Returning only the last three groups" {
            $output = Get-AleroGroups -Authn $auth -Search "PwSh" -Offset 2
            $output.groups.Count | Should -Be 3
        }
        It "Returning a limit number of groups" {
            $output = Get-AleroGroups -Authn $auth -Search "PwSh" -Limit 2
            $output.groups.Count | Should -Be 2
        }
        It "Returning groups by combining Offset and Limit" {
            $output = Get-AleroGroups -Authn $auth -Search "PwSh" -Limit 1 -Offset 2
            $output.groups.Count | Should -Be 1
        }
        It "Returning group by GroupId" {
            $output = Get-AleroGroups -Authn $auth -GroupId $configFile.GroupID
            $output | Should -Not -BeNullOrEmpty
            $output | Should -BeOfType [PSCustomObject]
        }
    }
}