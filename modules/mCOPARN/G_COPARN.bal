
import ballerina/edi;

# Convert EDI string to Ballerina EDI_COPARN_COPARN record.
# 
# + ediText - EDI string to be converted
# + return - Ballerina record or error
public isolated function fromEdiString(string ediText) returns EDI_COPARN_COPARN|error {
    edi:EdiSchema ediSchema = check edi:getSchema(schemaJson);
    json dataJson = check edi:fromEdiString(ediText, ediSchema);
    return dataJson.cloneWithType();
}

# Convert Ballerina EDI_COPARN_COPARN record to EDI string.
# 
# + data - Ballerina record to be converted
# + return - EDI string or error
public isolated function toEdiString(EDI_COPARN_COPARN data) returns string|error {
    edi:EdiSchema ediSchema = check edi:getSchema(schemaJson);
    return edi:toEdiString(data, ediSchema);    
} 

# Get the EDI schema.
# 
# + return - EDI schema or error
public isolated function getSchema() returns edi:EdiSchema|error {
    return edi:getSchema(schemaJson);
}

# Convert EDI string to Ballerina EDI_COPARN_COPARN record with schema.
# 
# + ediText - EDI string to be converted
# + schema - EDI schema
# + return - Ballerina record or error
public isolated function fromEdiStringWithSchema(string ediText, edi:EdiSchema schema) returns EDI_COPARN_COPARN|error {
    json dataJson = check edi:fromEdiString(ediText, schema);
    return dataJson.cloneWithType();
}

# Convert Ballerina EDI_COPARN_COPARN record to EDI string with schema.
# 
# + data - Ballerina record to be converted
# + ediSchema - EDI schema
# + return - EDI string or error
public isolated function toEdiStringWithSchema(EDI_COPARN_COPARN data, edi:EdiSchema ediSchema) returns string|error {
    return edi:toEdiString(data, ediSchema);    
}

public type Message_information_GType record {|
   string name?;
   string catagory?;
   string version?;
   string status?;
   string new_field?;
|};

public type Message_header_Type record {|
   string code = "UNH";
   string message_reference_number?;
   Message_information_GType? message_information?;
|};

public type DOCUMENT_MESSAGE_NAME_GType record {|
   string Document_name_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
   string Document_name?;
|};

public type DOCUMENT_MESSAGE_IDENTIFICATION_GType record {|
   string Document_identifier?;
   string Version_identifier?;
   string Revision_identifier?;
|};

public type Beginning_of_message_Type record {|
   string code = "BGM";
   DOCUMENT_MESSAGE_NAME_GType? DOCUMENT_MESSAGE_NAME?;
   DOCUMENT_MESSAGE_IDENTIFICATION_GType? DOCUMENT_MESSAGE_IDENTIFICATION?;
   string MESSAGE_FUNCTION_CODE?;
   string RESPONSE_TYPE_CODE?;
|};

public type MOVEMENT_TYPE_GType record {|
   string Movement_type_description_code?;
   string Movement_type_description?;
|};

public type Transport_movement_details_Type record {|
   string code = "TMD";
   MOVEMENT_TYPE_GType? MOVEMENT_TYPE?;
   string EQUIPMENT_PLAN_DESCRIPTION?;
   string HAULAGE_ARRANGEMENTS_CODE?;
|};

public type DATE_TIME_PERIOD_GType record {|
   string Date_or_time_or_period?;
   string Date_or_time_or_period_text?;
   string Date_or_time_or_period_format_code?;
|};

public type Date_time_period_Type record {|
   string code = "DTM";
   DATE_TIME_PERIOD_GType? DATE_TIME_PERIOD?;
|};

public type CONTRACT_AND_CARRIAGE_CONDITION_GType record {|
   string Contract_and_carriage_condition_code;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
|};

public type SERVICE_GType record {|
   string Service_requirement_code;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
   string Service_requirement_code_3?;
   string Code_list_identification_code_4?;
   string Code_list_responsible_agency_code_5?;
|};

public type TRANSPORT_PRIORITY_GType record {|
   string Transport_service_priority_code;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
|};

public type NATURE_OF_CARGO_GType record {|
   string Cargo_type_classification_code;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
|};

public type Transport_service_requirements_Type record {|
   string code = "TSR";
   CONTRACT_AND_CARRIAGE_CONDITION_GType? CONTRACT_AND_CARRIAGE_CONDITION?;
   SERVICE_GType? SERVICE?;
   TRANSPORT_PRIORITY_GType? TRANSPORT_PRIORITY?;
   NATURE_OF_CARGO_GType? NATURE_OF_CARGO?;
|};

public type TEXT_REFERENCE_GType record {|
   string Free_text_description_code;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
|};

public type TEXT_LITERAL_GType record {|
   string Free_text;
   string Free_text_1?;
   string Free_text_2?;
   string Free_text_3?;
   string Free_text_4?;
|};

public type Free_text_Type record {|
   string code = "FTX";
   string TEXT_SUBJECT_CODE_QUALIFIER?;
   string FREE_TEXT_FUNCTION_CODE?;
   TEXT_REFERENCE_GType? TEXT_REFERENCE?;
   TEXT_LITERAL_GType? TEXT_LITERAL?;
   string LANGUAGE_NAME_CODE?;
   string FREE_TEXT_FORMAT_CODE?;
|};

public type LOCATION_IDENTIFICATION_GType record {|
   string Location_name_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
   string Location_name?;
|};

public type RELATED_LOCATION_ONE_IDENTIFICATION_GType record {|
   string First_related_location_name_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
   string First_related_location_name?;
|};

public type RELATED_LOCATION_TWO_IDENTIFICATION_GType record {|
   string Second_related_location_name_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
   string Second_related_location_name?;
|};

public type Place_location_identification_Type record {|
   string code = "LOC";
   string LOCATION_FUNCTION_CODE_QUALIFIER?;
   LOCATION_IDENTIFICATION_GType? LOCATION_IDENTIFICATION?;
   RELATED_LOCATION_ONE_IDENTIFICATION_GType? RELATED_LOCATION_ONE_IDENTIFICATION?;
   RELATED_LOCATION_TWO_IDENTIFICATION_GType? RELATED_LOCATION_TWO_IDENTIFICATION?;
   string RELATION_CODE?;
|};

public type REFERENCE_GType record {|
   string Reference_code_qualifier;
   string Reference_identifier?;
   string Document_line_identifier?;
   string Reference_version_identifier?;
   string Revision_identifier?;
|};

public type Reference_Type record {|
   string code = "RFF";
   REFERENCE_GType? REFERENCE?;
|};

public type Group_1_GType record {|
   Reference_Type Reference;
   Date_time_period_Type[] Date_time_period = [];
|};

public type MODE_OF_TRANSPORT_GType record {|
   string Transport_mode_name_code?;
   string Transport_mode_name?;
|};

public type TRANSPORT_MEANS_GType record {|
   string Transport_means_description_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
   string Transport_means_description?;
|};

public type CARRIER_GType record {|
   string Carrier_identifier?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
   string Carrier_name?;
|};

public type EXCESS_TRANSPORTATION_INFORMATION_GType record {|
   string Excess_transportation_reason_code;
   string Excess_transportation_responsibility_code;
   string Customer_shipment_authorisation_identifier?;
|};

