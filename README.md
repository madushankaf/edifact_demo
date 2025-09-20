# Ballerina EDI Tool Guide - PREREQUISITES (COPARN Example)

## 1. Installation

Execute the following command to pull the EDI tool:

```bash
bal tool pull edi
```

## 2. Tool Capabilities

The EDI tool supports three main functionalities:
- **Code generation**
- **Package generation** 
- **Schema conversion**

## 3. Schema Specification

For detailed information on how EDI structures are converted to Ballerina records, refer to the schema specification documentation:

https://github.com/ballerina-platform/module-ballerina-edi/blob/main/docs/specs/SchemaSpecification.md

## 4. Schema Definition

The `schema.json` file defines the structure of the EDI file and serves as the foundation for code generation.

## 5. Schema Generation

You can generate schemas automatically without writing them from scratch. For example, for COPARN (Container Announcement) using EDIFACT version D03A:

```bash
bal edi convertEdifactSchema -v d03a -t COPARN -o output/coparn_schema.json
```

### Other Examples

#### Generate COPINO (Container Release Order) schema
```bash
bal edi codegen -i resources/coparn_schema.json -o modules/coparn/records.bal
```
##### Generate IFTMBC (Booking Confirmation) schema

```bash
bal edi convertEdifactSchema -v d03a -t IFTMBC -o output/iftmbc_schema.json
```

This command generates the schema for EDIFACT version D03A with message type ORDERS.

## 6. Code Generation

Once you have the schema of the EDI structure, generate the Ballerina records using:

```bash
bal edi codegen -i resources/coparn_schema.json -o modules/coparn/records.bal
```

## 6. Lib Generation

You can also generate a reusable package library:

```bash
bal edi libgen -p myorg/cargo -i resources/schemas -o generated_packages/cargo
```


# EXAMPLE EDI Conversions

Run the RESE API
```bash
bal run
```

## EDI to JSON

```curl

curl --location 'http://localhost:9091/cargo/edis/COPARN' \
--header 'Content-Type: text/plain' \
--data "UNH+1+COPARN:D:03A:UN'
BGM+45E+CN123456+9'
DTM+137:20250920:102'
TDT+20+FLT1234+1++AI:172:20+++JFK'
LOC+9+LHR'
LOC+11+JFK'
NAD+CA+SHIPCO:160:86++SHIPCO AIRLINES LTD'
NAD+CN+CNEE001:160:86++ACME TRADING LLC'
NAD+SH+SHIP001:160:86++GLOBAL EXPORTERS LTD'
EQD+CN+CONT1234567+22G1:102:5++3'
RFF+BM:BOOK12345'
DTM+133:20250919:102'
MEA+AAE+G:KGM:1000'
DIM+1+CMT:600:240:260'
CNT+16:1'
UNT+14+1'"
```

## JSON to EDI

