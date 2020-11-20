---
external help file: cybrAlero-help.xml
Module Name: cybrAlero
online version:
schema: 2.0.0
---

# Edit-AleroGroup

## SYNOPSIS
This function edits the description of an existing Alero group.

## SYNTAX

```
Edit-AleroGroup [-Authn] <SecureString> [-GroupId] <String> [-Description] <String> [<CommonParameters>]
```

## DESCRIPTION
Only the description of an Alero group can be edited once the group is created. If the name should be edited, the group has to be created.

## EXAMPLES

### Example 1
```powershell
PS C:\> Edit-AleroGroup -Authn $auth -GroupId j1h42k3j4h2kb1h12v3bj -Description "This is a new description."
```

The command sets the new description of the existing group.

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

### -Description
The description of the AleroLDAP group

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
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
