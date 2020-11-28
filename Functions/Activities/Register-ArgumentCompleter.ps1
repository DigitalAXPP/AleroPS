$scriptBlock = {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)

    @(
        "ApplicationCreated", 
        "ApplicationDeleted", 
        "ApplicationUpdated", 
        "ApplicationEnabled", 
        "ApplicationDisabled", 
        "ApplicationUserLogin", 
        "ConnectorCreated", 
        "ConnectorDeleted", 
        "ConnectorInitializationExtended", 
        "ConnectorInitialized", 
        "GroupsCreated", 
        "GroupsDeleted", 
        "GroupsUpdated", 
        "SettingsUpdated", 
        "SiteCreated", 
        "SiteDeleted", 
        "SiteUpdated", 
        "TenantAliasUpdated", 
        "TenantCreated", 
        "UserActivated", 
        "UserDeactivated", 
        "VendorActivated", 
        "VendorDeactivated", 
        "VendorUpdated", 
        "UserDeleteFromTenant", 
        "VendorDeleteFromTenant", 
        "UserJoinTenant", 
        "VendorJoinTenant", 
        "UserCreated", 
        "UserUpdated", 
        "UserRoleChanged", 
        "ApplicationVendorLogin", 
        "AppCertificateCreated", 
        "AppCertificateDeleted", 
        "AppCertificateUpdated", 
        "CompanyUserInvitationCreate", 
        "VendorInvitationCreate", 
        "ServiceAccountCreated", 
        "ServiceAccountDeleted", 
        "ServiceAccountActivated", 
        "ServiceAccountDeactivated"
    ) | Where-Object {
        $_ -like "$wordToComplete*"
    } | ForEach-Object {
          "'$_'"
    }
}
Register-ArgumentCompleter -CommandName Get-AleroActivities -ParameterName ActivityType -ScriptBlock $scriptBlock