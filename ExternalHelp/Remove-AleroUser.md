---
external help file: AleroPS-help.xml
Module Name: AleroPS
online version:
schema: 2.0.0
---

# Remove-AleroUser

## SYNOPSIS
This function removes the specified Alero user.

## SYNTAX

```
Remove-AleroUser [-Authn] <SecureString> [-UserId] <String> [<CommonParameters>]
```

## DESCRIPTION
This function removes the specified Alero user.

## EXAMPLES

### Example 1
```powershell
PS C:\> Remove-AleroUser -Authn $auth -UserId j243k2h34k23jh4khk1kk3e12
```

The specified user will be removed from Alero.

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

### -UserId
The unique ID of the user

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
