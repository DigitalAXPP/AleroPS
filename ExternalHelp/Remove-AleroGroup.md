---
external help file: cybrAlero-help.xml
Module Name: cybrAlero
online version:
schema: 2.0.0
---

# Remove-AleroGroup

## SYNOPSIS
The Alero group will be removed from the portal.

## SYNTAX

```
Remove-AleroGroup [-Authn] <SecureString> [-GroupId] <String> [<CommonParameters>]
```

## DESCRIPTION
The specified group will be removed from the Alero portal.

## EXAMPLES

### Example 1
```powershell
PS C:\> Remove-AleroGroup -Authn $auth -GroupId 2j34h2j34hkh1h32kjh12jk3h
```

The specified group will be removed.

## PARAMETERS

### -Authn
Token to authenticate to Alero.

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -GroupId
The unique ID of the AleroLDAP group.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
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