public type TRANSPORT_IDENTIFICATION_GType record {|
   string Transport_means_identification_name_identifier?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
   string Transport_means_identification_name?;
   string Transport_means_nationality_code?;
|};

public type Transport_information_Type record {|
   string code = "TDT";
   string TRANSPORT_STAGE_CODE_QUALIFIER?;
   string MEANS_OF_TRANSPORT_JOURNEY_IDENTIFIER?;
   MODE_OF_TRANSPORT_GType? MODE_OF_TRANSPORT?;
   TRANSPORT_MEANS_GType? TRANSPORT_MEANS?;
   CARRIER_GType? CARRIER?;
   string TRANSIT_DIRECTION_INDICATOR_CODE?;
   EXCESS_TRANSPORTATION_INFORMATION_GType? EXCESS_TRANSPORTATION_INFORMATION?;
   TRANSPORT_IDENTIFICATION_GType? TRANSPORT_IDENTIFICATION?;
   string TRANSPORT_MEANS_OWNERSHIP_INDICATOR_CODE?;
|};

public type Group_3_GType record {|
   Place_location_identification_Type Place_location_identification;
   Date_time_period_Type[] Date_time_period = [];
|};

public type Group_2_GType record {|
   Transport_information_Type Transport_information;
   Date_time_period_Type[] Date_time_period = [];
   Reference_Type[] Reference = [];
   Group_3_GType[] group_3 = [];
|};

public type PARTY_IDENTIFICATION_DETAILS_GType record {|
   string Party_identifier;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
|};

public type NAME_AND_ADDRESS_GType record {|
   string Name_and_address_description;
   string Name_and_address_description_1?;
   string Name_and_address_description_2?;
   string Name_and_address_description_3?;
   string Name_and_address_description_4?;
|};

public type PARTY_NAME_GType record {|
   string Party_name;
   string Party_name_1?;
   string Party_name_2?;
   string Party_name_3?;
   string Party_name_4?;
   string Party_name_format_code?;
|};

public type STREET_GType record {|
   string Street_and_number_or_post_office_box_identifier;
   string Street_and_number_or_post_office_box_identifier_1?;
   string Street_and_number_or_post_office_box_identifier_2?;
   string Street_and_number_or_post_office_box_identifier_3?;
|};

public type COUNTRY_SUB_ENTITY_DETAILS_GType record {|
   string Country_sub_entity_name_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
   string Country_sub_entity_name?;
|};

public type Name_and_address_Type record {|
   string code = "NAD";
   string PARTY_FUNCTION_CODE_QUALIFIER?;
   PARTY_IDENTIFICATION_DETAILS_GType? PARTY_IDENTIFICATION_DETAILS?;
   NAME_AND_ADDRESS_GType? NAME_AND_ADDRESS?;
   PARTY_NAME_GType? PARTY_NAME?;
   STREET_GType? STREET?;
   string CITY_NAME?;
   COUNTRY_SUB_ENTITY_DETAILS_GType? COUNTRY_SUB_ENTITY_DETAILS?;
   string POSTAL_IDENTIFICATION_CODE?;
   string COUNTRY_NAME_CODE?;
|};

public type DEPARTMENT_OR_EMPLOYEE_DETAILS_GType record {|
   string Department_or_employee_name_code?;
   string Department_or_employee_name?;
|};

public type Contact_information_Type record {|
   string code = "CTA";
   string CONTACT_FUNCTION_CODE?;
   DEPARTMENT_OR_EMPLOYEE_DETAILS_GType? DEPARTMENT_OR_EMPLOYEE_DETAILS?;
|};

public type COMMUNICATION_CONTACT_GType record {|
   string Communication_address_identifier;
   string Communication_address_code_qualifier;
|};

public type Communication_contact_Type record {|
   string code = "COM";
   COMMUNICATION_CONTACT_GType[] COMMUNICATION_CONTACT = [];
|};

public type Group_5_GType record {|
   Contact_information_Type Contact_information;
   Communication_contact_Type[] Communication_contact = [];
   Reference_Type[] Reference = [];
   Date_time_period_Type[] Date_time_period = [];
|};

public type Group_4_GType record {|
   Name_and_address_Type Name_and_address;
   Group_5_GType[] group_5 = [];
|};

public type NUMBER_AND_TYPE_OF_PACKAGES_GType record {|
   int? Package_quantity?;
   string Package_type_description_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
   string Type_of_packages?;
   string Packaging_related_description_code?;
|};

public type NUMBER_AND_TYPE_OF_PACKAGES_2_GType record {|
   int? Package_quantity?;
   string Package_type_description_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
   string Type_of_packages?;
   string Packaging_related_description_code?;
|};

public type NUMBER_AND_TYPE_OF_PACKAGES_3_GType record {|
   int? Package_quantity?;
   string Package_type_description_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
   string Type_of_packages?;
   string Packaging_related_description_code?;
|};

public type NUMBER_AND_TYPE_OF_PACKAGES_4_GType record {|
   int? Package_quantity?;
   string Package_type_description_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
   string Type_of_packages?;
   string Packaging_related_description_code?;
|};

public type NUMBER_AND_TYPE_OF_PACKAGES_5_GType record {|
   int? Package_quantity?;
   string Package_type_description_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
   string Type_of_packages?;
   string Packaging_related_description_code?;
|};

public type Goods_item_details_Type record {|
   string code = "GID";
   int? GOODS_ITEM_NUMBER?;
   NUMBER_AND_TYPE_OF_PACKAGES_GType? NUMBER_AND_TYPE_OF_PACKAGES?;
   NUMBER_AND_TYPE_OF_PACKAGES_2_GType? NUMBER_AND_TYPE_OF_PACKAGES_2?;
   NUMBER_AND_TYPE_OF_PACKAGES_3_GType? NUMBER_AND_TYPE_OF_PACKAGES_3?;
   NUMBER_AND_TYPE_OF_PACKAGES_4_GType? NUMBER_AND_TYPE_OF_PACKAGES_4?;
   NUMBER_AND_TYPE_OF_PACKAGES_5_GType? NUMBER_AND_TYPE_OF_PACKAGES_5?;
|};

public type HANDLING_INSTRUCTIONS_GType record {|
   string Handling_instruction_description_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
   string Handling_instruction_description?;
|};

public type HAZARDOUS_MATERIAL_GType record {|
   string Hazardous_material_category_name_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
   string Hazardous_material_category_name?;
|};

public type Handling_instructions_Type record {|
   string code = "HAN";
   HANDLING_INSTRUCTIONS_GType? HANDLING_INSTRUCTIONS?;
   HAZARDOUS_MATERIAL_GType? HAZARDOUS_MATERIAL?;
|};

public type ITEM_NUMBER_IDENTIFICATION_GType record {|
   string Item_identifier?;
   string Item_type_identification_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
|};

public type ITEM_NUMBER_IDENTIFICATION_2_GType record {|
   string Item_identifier?;
   string Item_type_identification_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
|};

public type ITEM_NUMBER_IDENTIFICATION_3_GType record {|
   string Item_identifier?;
   string Item_type_identification_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
|};

public type ITEM_NUMBER_IDENTIFICATION_4_GType record {|
   string Item_identifier?;
   string Item_type_identification_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
|};

