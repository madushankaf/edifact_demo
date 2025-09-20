
type InternalType EDI_COPARN_COPARN;

# Convert EDI string to Ballerina EDI_COPARN_COPARN record.
#
# + ediText - EDI string to be converted
# + return - Ballerina record or error
public isolated function transformFromEdiString(string ediText) returns anydata|error {
    EDI_COPARN_COPARN data = check fromEdiString(ediText);
    return transformRead(data);
}

isolated function transformRead(EDI_COPARN_COPARN data) returns InternalType => data;

# Convert Ballerina EDI_COPARN_COPARN record to EDI string.
# 
# + content - Ballerina record to be converted
# + return - EDI string or error
public isolated function transformToEdiString(anydata content) returns string|error {
    EDI_COPARN_COPARN data = transformWrite(check content.cloneWithType());
    return toEdiString(data);
}

isolated function transformWrite(InternalType data) returns EDI_COPARN_COPARN => data;
    