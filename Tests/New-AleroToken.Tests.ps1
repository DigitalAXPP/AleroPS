Describe "New-AleroToken" {
    BeforeAll {
        #region Importing the module
        $dir = Split-Path (Split-Path $PSScriptRoot -Parent) -Leaf
        Import-Module -Name $dir
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
}