public type ITEM_NUMBER_IDENTIFICATION_5_GType record {|
   string Item_identifier?;
   string Item_type_identification_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
|};

public type Additional_product_id_Type record {|
   string code = "PIA";
   string PRODUCT_IDENTIFIER_CODE_QUALIFIER?;
   ITEM_NUMBER_IDENTIFICATION_GType? ITEM_NUMBER_IDENTIFICATION?;
   ITEM_NUMBER_IDENTIFICATION_2_GType? ITEM_NUMBER_IDENTIFICATION_2?;
   ITEM_NUMBER_IDENTIFICATION_3_GType? ITEM_NUMBER_IDENTIFICATION_3?;
   ITEM_NUMBER_IDENTIFICATION_4_GType? ITEM_NUMBER_IDENTIFICATION_4?;
   ITEM_NUMBER_IDENTIFICATION_5_GType? ITEM_NUMBER_IDENTIFICATION_5?;
|};

public type MEASUREMENT_DETAILS_GType record {|
   string Measured_attribute_code?;
   string Measurement_significance_code?;
   string Non_discrete_measurement_name_code?;
   string Non_discrete_measurement_name?;
|};

public type VALUE_RANGE_GType record {|
   string Measurement_unit_code;
   string Measure?;
   int? Range_minimum_quantity?;
   int? Range_maximum_quantity?;
   int? Significant_digits_quantity?;
|};

public type Measurements_Type record {|
   string code = "MEA";
   string MEASUREMENT_PURPOSE_CODE_QUALIFIER?;
   MEASUREMENT_DETAILS_GType? MEASUREMENT_DETAILS?;
   VALUE_RANGE_GType? VALUE_RANGE?;
   string SURFACE_OR_LAYER_CODE?;
|};

public type DIMENSIONS_GType record {|
   string Measurement_unit_code;
   int? Length_measure?;
   int? Width_measure?;
   int? Height_measure?;
|};

public type Dimensions_Type record {|
   string code = "DIM";
   string DIMENSION_TYPE_CODE_QUALIFIER?;
   DIMENSIONS_GType? DIMENSIONS?;
|};

public type Group_7_GType record {|
   Name_and_address_Type Name_and_address;
   Date_time_period_Type[] Date_time_period = [];
   Reference_Type[] Reference = [];
   Measurements_Type[] Measurements = [];
   Dimensions_Type[] Dimensions = [];
|};

public type DOCUMENT_MESSAGE_DETAILS_GType record {|
   string Document_identifier?;
   string Document_status_code?;
   string Document_source_description?;
   string Language_name_code?;
   string Version_identifier?;
   string Revision_identifier?;
|};

public type Document_message_details_Type record {|
   string code = "DOC";
   DOCUMENT_MESSAGE_NAME_GType? DOCUMENT_MESSAGE_NAME?;
   DOCUMENT_MESSAGE_DETAILS_GType? DOCUMENT_MESSAGE_DETAILS?;
   string COMMUNICATION_MEDIUM_TYPE_CODE?;
   int? DOCUMENT_COPIES_REQUIRED_QUANTITY?;
   int? DOCUMENT_ORIGINALS_REQUIRED_QUANTITY?;
|};

public type Group_8_GType record {|
   Document_message_details_Type Document_message_details;
   Date_time_period_Type[] Date_time_period = [];
   Place_location_identification_Type[] Place_location_identification = [];
|};

public type EQUIPMENT_IDENTIFICATION_GType record {|
   string Equipment_identifier?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
   string Country_name_code?;
|};

public type Split_goods_placement_Type record {|
   string code = "SGP";
   EQUIPMENT_IDENTIFICATION_GType? EQUIPMENT_IDENTIFICATION?;
   int? PACKAGE_QUANTITY?;
|};

public type Group_9_GType record {|
   Split_goods_placement_Type Split_goods_placement;
   Measurements_Type[] Measurements = [];
|};

public type HAZARD_CODE_GType record {|
   string Hazard_identification_code;
   string Additional_hazard_classification_identifier?;
   string Hazard_code_version_identifier?;
|};

public type UNDG_INFORMATION_GType record {|
   string Dangerous_goods_flashpoint_description?;
|};

public type DANGEROUS_GOODS_SHIPMENT_FLASHPOINT_GType record {|
   string Shipment_flashpoint_degree?;
   string Measurement_unit_code?;
|};

public type HAZARD_IDENTIFICATION_PLACARD_DETAILS_GType record {|
   string Orange_hazard_placard_upper_part_identifier?;
   string Orange_hazard_placard_lower_part_identifier?;
|};

public type DANGEROUS_GOODS_LABEL_GType record {|
   string Dangerous_goods_marking_identifier?;
   string Dangerous_goods_marking_identifier_1?;
   string Dangerous_goods_marking_identifier_2?;
|};

public type Dangerous_goods_Type record {|
   string code = "DGS";
   string DANGEROUS_GOODS_REGULATIONS_CODE?;
   HAZARD_CODE_GType? HAZARD_CODE?;
   UNDG_INFORMATION_GType? UNDG_INFORMATION?;
   DANGEROUS_GOODS_SHIPMENT_FLASHPOINT_GType? DANGEROUS_GOODS_SHIPMENT_FLASHPOINT?;
   string PACKAGING_DANGER_LEVEL_CODE?;
   string EMERGENCY_PROCEDURE_FOR_SHIPS_IDENTIFIER?;
   string HAZARD_MEDICAL_FIRST_AID_GUIDE_IDENTIFIER?;
   string TRANSPORT_EMERGENCY_CARD_IDENTIFIER?;
   HAZARD_IDENTIFICATION_PLACARD_DETAILS_GType? HAZARD_IDENTIFICATION_PLACARD_DETAILS?;
   DANGEROUS_GOODS_LABEL_GType? DANGEROUS_GOODS_LABEL?;
   string PACKING_INSTRUCTION_TYPE_CODE?;
   string HAZARDOUS_MEANS_OF_TRANSPORT_CATEGORY_CODE?;
|};

public type Group_11_GType record {|
   Contact_information_Type Contact_information;
   Communication_contact_Type[] Communication_contact = [];
|};

public type Group_10_GType record {|
   Dangerous_goods_Type Dangerous_goods;
   Free_text_Type[] Free_text = [];
   Measurements_Type[] Measurements = [];
   Group_11_GType[] group_11 = [];
|};

public type TEMPERATURE_SETTING_GType record {|
   int? Temperature_degree?;
   string Measurement_unit_code?;
|};

public type Temperature_Type record {|
   string code = "TMP";
   string TEMPERATURE_TYPE_CODE_QUALIFIER?;
   TEMPERATURE_SETTING_GType? TEMPERATURE_SETTING?;
|};

public type RANGE_GType record {|
   string Measurement_unit_code;
   int? Range_minimum_quantity?;
   int? Range_maximum_quantity?;
|};

public type Range_details_Type record {|
   string code = "RNG";
   string RANGE_TYPE_CODE_QUALIFIER?;
   RANGE_GType? RANGE?;
|};

public type Group_12_GType record {|
   Temperature_Type Temperature;
   Range_details_Type? Range_details?;
|};

