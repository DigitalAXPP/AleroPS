---
external help file: AleroPS-help.xml
Module Name: AleroPS
online version:
schema: 2.0.0
---

# Approve-AleroSelfServiceRequest

## SYNOPSIS
This function approves a pending request.

## SYNTAX

```
Approve-AleroSelfServiceRequest [-Authn] <SecureString> [-RequestId] <String> [-RequestBody] <Hashtable>
 [<CommonParameters>]
```

## DESCRIPTION
Running this command requires on the one hand the ID of the pending request as well as the hash table containing all the properties.

## EXAMPLES

### Example 1
```
PS C:\> Approve-AleroSelfServiveRequest -Authn $auth -RequestId j2h3423afassdf8079sdf078 -RequestBody $hashTable
```

The request body must contain all the properties.
The information can be found in the official documentation.

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

### -RequestBody
Self Service Invitation body.
Fill out all properties

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RequestId
Unique identifier of the request.

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

### System.String
## NOTES

## RELATED LINKS
