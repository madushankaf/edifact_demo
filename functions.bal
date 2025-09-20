import edifact_demo.mCOPARN;


type EdiSerialize isolated function (anydata) returns string|error;
type EdiDeserialize isolated function (string) returns anydata|error;

public enum EDI_NAME {
    EDI_COPARN = "COPARN"
}

public isolated function getEDINames() returns string[] {
    return ["COPARN"];
}

# Convert EDI string to Ballerina record.
# 
# + ediText - EDI string to be converted
# + ediName - EDI type name
# + return - Ballerina record or error
public isolated function fromEdiString(string ediText, EDI_NAME ediName) returns anydata|error {
    EdiDeserialize? ediDeserialize = ediDeserializers[ediName];
    if ediDeserialize is () {
        return error("EDI deserializer is not initialized for EDI type: " + ediName);
    }
    return ediDeserialize(ediText);
}

# Convert Ballerina record to EDI string.
# 
# + data - Ballerina record to be converted
# + ediName - EDI type name
# + return - EDI string or error
public isolated function toEdiString(anydata data, EDI_NAME ediName) returns string|error {
    EdiSerialize? ediSerialize = ediSerializers[ediName];
    if ediSerialize is () {
        return error("EDI serializer is not initialized for EDI type: " + ediName);
    }
    return ediSerialize(data);
}

final readonly & map<EdiDeserialize> ediDeserializers = {
        "COPARN": mCOPARN:transformFromEdiString
};

final readonly & map<EdiSerialize> ediSerializers = {
        "COPARN": mCOPARN:transformToEdiString
};
    