public type Group_6_GType record {|
   Goods_item_details_Type Goods_item_details;
   Handling_instructions_Type[] Handling_instructions = [];
   Free_text_Type[] Free_text = [];
   Reference_Type[] Reference = [];
   Additional_product_id_Type[] Additional_product_id = [];
   Group_7_GType[] group_7 = [];
   Group_8_GType[] group_8 = [];
   Group_9_GType[] group_9 = [];
   Group_10_GType[] group_10 = [];
   Group_12_GType[] group_12 = [];
|};

public type EQUIPMENT_SIZE_AND_TYPE_GType record {|
   string Equipment_size_and_type_description_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
   string Equipment_size_and_type_description?;
|};

public type Equipment_details_Type record {|
   string code = "EQD";
   string EQUIPMENT_TYPE_CODE_QUALIFIER?;
   EQUIPMENT_IDENTIFICATION_GType? EQUIPMENT_IDENTIFICATION?;
   EQUIPMENT_SIZE_AND_TYPE_GType? EQUIPMENT_SIZE_AND_TYPE?;
   string EQUIPMENT_SUPPLIER_CODE?;
   string EQUIPMENT_STATUS_CODE?;
   string FULL_OR_EMPTY_INDICATOR_CODE?;
|};

public type NUMBER_OF_UNIT_DETAILS_GType record {|
   int? Units_quantity?;
   string Unit_type_code_qualifier?;
|};

public type Number_of_units_Type record {|
   string code = "EQN";
   NUMBER_OF_UNIT_DETAILS_GType? NUMBER_OF_UNIT_DETAILS?;
|};

public type SEAL_ISSUER_GType record {|
   string Sealing_party_name_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
   string Sealing_party_name?;
|};

public type IDENTITY_NUMBER_RANGE_GType record {|
   string Object_identifier;
   string Object_identifier_1?;
|};

public type Seal_number_Type record {|
   string code = "SEL";
   string TRANSPORT_UNIT_SEAL_IDENTIFIER?;
   SEAL_ISSUER_GType? SEAL_ISSUER?;
   string SEAL_CONDITION_CODE?;
   IDENTITY_NUMBER_RANGE_GType? IDENTITY_NUMBER_RANGE?;
|};

public type PERCENTAGE_DETAILS_GType record {|
   string Percentage_type_code_qualifier;
   int? Percentage?;
   string Percentage_basis_identification_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
|};

public type Percentage_details_Type record {|
   string code = "PCD";
   PERCENTAGE_DETAILS_GType? PERCENTAGE_DETAILS?;
   string STATUS_DESCRIPTION_CODE?;
|};

public type Group_14_GType record {|
   Temperature_Type Temperature;
   Range_details_Type? Range_details?;
   Seal_number_Type[] Seal_number = [];
   Free_text_Type[] Free_text = [];
   Percentage_details_Type[] Percentage_details = [];
|};

public type MONETARY_AMOUNT_GType record {|
   string Monetary_amount_type_code_qualifier;
   int? Monetary_amount?;
   string Currency_identification_code?;
   string Currency_type_code_qualifier?;
   string Status_description_code?;
|};

public type Monetary_amount_Type record {|
   string code = "MOA";
   MONETARY_AMOUNT_GType? MONETARY_AMOUNT?;
|};

public type GOVERNMENT_ACTION_GType record {|
   string Government_agency_identification_code?;
   string Government_involvement_code?;
   string Government_action_code?;
   string Government_procedure_code?;
|};

public type GOVERNMENT_ACTION_2_GType record {|
   string Government_agency_identification_code?;
   string Government_involvement_code?;
   string Government_action_code?;
   string Government_procedure_code?;
|};

public type GOVERNMENT_ACTION_3_GType record {|
   string Government_agency_identification_code?;
   string Government_involvement_code?;
   string Government_action_code?;
   string Government_procedure_code?;
|};

public type GOVERNMENT_ACTION_4_GType record {|
   string Government_agency_identification_code?;
   string Government_involvement_code?;
   string Government_action_code?;
   string Government_procedure_code?;
|};

public type Governmental_requirements_Type record {|
   string code = "GOR";
   string TRANSPORT_MOVEMENT_CODE?;
   GOVERNMENT_ACTION_GType? GOVERNMENT_ACTION?;
   GOVERNMENT_ACTION_2_GType? GOVERNMENT_ACTION_2?;
   GOVERNMENT_ACTION_3_GType? GOVERNMENT_ACTION_3?;
   GOVERNMENT_ACTION_4_GType? GOVERNMENT_ACTION_4?;
|};

public type Attached_equipment_Type record {|
   string code = "EQA";
   string EQUIPMENT_TYPE_CODE_QUALIFIER?;
   EQUIPMENT_IDENTIFICATION_GType? EQUIPMENT_IDENTIFICATION?;
|};

public type TYPE_OF_UNIT_COMPONENT_GType record {|
   string Unit_or_component_type_description_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
   string Unit_or_component_type_description?;
|};

public type COMPONENT_MATERIAL_GType record {|
   string Component_material_description_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
   string Component_material_description?;
|};

public type Component_details_Type record {|
   string code = "COD";
   TYPE_OF_UNIT_COMPONENT_GType? TYPE_OF_UNIT_COMPONENT?;
   COMPONENT_MATERIAL_GType? COMPONENT_MATERIAL?;
|};

public type Group_16_GType record {|
   Contact_information_Type Contact_information;
   Communication_contact_Type[] Communication_contact = [];
   Monetary_amount_Type[] Monetary_amount = [];
   Governmental_requirements_Type[] Governmental_requirements = [];
   Attached_equipment_Type? Attached_equipment?;
   Component_details_Type? Component_details?;
   Handling_instructions_Type[] Handling_instructions = [];
|};

public type Group_15_GType record {|
   Dangerous_goods_Type Dangerous_goods;
   Free_text_Type[] Free_text = [];
   Measurements_Type[] Measurements = [];
   Group_16_GType[] group_16 = [];
|};

public type TYPE_OF_DAMAGE_GType record {|
   string Damage_type_description_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
   string Damage_type_description?;
|};

public type DAMAGE_AREA_GType record {|
   string Damage_area_description_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
   string Damage_area_description?;
|};

public type DAMAGE_SEVERITY_GType record {|
   string Damage_severity_description_code?;
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
   string Damage_severity_description?;
|};

public type ACTION_GType record {|
   string Code_list_identification_code?;
   string Code_list_responsible_agency_code?;
|};

public type Damage_Type record {|
   string code = "DAM";
   string DAMAGE_DETAILS_CODE_QUALIFIER?;
   TYPE_OF_DAMAGE_GType? TYPE_OF_DAMAGE?;
   DAMAGE_AREA_GType? DAMAGE_AREA?;
   DAMAGE_SEVERITY_GType? DAMAGE_SEVERITY?;
   ACTION_GType? ACTION?;
|};

public type Group_17_GType record {|
   Damage_Type Damage;
   Component_details_Type? Component_details?;
|};

public type Group_19_GType record {|
   Place_location_identification_Type Place_location_identification;
   Date_time_period_Type[] Date_time_period = [];
|};

public type Group_18_GType record {|
   Transport_information_Type Transport_information;
   Date_time_period_Type[] Date_time_period = [];
   Group_19_GType[] group_19 = [];
|};

