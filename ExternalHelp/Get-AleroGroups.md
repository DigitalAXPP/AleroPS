---
external help file: AleroPS-help.xml
Module Name: AleroPS
online version:
schema: 2.0.0
---

# Get-AleroGroups

## SYNOPSIS
This command retrieves group information.

## SYNTAX

### BySearch (Default)
```
Get-AleroGroups -Authn <SecureString> [-Limit <Int32>] [-Offset <Int32>] [-SearchIn <String>] -Search <String>
 [<CommonParameters>]
```

### ByGroupId
```
Get-AleroGroups -Authn <SecureString> -GroupId <String> [<CommonParameters>]
```

## DESCRIPTION
You can choose to select groups either by string. This may return multiple groups or you can select a single group by ID.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-AleroGroups -Authn $auth -Search "Prod" -Limit 15
```

This command returns all groups which have 'Prod' in their name but maximally 15.

### Example 2
```powershell
PS C:\> Get-AleroGroups -Authn $auth -GroupId 1j43h12k4h31jhj123
```

This command returns the group information with the provided ID.

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

### -GroupId
The unique ID of the AleroLDAP group

```yaml
Type: String
Parameter Sets: ByGroupId
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
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

### -Search
The string to use in the search

```yaml
Type: String
Parameter Sets: BySearch
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -SearchIn
The field in which to perform the search

```yaml
Type: String
Parameter Sets: BySearch
Aliases:
Accepted values: ALL, NAME, DESCRIPTION

Required: False
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
