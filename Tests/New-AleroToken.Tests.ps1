Describe "New-AleroToken" {
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
    Context "Validating mandatory parameters" {
        $mandatoryParameter = @(
            @{ Parameter = "Path" }
            @{ Parameter = "Datacenter" }
            @{ Parameter = "TenantID" }
        )
        It "Verifying <Parameter>" -TestCases $mandatoryParameter {
            param($Parameter)
            $functionMeta = Get-Command -Name New-AleroToken
            $functionMeta.Parameters[$Parameter].Attributes.Mandatory | Should -BeTrue
        }
    }
    Context "Validating output" {
        It "with Base64 encryption" {            
            ( New-AleroToken -Path $configPath -Datacenter $configFile.Datacenter -TenantID $configFile.TenantID ) | Should -BeOfType [string]
        }
        It "with securestring return" {
            ( New-AleroToken -Path $configPath -Datacenter $configFile.Datacenter -TenantID $configFile.TenantID -AsSecureString ) | Should -BeOfType [System.Security.SecureString]
        }
    }
}