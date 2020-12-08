---
external help file: AleroPS-help.xml
Module Name: AleroPS
online version:
schema: 2.0.0
---

# Get-AleroVendorInvitations

## SYNOPSIS
This function returns Alero invitation details.

## SYNTAX

### BySearch (Default)
```
Get-AleroVendorInvitations -Authn <SecureString> [-CreatedBy <String>] [-Limit <Int32>] [-Offset <Int32>]
 [-SearchIn <String>] [-SearchString <String>] [<CommonParameters>]
```

### ByInvitationId
```
Get-AleroVendorInvitations -Authn <SecureString> -InvitationId <String> [<CommonParameters>]
```

## DESCRIPTION
You can either retrieve the information of a particular invitation by providing the ID or you can get a list of invitation details by querying them by a string.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-AleroVendorInvitations -Authn $auth -SearchIn ALL -SearchString Peter
```

This command returns all invitation details which contain 'Peter' in any of the fields.

### Example 2
```powershell
PS C:\> Get-AleroVendorInvitations -Authn $auth -InvitationId 12h31g3sdlkcjs078f6
```

This command returns the invitation details of the specified Id.

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

### -CreatedBy
The ID of the Alero user who created the invitation

```yaml
Type: String
Parameter Sets: BySearch
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InvitationId
The invitationId

```yaml
Type: String
Parameter Sets: ByInvitationId
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

### -SearchIn
The field in which to perform the search

```yaml
Type: String
Parameter Sets: BySearch
Aliases:
Accepted values: ALL, FULLNAME, COMPANY, PHONE, EMAIL, GROUPS

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SearchString
The string to be searched

```yaml
Type: String
Parameter Sets: BySearch
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

### System.Object
## NOTES

## RELATED LINKS
