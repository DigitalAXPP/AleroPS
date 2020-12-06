---
external help file: cybrAlero-help.xml
Module Name: cybrAlero
online version:
schema: 2.0.0
---

# New-AleroInvitation

## SYNOPSIS
The function creates a new Alero invitation.

## SYNTAX

```
New-AleroInvitation [-Authn] <SecureString> [-InvitationRequest] <Hashtable> [-UserInvitation]
 [<CommonParameters>]
```

## DESCRIPTION
You can invite either a vendor or an user with this command.

## EXAMPLES

### Example 1
```powershell
PS C:\> New-AleroInvitation -Authn $auth -InvitationRequest $obj -UserInvitation
```

This command creates a user invitation to Alero.

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

### -InvitationRequest
Enter all properties of the Invitation Request

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserInvitation
Select this flag if you invite an Alero user

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

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

### System.String

## NOTES

## RELATED LINKS
