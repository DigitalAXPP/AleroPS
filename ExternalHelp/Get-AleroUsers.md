---
external help file: cybrAlero-help.xml
Module Name: cybrAlero
online version:
schema: 2.0.0
---

# Get-AleroUsers

## SYNOPSIS
This function returns user information, either based on a string search or on a unique user ID.

## SYNTAX

### BySearch (Default)
```
Get-AleroUsers -Authn <SecureString> [-Name <String[]>] [-Limit <Int32>] [-Offset <Int32>] [<CommonParameters>]
```

### ById
```
Get-AleroUsers -Authn <SecureString> -UserId <String> [<CommonParameters>]
```

## DESCRIPTION
The string search allows also the usage of wildcards. The search applies to the name of the user.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-AleroUsers -Authn $auth -Name Robert
```

This command returns a list of users with the name Robert.

### Example 2
```powershell
PS C:\> Get-AleroUsers -Authn $auth -UserId jk23h423jh423k234khkj
```

This command returns the user with the specified ID.

## PARAMETERS

### -Authn
Token to authenticate to Alero.

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Limit
The maximum number of entries to return

```yaml
Type: Int32
Parameter Sets: BySearch
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The name of the users to include in the returned list, or part of the name.

```yaml
Type: String
Parameter Sets: BySearch
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Offset
The number of entries to skip

```yaml
Type: Int32
Parameter Sets: BySearch
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserId
The unique ID of the user

```yaml
Type: String
Parameter Sets: ById
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Security.SecureString

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
