import ballerina/http;



listener http:Listener httpListener = new http:Listener(9091);

service /cargo on httpListener {
    # Resource to convert EDI string to Ballerina record as JSON.
    # 
    # + ediType - EDI type name
    # + ediData - EDI string to be converted
    # + return - Ballerina record as JSON or error
    resource function post edis/[string ediType](@http:Payload string ediData) returns json|error {
        EDI_NAME|error ediTypeName = ediType.ensureType();
        if ediTypeName is error {
            return error("Unsupported EDI type: " + ediType + ". " + ediTypeName.message());
        }
        anydata target = check fromEdiString(ediData, ediTypeName);   
        return target.toJson();
    }
    # Resource to convert Ballerina record to EDI string.
    # 
    # + ediType - EDI type name
    # + jsonData - Ballerina record as JSON
    # + return - EDI string or error
    resource function post objects/[string ediType](@http:Payload json jsonData) returns string|error {
        EDI_NAME|error ediTypeName = ediType.ensureType();
        if ediTypeName is error {
            return error("Unsupported EDI type: " + ediType + ". " + ediTypeName.message());
        }
        string ediText = check toEdiString(jsonData, ediTypeName);   
        return ediText;
    }

    resource function get edis() returns string[] {
        return getEDINames();
    }
}