public type Group_20_GType record {|
   Name_and_address_Type Name_and_address;
   Date_time_period_Type? Date_time_period?;
   Contact_information_Type? Contact_information?;
   Communication_contact_Type? Communication_contact?;
   Reference_Type[] Reference = [];
|};

public type Group_13_GType record {|
   Equipment_details_Type Equipment_details;
   Reference_Type[] Reference = [];
   Number_of_units_Type? Number_of_units?;
   Transport_movement_details_Type[] Transport_movement_details = [];
   Date_time_period_Type[] Date_time_period = [];
   Transport_service_requirements_Type[] Transport_service_requirements = [];
   Place_location_identification_Type[] Place_location_identification = [];
   Measurements_Type[] Measurements = [];
   Dimensions_Type[] Dimensions = [];
   Group_14_GType[] group_14 = [];
   Group_15_GType[] group_15 = [];
   Group_17_GType[] group_17 = [];
   Group_18_GType[] group_18 = [];
   Group_20_GType[] group_20 = [];
|};

public type CONTROL_GType record {|
   string Control_total_type_code_qualifier;
   int Control_total_quantity;
   string Measurement_unit_code?;
|};

public type Control_total_Type record {|
   string code = "CNT";
   CONTROL_GType? CONTROL?;
|};

public type Message_trailer_Type record {|
   string code = "UNT";
   string number1?;
   string number2?;
|};

public type EDI_COPARN_COPARN record {|
   Message_header_Type Message_header;
   Beginning_of_message_Type Beginning_of_message;
   Transport_movement_details_Type? Transport_movement_details?;
   Date_time_period_Type[] Date_time_period = [];
   Transport_service_requirements_Type[] Transport_service_requirements = [];
   Free_text_Type[] Free_text = [];
   Place_location_identification_Type[] Place_location_identification = [];
   Group_1_GType[] group_1 = [];
   Group_2_GType[] group_2 = [];
   Group_4_GType[] group_4 = [];
   Group_6_GType[] group_6 = [];
   Group_13_GType[] group_13 = [];
   Control_total_Type? Control_total?;
   Message_trailer_Type Message_trailer;
|};



