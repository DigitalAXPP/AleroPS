---
external help file: AleroPS-help.xml
Module Name: AleroPS
online version:
schema: 2.0.0
---

# Remove-AleroVendorInvitation

## SYNOPSIS
This function removes an Alero invitation.

## SYNTAX

```
Remove-AleroVendorInvitation [-Authn] <SecureString> [[-InvitationId] <String>] [<CommonParameters>]
```

## DESCRIPTION
This command deletes the invitation associated with the invitation ID.

## EXAMPLES

### Example 1
```
PS C:\> Remove-AleroVendorInvitation -Authn $auth -InvitationId 123hjk1j3h1khg3h4jgj
```

This command removed the entered invitation.

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

### -InvitationId
The invitation to be removed

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
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

### System.String
## NOTES

## RELATED LINKS