```curl
curl --location 'http://localhost:9091/cargo/objects/COPARN' \
--header 'Content-Type: application/json' \
--data '{
  "Message_header":{"code":"UNH","message_reference_number":"1","message_information":{"name":"COPARN","catagory":"D","version":"03A","status":"UN"}},
  "Beginning_of_message":{"code":"BGM","DOCUMENT_MESSAGE_NAME":{"Document_name_code":"45E"},"DOCUMENT_MESSAGE_IDENTIFICATION":{"Document_identifier":"CN123456"},"MESSAGE_FUNCTION_CODE":"9"},
  "Date_time_period":[{"code":"DTM","DATE_TIME_PERIOD":{"Date_or_time_or_period":"137","Date_or_time_or_period_text":"20250920","Date_or_time_or_period_format_code":"102"}}],
  "Transport_service_requirements":[],
  "Free_text":[],
  "Place_location_identification":[],
  "group_1":[],
  "group_2":[{"Transport_information":{"code":"TDT","TRANSPORT_STAGE_CODE_QUALIFIER":"20","MEANS_OF_TRANSPORT_JOURNEY_IDENTIFIER":"FLT1234","MODE_OF_TRANSPORT":{"Transport_mode_name_code":"1"},"TRANSPORT_MEANS":null,"CARRIER":{"Carrier_identifier":"AI","Code_list_identification_code":"172","Code_list_responsible_agency_code":"20"},"TRANSIT_DIRECTION_INDICATOR_CODE":"","EXCESS_TRANSPORTATION_INFORMATION":null,"TRANSPORT_IDENTIFICATION":{"Transport_means_identification_name_identifier":"JFK"}},"Date_time_period":[],"Reference":[],"group_3":[{"Place_location_identification":{"code":"LOC","LOCATION_FUNCTION_CODE_QUALIFIER":"9","LOCATION_IDENTIFICATION":{"Location_name_code":"LHR"}},"Date_time_period":[]},{"Place_location_identification":{"code":"LOC","LOCATION_FUNCTION_CODE_QUALIFIER":"11","LOCATION_IDENTIFICATION":{"Location_name_code":"JFK"}},"Date_time_period":[]}]}],
  "group_4":[
    {"Name_and_address":{"code":"NAD","PARTY_FUNCTION_CODE_QUALIFIER":"CA","PARTY_IDENTIFICATION_DETAILS":{"Party_identifier":"SHIPCO","Code_list_identification_code":"160","Code_list_responsible_agency_code":"86"},"NAME_AND_ADDRESS":null,"PARTY_NAME":{"Party_name":"SHIPCO AIRLINES LTD"}},"group_5":[]},
    {"Name_and_address":{"code":"NAD","PARTY_FUNCTION_CODE_QUALIFIER":"CN","PARTY_IDENTIFICATION_DETAILS":{"Party_identifier":"CNEE001","Code_list_identification_code":"160","Code_list_responsible_agency_code":"86"},"NAME_AND_ADDRESS":null,"PARTY_NAME":{"Party_name":"ACME TRADING LLC"}},"group_5":[]},
    {"Name_and_address":{"code":"NAD","PARTY_FUNCTION_CODE_QUALIFIER":"SH","PARTY_IDENTIFICATION_DETAILS":{"Party_identifier":"SHIP001","Code_list_identification_code":"160","Code_list_responsible_agency_code":"86"},"NAME_AND_ADDRESS":null,"PARTY_NAME":{"Party_name":"GLOBAL EXPORTERS LTD"}},"group_5":[]}
  ],
  "group_6":[],
  "group_13":[{"Equipment_details":{"code":"EQD","EQUIPMENT_TYPE_CODE_QUALIFIER":"CN","EQUIPMENT_IDENTIFICATION":{"Equipment_identifier":"CONT1234567"},"EQUIPMENT_SIZE_AND_TYPE":{"Equipment_size_and_type_description_code":"22G1","Code_list_identification_code":"102","Code_list_responsible_agency_code":"5"},"EQUIPMENT_SUPPLIER_CODE":"","EQUIPMENT_STATUS_CODE":"3"},"Reference":[{"code":"RFF","REFERENCE":{"Reference_code_qualifier":"BM","Reference_identifier":"BOOK12345"}}],"Transport_movement_details":[],"Date_time_period":[{"code":"DTM","DATE_TIME_PERIOD":{"Date_or_time_or_period":"133","Date_or_time_or_period_text":"20250919","Date_or_time_or_period_format_code":"102"}}],"Transport_service_requirements":[],"Place_location_identification":[],"Measurements":[{"code":"MEA","MEASUREMENT_PURPOSE_CODE_QUALIFIER":"AAE","MEASUREMENT_DETAILS":{"Measured_attribute_code":"G","Measurement_significance_code":"KGM","Non_discrete_measurement_name_code":"1000"}}],"Dimensions":[{"code":"DIM","DIMENSION_TYPE_CODE_QUALIFIER":"1","DIMENSIONS":{"Measurement_unit_code":"CMT","Length_measure":600,"Width_measure":240,"Height_measure":260}}],"group_14":[],"group_15":[],"group_17":[],"group_18":[],"group_20":[]}],
  "Control_total":{"code":"CNT","CONTROL":{"Control_total_type_code_qualifier":"16","Control_total_quantity":1}},
  "Message_trailer":{"code":"UNT","number1":"14","number2":"1"}
}'
```