final readonly & json schemaJson = {"name":"EDI_COPARN_COPARN", "tag":"Root_mapping", "delimiters":{"segment":"'", "field":"+", "component":":", "subcomponent":"NOT_USED", "repetition":"*", "decimalSeparator":","}, "ignoreSegments":["UNB"], "preserveEmptyFields":true, "includeSegmentCode":true, "segments":[{"code":"UNH", "tag":"Message_header", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"message_reference_number", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"message_information", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"catagory", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"version", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"status", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"new_field", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"BGM", "tag":"Beginning_of_message", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DOCUMENT_MESSAGE_NAME", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Document_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Document_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"DOCUMENT_MESSAGE_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Document_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Version_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Revision_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"MESSAGE_FUNCTION_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"RESPONSE_TYPE_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"TMD", "tag":"Transport_movement_details", "truncatable":true, "minOccurances":0, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"MOVEMENT_TYPE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Movement_type_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Movement_type_description", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"EQUIPMENT_PLAN_DESCRIPTION", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"HAULAGE_ARRANGEMENTS_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"DTM", "tag":"Date_time_period", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DATE_TIME_PERIOD", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Date_or_time_or_period", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_or_time_or_period_text", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_or_time_or_period_format_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"TSR", "tag":"Transport_service_requirements", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"CONTRACT_AND_CARRIAGE_CONDITION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Contract_and_carriage_condition_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"SERVICE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Service_requirement_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Service_requirement_code_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code_4", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code_5", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"TRANSPORT_PRIORITY", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Transport_service_priority_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"NATURE_OF_CARGO", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Cargo_type_classification_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"FTX", "tag":"Free_text", "truncatable":true, "minOccurances":0, "maxOccurances":99, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"TEXT_SUBJECT_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"FREE_TEXT_FUNCTION_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"TEXT_REFERENCE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Free_text_description_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"TEXT_LITERAL", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Free_text", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Free_text_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Free_text_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Free_text_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Free_text_4", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"LANGUAGE_NAME_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"FREE_TEXT_FORMAT_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"LOC", "tag":"Place_location_identification", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"LOCATION_FUNCTION_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"LOCATION_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Location_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Location_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"RELATED_LOCATION_ONE_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"First_related_location_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"First_related_location_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"RELATED_LOCATION_TWO_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Second_related_location_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Second_related_location_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"RELATION_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"tag":"group_1", "minOccurances":0, "maxOccurances":9, "segments":[{"code":"RFF", "tag":"Reference", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"REFERENCE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Reference_code_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Reference_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Document_line_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Reference_version_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Revision_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"DTM", "tag":"Date_time_period", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DATE_TIME_PERIOD", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Date_or_time_or_period", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_or_time_or_period_text", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_or_time_or_period_format_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}]}, {"tag":"group_2", "minOccurances":0, "maxOccurances":9, "segments":[{"code":"TDT", "tag":"Transport_information", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"TRANSPORT_STAGE_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"MEANS_OF_TRANSPORT_JOURNEY_IDENTIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"MODE_OF_TRANSPORT", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Transport_mode_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Transport_mode_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"TRANSPORT_MEANS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Transport_means_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Transport_means_description", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"CARRIER", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Carrier_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Carrier_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"TRANSIT_DIRECTION_INDICATOR_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"EXCESS_TRANSPORTATION_INFORMATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Excess_transportation_reason_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Excess_transportation_responsibility_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Customer_shipment_authorisation_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"TRANSPORT_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Transport_means_identification_name_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Transport_means_identification_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Transport_means_nationality_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"TRANSPORT_MEANS_OWNERSHIP_INDICATOR_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"DTM", "tag":"Date_time_period", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DATE_TIME_PERIOD", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Date_or_time_or_period", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_or_time_or_period_text", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_or_time_or_period_format_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"RFF", "tag":"Reference", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"REFERENCE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Reference_code_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Reference_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Document_line_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Reference_version_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Revision_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"tag":"group_3", "minOccurances":0, "maxOccurances":9, "segments":[{"code":"LOC", "tag":"Place_location_identification", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"LOCATION_FUNCTION_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"LOCATION_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Location_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Location_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"RELATED_LOCATION_ONE_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"First_related_location_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"First_related_location_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"RELATED_LOCATION_TWO_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Second_related_location_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Second_related_location_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"RELATION_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"DTM", "tag":"Date_time_period", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DATE_TIME_PERIOD", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Date_or_time_or_period", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_or_time_or_period_text", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_or_time_or_period_format_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}]}]}, {"tag":"group_4", "minOccurances":1, "maxOccurances":9, "segments":[{"code":"NAD", "tag":"Name_and_address", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"PARTY_FUNCTION_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"PARTY_IDENTIFICATION_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Party_identifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"NAME_AND_ADDRESS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Name_and_address_description", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Name_and_address_description_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Name_and_address_description_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Name_and_address_description_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Name_and_address_description_4", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"PARTY_NAME", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Party_name", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_4", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_format_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"STREET", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Street_and_number_or_post_office_box_identifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Street_and_number_or_post_office_box_identifier_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Street_and_number_or_post_office_box_identifier_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Street_and_number_or_post_office_box_identifier_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"CITY_NAME", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"COUNTRY_SUB_ENTITY_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Country_sub_entity_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Country_sub_entity_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"POSTAL_IDENTIFICATION_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"COUNTRY_NAME_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"tag":"group_5", "minOccurances":0, "maxOccurances":9, "segments":[{"code":"CTA", "tag":"Contact_information", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"CONTACT_FUNCTION_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DEPARTMENT_OR_EMPLOYEE_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Department_or_employee_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Department_or_employee_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"COM", "tag":"Communication_contact", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"COMMUNICATION_CONTACT", "repeat":true, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Communication_address_identifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Communication_address_code_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"RFF", "tag":"Reference", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"REFERENCE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Reference_code_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Reference_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Document_line_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Reference_version_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Revision_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"DTM", "tag":"Date_time_period", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DATE_TIME_PERIOD", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Date_or_time_or_period", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_or_time_or_period_text", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_or_time_or_period_format_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}]}]}, {"tag":"group_6", "minOccurances":0, "maxOccurances":999, "segments":[{"code":"GID", "tag":"Goods_item_details", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"GOODS_ITEM_NUMBER", "repeat":false, "required":false, "truncatable":true, "dataType":"int", "startIndex":-1, "length":-1, "components":[]}, {"tag":"NUMBER_AND_TYPE_OF_PACKAGES", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Package_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Package_type_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Type_of_packages", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Packaging_related_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"NUMBER_AND_TYPE_OF_PACKAGES_2", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Package_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Package_type_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Type_of_packages", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Packaging_related_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"NUMBER_AND_TYPE_OF_PACKAGES_3", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Package_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Package_type_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Type_of_packages", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Packaging_related_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"NUMBER_AND_TYPE_OF_PACKAGES_4", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Package_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Package_type_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Type_of_packages", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Packaging_related_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"NUMBER_AND_TYPE_OF_PACKAGES_5", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Package_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Package_type_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Type_of_packages", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Packaging_related_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"HAN", "tag":"Handling_instructions", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"HANDLING_INSTRUCTIONS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Handling_instruction_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Handling_instruction_description", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"HAZARDOUS_MATERIAL", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Hazardous_material_category_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Hazardous_material_category_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"FTX", "tag":"Free_text", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"TEXT_SUBJECT_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"FREE_TEXT_FUNCTION_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"TEXT_REFERENCE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Free_text_description_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"TEXT_LITERAL", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Free_text", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Free_text_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Free_text_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Free_text_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Free_text_4", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"LANGUAGE_NAME_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"FREE_TEXT_FORMAT_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"RFF", "tag":"Reference", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"REFERENCE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Reference_code_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Reference_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Document_line_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Reference_version_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Revision_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"PIA", "tag":"Additional_product_id", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"PRODUCT_IDENTIFIER_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"ITEM_NUMBER_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Item_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Item_type_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"ITEM_NUMBER_IDENTIFICATION_2", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Item_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Item_type_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"ITEM_NUMBER_IDENTIFICATION_3", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Item_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Item_type_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"ITEM_NUMBER_IDENTIFICATION_4", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Item_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Item_type_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"ITEM_NUMBER_IDENTIFICATION_5", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Item_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Item_type_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"tag":"group_7", "minOccurances":0, "maxOccurances":99, "segments":[{"code":"NAD", "tag":"Name_and_address", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"PARTY_FUNCTION_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"PARTY_IDENTIFICATION_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Party_identifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"NAME_AND_ADDRESS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Name_and_address_description", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Name_and_address_description_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Name_and_address_description_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Name_and_address_description_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Name_and_address_description_4", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"PARTY_NAME", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Party_name", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_4", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_format_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"STREET", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Street_and_number_or_post_office_box_identifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Street_and_number_or_post_office_box_identifier_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Street_and_number_or_post_office_box_identifier_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Street_and_number_or_post_office_box_identifier_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"CITY_NAME", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"COUNTRY_SUB_ENTITY_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Country_sub_entity_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Country_sub_entity_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"POSTAL_IDENTIFICATION_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"COUNTRY_NAME_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"DTM", "tag":"Date_time_period", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DATE_TIME_PERIOD", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Date_or_time_or_period", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_or_time_or_period_text", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_or_time_or_period_format_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"RFF", "tag":"Reference", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"REFERENCE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Reference_code_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Reference_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Document_line_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Reference_version_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Revision_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"MEA", "tag":"Measurements", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"MEASUREMENT_PURPOSE_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"MEASUREMENT_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Measured_attribute_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measurement_significance_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Non_discrete_measurement_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Non_discrete_measurement_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"VALUE_RANGE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Measurement_unit_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measure", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Range_minimum_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Range_maximum_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Significant_digits_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}]}, {"tag":"SURFACE_OR_LAYER_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"DIM", "tag":"Dimensions", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DIMENSION_TYPE_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DIMENSIONS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Measurement_unit_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Length_measure", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Width_measure", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Height_measure", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}]}]}]}, {"tag":"group_8", "minOccurances":0, "maxOccurances":9, "segments":[{"code":"DOC", "tag":"Document_message_details", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DOCUMENT_MESSAGE_NAME", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Document_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Document_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"DOCUMENT_MESSAGE_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Document_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Document_status_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Document_source_description", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Language_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Version_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Revision_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"COMMUNICATION_MEDIUM_TYPE_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DOCUMENT_COPIES_REQUIRED_QUANTITY", "repeat":false, "required":false, "truncatable":true, "dataType":"int", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DOCUMENT_ORIGINALS_REQUIRED_QUANTITY", "repeat":false, "required":false, "truncatable":true, "dataType":"int", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"DTM", "tag":"Date_time_period", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DATE_TIME_PERIOD", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Date_or_time_or_period", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_or_time_or_period_text", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_or_time_or_period_format_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"LOC", "tag":"Place_location_identification", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"LOCATION_FUNCTION_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"LOCATION_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Location_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Location_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"RELATED_LOCATION_ONE_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"First_related_location_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"First_related_location_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"RELATED_LOCATION_TWO_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Second_related_location_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Second_related_location_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"RELATION_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}]}, {"tag":"group_9", "minOccurances":0, "maxOccurances":999, "segments":[{"code":"SGP", "tag":"Split_goods_placement", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"EQUIPMENT_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Equipment_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Country_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"PACKAGE_QUANTITY", "repeat":false, "required":false, "truncatable":true, "dataType":"int", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"MEA", "tag":"Measurements", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"MEASUREMENT_PURPOSE_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"MEASUREMENT_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Measured_attribute_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measurement_significance_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Non_discrete_measurement_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Non_discrete_measurement_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"VALUE_RANGE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Measurement_unit_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measure", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Range_minimum_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Range_maximum_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Significant_digits_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}]}, {"tag":"SURFACE_OR_LAYER_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}]}, {"tag":"group_10", "minOccurances":0, "maxOccurances":99, "segments":[{"code":"DGS", "tag":"Dangerous_goods", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DANGEROUS_GOODS_REGULATIONS_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"HAZARD_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Hazard_identification_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Additional_hazard_classification_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Hazard_code_version_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"UNDG_INFORMATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Dangerous_goods_flashpoint_description", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"DANGEROUS_GOODS_SHIPMENT_FLASHPOINT", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Shipment_flashpoint_degree", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measurement_unit_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"PACKAGING_DANGER_LEVEL_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"EMERGENCY_PROCEDURE_FOR_SHIPS_IDENTIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"HAZARD_MEDICAL_FIRST_AID_GUIDE_IDENTIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"TRANSPORT_EMERGENCY_CARD_IDENTIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"HAZARD_IDENTIFICATION_PLACARD_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Orange_hazard_placard_upper_part_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Orange_hazard_placard_lower_part_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"DANGEROUS_GOODS_LABEL", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Dangerous_goods_marking_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Dangerous_goods_marking_identifier_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Dangerous_goods_marking_identifier_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"PACKING_INSTRUCTION_TYPE_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"HAZARDOUS_MEANS_OF_TRANSPORT_CATEGORY_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"FTX", "tag":"Free_text", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"TEXT_SUBJECT_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"FREE_TEXT_FUNCTION_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"TEXT_REFERENCE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Free_text_description_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"TEXT_LITERAL", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Free_text", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Free_text_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Free_text_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Free_text_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Free_text_4", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"LANGUAGE_NAME_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"FREE_TEXT_FORMAT_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"MEA", "tag":"Measurements", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"MEASUREMENT_PURPOSE_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"MEASUREMENT_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Measured_attribute_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measurement_significance_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Non_discrete_measurement_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Non_discrete_measurement_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"VALUE_RANGE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Measurement_unit_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measure", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Range_minimum_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Range_maximum_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Significant_digits_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}]}, {"tag":"SURFACE_OR_LAYER_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"tag":"group_11", "minOccurances":0, "maxOccurances":9, "segments":[{"code":"CTA", "tag":"Contact_information", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"CONTACT_FUNCTION_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DEPARTMENT_OR_EMPLOYEE_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Department_or_employee_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Department_or_employee_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"COM", "tag":"Communication_contact", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"COMMUNICATION_CONTACT", "repeat":true, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Communication_address_identifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Communication_address_code_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}]}]}, {"tag":"group_12", "minOccurances":0, "maxOccurances":9, "segments":[{"code":"TMP", "tag":"Temperature", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"TEMPERATURE_TYPE_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"TEMPERATURE_SETTING", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Temperature_degree", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Measurement_unit_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"RNG", "tag":"Range_details", "truncatable":true, "minOccurances":0, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"RANGE_TYPE_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"RANGE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Measurement_unit_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Range_minimum_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Range_maximum_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}]}]}]}]}, {"tag":"group_13", "minOccurances":1, "maxOccurances":9999, "segments":[{"code":"EQD", "tag":"Equipment_details", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"EQUIPMENT_TYPE_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"EQUIPMENT_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Equipment_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Country_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"EQUIPMENT_SIZE_AND_TYPE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Equipment_size_and_type_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Equipment_size_and_type_description", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"EQUIPMENT_SUPPLIER_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"EQUIPMENT_STATUS_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"FULL_OR_EMPTY_INDICATOR_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"RFF", "tag":"Reference", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"REFERENCE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Reference_code_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Reference_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Document_line_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Reference_version_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Revision_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"EQN", "tag":"Number_of_units", "truncatable":true, "minOccurances":0, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"NUMBER_OF_UNIT_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Units_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Unit_type_code_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"TMD", "tag":"Transport_movement_details", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"MOVEMENT_TYPE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Movement_type_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Movement_type_description", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"EQUIPMENT_PLAN_DESCRIPTION", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"HAULAGE_ARRANGEMENTS_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"DTM", "tag":"Date_time_period", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DATE_TIME_PERIOD", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Date_or_time_or_period", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_or_time_or_period_text", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_or_time_or_period_format_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"TSR", "tag":"Transport_service_requirements", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"CONTRACT_AND_CARRIAGE_CONDITION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Contract_and_carriage_condition_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"SERVICE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Service_requirement_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Service_requirement_code_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code_4", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code_5", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"TRANSPORT_PRIORITY", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Transport_service_priority_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"NATURE_OF_CARGO", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Cargo_type_classification_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"LOC", "tag":"Place_location_identification", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"LOCATION_FUNCTION_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"LOCATION_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Location_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Location_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"RELATED_LOCATION_ONE_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"First_related_location_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"First_related_location_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"RELATED_LOCATION_TWO_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Second_related_location_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Second_related_location_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"RELATION_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"MEA", "tag":"Measurements", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"MEASUREMENT_PURPOSE_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"MEASUREMENT_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Measured_attribute_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measurement_significance_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Non_discrete_measurement_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Non_discrete_measurement_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"VALUE_RANGE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Measurement_unit_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measure", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Range_minimum_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Range_maximum_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Significant_digits_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}]}, {"tag":"SURFACE_OR_LAYER_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"DIM", "tag":"Dimensions", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DIMENSION_TYPE_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DIMENSIONS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Measurement_unit_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Length_measure", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Width_measure", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Height_measure", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}]}]}, {"tag":"group_14", "minOccurances":0, "maxOccurances":9, "segments":[{"code":"TMP", "tag":"Temperature", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"TEMPERATURE_TYPE_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"TEMPERATURE_SETTING", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Temperature_degree", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Measurement_unit_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"RNG", "tag":"Range_details", "truncatable":true, "minOccurances":0, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"RANGE_TYPE_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"RANGE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Measurement_unit_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Range_minimum_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Range_maximum_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}]}]}, {"code":"SEL", "tag":"Seal_number", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"TRANSPORT_UNIT_SEAL_IDENTIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"SEAL_ISSUER", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Sealing_party_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Sealing_party_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"SEAL_CONDITION_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"IDENTITY_NUMBER_RANGE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Object_identifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Object_identifier_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"FTX", "tag":"Free_text", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"TEXT_SUBJECT_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"FREE_TEXT_FUNCTION_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"TEXT_REFERENCE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Free_text_description_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"TEXT_LITERAL", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Free_text", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Free_text_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Free_text_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Free_text_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Free_text_4", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"LANGUAGE_NAME_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"FREE_TEXT_FORMAT_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"PCD", "tag":"Percentage_details", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"PERCENTAGE_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Percentage_type_code_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Percentage", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Percentage_basis_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"STATUS_DESCRIPTION_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}]}, {"tag":"group_15", "minOccurances":0, "maxOccurances":99, "segments":[{"code":"DGS", "tag":"Dangerous_goods", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DANGEROUS_GOODS_REGULATIONS_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"HAZARD_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Hazard_identification_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Additional_hazard_classification_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Hazard_code_version_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"UNDG_INFORMATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Dangerous_goods_flashpoint_description", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"DANGEROUS_GOODS_SHIPMENT_FLASHPOINT", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Shipment_flashpoint_degree", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measurement_unit_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"PACKAGING_DANGER_LEVEL_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"EMERGENCY_PROCEDURE_FOR_SHIPS_IDENTIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"HAZARD_MEDICAL_FIRST_AID_GUIDE_IDENTIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"TRANSPORT_EMERGENCY_CARD_IDENTIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"HAZARD_IDENTIFICATION_PLACARD_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Orange_hazard_placard_upper_part_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Orange_hazard_placard_lower_part_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"DANGEROUS_GOODS_LABEL", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Dangerous_goods_marking_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Dangerous_goods_marking_identifier_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Dangerous_goods_marking_identifier_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"PACKING_INSTRUCTION_TYPE_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"HAZARDOUS_MEANS_OF_TRANSPORT_CATEGORY_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"FTX", "tag":"Free_text", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"TEXT_SUBJECT_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"FREE_TEXT_FUNCTION_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"TEXT_REFERENCE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Free_text_description_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"TEXT_LITERAL", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Free_text", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Free_text_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Free_text_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Free_text_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Free_text_4", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"LANGUAGE_NAME_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"FREE_TEXT_FORMAT_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"MEA", "tag":"Measurements", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"MEASUREMENT_PURPOSE_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"MEASUREMENT_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Measured_attribute_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measurement_significance_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Non_discrete_measurement_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Non_discrete_measurement_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"VALUE_RANGE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Measurement_unit_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measure", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Range_minimum_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Range_maximum_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Significant_digits_quantity", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}]}, {"tag":"SURFACE_OR_LAYER_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"tag":"group_16", "minOccurances":0, "maxOccurances":9, "segments":[{"code":"CTA", "tag":"Contact_information", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"CONTACT_FUNCTION_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DEPARTMENT_OR_EMPLOYEE_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Department_or_employee_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Department_or_employee_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"COM", "tag":"Communication_contact", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"COMMUNICATION_CONTACT", "repeat":true, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Communication_address_identifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Communication_address_code_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"MOA", "tag":"Monetary_amount", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"MONETARY_AMOUNT", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Monetary_amount_type_code_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Monetary_amount", "required":false, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Currency_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Currency_type_code_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Status_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"GOR", "tag":"Governmental_requirements", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"TRANSPORT_MOVEMENT_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"GOVERNMENT_ACTION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Government_agency_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Government_involvement_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Government_action_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Government_procedure_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"GOVERNMENT_ACTION_2", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Government_agency_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Government_involvement_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Government_action_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Government_procedure_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"GOVERNMENT_ACTION_3", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Government_agency_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Government_involvement_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Government_action_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Government_procedure_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"GOVERNMENT_ACTION_4", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Government_agency_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Government_involvement_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Government_action_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Government_procedure_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"EQA", "tag":"Attached_equipment", "truncatable":true, "minOccurances":0, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"EQUIPMENT_TYPE_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"EQUIPMENT_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Equipment_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Country_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"COD", "tag":"Component_details", "truncatable":true, "minOccurances":0, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"TYPE_OF_UNIT_COMPONENT", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Unit_or_component_type_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Unit_or_component_type_description", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"COMPONENT_MATERIAL", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Component_material_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Component_material_description", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"HAN", "tag":"Handling_instructions", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"HANDLING_INSTRUCTIONS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Handling_instruction_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Handling_instruction_description", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"HAZARDOUS_MATERIAL", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Hazardous_material_category_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Hazardous_material_category_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}]}]}, {"tag":"group_17", "minOccurances":0, "maxOccurances":9, "segments":[{"code":"DAM", "tag":"Damage", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DAMAGE_DETAILS_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"TYPE_OF_DAMAGE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Damage_type_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Damage_type_description", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"DAMAGE_AREA", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Damage_area_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Damage_area_description", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"DAMAGE_SEVERITY", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Damage_severity_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Damage_severity_description", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"ACTION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"COD", "tag":"Component_details", "truncatable":true, "minOccurances":0, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"TYPE_OF_UNIT_COMPONENT", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Unit_or_component_type_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Unit_or_component_type_description", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"COMPONENT_MATERIAL", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Component_material_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Component_material_description", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}]}, {"tag":"group_18", "minOccurances":0, "maxOccurances":9, "segments":[{"code":"TDT", "tag":"Transport_information", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"TRANSPORT_STAGE_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"MEANS_OF_TRANSPORT_JOURNEY_IDENTIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"MODE_OF_TRANSPORT", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Transport_mode_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Transport_mode_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"TRANSPORT_MEANS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Transport_means_description_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Transport_means_description", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"CARRIER", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Carrier_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Carrier_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"TRANSIT_DIRECTION_INDICATOR_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"EXCESS_TRANSPORTATION_INFORMATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Excess_transportation_reason_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Excess_transportation_responsibility_code", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Customer_shipment_authorisation_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"TRANSPORT_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Transport_means_identification_name_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Transport_means_identification_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Transport_means_nationality_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"TRANSPORT_MEANS_OWNERSHIP_INDICATOR_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"DTM", "tag":"Date_time_period", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DATE_TIME_PERIOD", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Date_or_time_or_period", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_or_time_or_period_text", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_or_time_or_period_format_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"tag":"group_19", "minOccurances":0, "maxOccurances":9, "segments":[{"code":"LOC", "tag":"Place_location_identification", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"LOCATION_FUNCTION_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"LOCATION_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Location_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Location_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"RELATED_LOCATION_ONE_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"First_related_location_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"First_related_location_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"RELATED_LOCATION_TWO_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Second_related_location_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Second_related_location_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"RELATION_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"DTM", "tag":"Date_time_period", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DATE_TIME_PERIOD", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Date_or_time_or_period", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_or_time_or_period_text", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_or_time_or_period_format_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}]}]}, {"tag":"group_20", "minOccurances":0, "maxOccurances":9, "segments":[{"code":"NAD", "tag":"Name_and_address", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"PARTY_FUNCTION_CODE_QUALIFIER", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"PARTY_IDENTIFICATION_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Party_identifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"NAME_AND_ADDRESS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Name_and_address_description", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Name_and_address_description_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Name_and_address_description_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Name_and_address_description_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Name_and_address_description_4", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"PARTY_NAME", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Party_name", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_4", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_format_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"STREET", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Street_and_number_or_post_office_box_identifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Street_and_number_or_post_office_box_identifier_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Street_and_number_or_post_office_box_identifier_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Street_and_number_or_post_office_box_identifier_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"CITY_NAME", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"COUNTRY_SUB_ENTITY_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Country_sub_entity_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_identification_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Country_sub_entity_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"POSTAL_IDENTIFICATION_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"COUNTRY_NAME_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"DTM", "tag":"Date_time_period", "truncatable":true, "minOccurances":0, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DATE_TIME_PERIOD", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Date_or_time_or_period", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_or_time_or_period_text", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_or_time_or_period_format_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"CTA", "tag":"Contact_information", "truncatable":true, "minOccurances":0, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"CONTACT_FUNCTION_CODE", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DEPARTMENT_OR_EMPLOYEE_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Department_or_employee_name_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Department_or_employee_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"COM", "tag":"Communication_contact", "truncatable":true, "minOccurances":0, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"COMMUNICATION_CONTACT", "repeat":true, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Communication_address_identifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Communication_address_code_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"RFF", "tag":"Reference", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"REFERENCE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Reference_code_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Reference_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Document_line_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Reference_version_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Revision_identifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}]}]}, {"code":"CNT", "tag":"Control_total", "truncatable":true, "minOccurances":0, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"CONTROL", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Control_total_type_code_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Control_total_quantity", "required":true, "truncatable":true, "dataType":"int", "subcomponents":[]}, {"tag":"Measurement_unit_code", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"UNT", "tag":"Message_trailer", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"number1", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"number2", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}], "segmentDefinitions":{}};
    