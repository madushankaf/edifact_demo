# Ballerina EDI Tool Guide - PREREQUSITES

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

You can generate schemas automatically without writing them from scratch using the following command:

```bash
bal edi convertEdifactSchema -v d03a -t ORDERS -o output/schema.json
```

This command generates the schema for EDIFACT version D03A with message type ORDERS.

## 6. Code Generation

Once you have the schema of the EDI structure, generate the Ballerina records using:

```bash
bal edi codegen -i resources/schema.json -o modules/orders/records.bal
```

# Create a Package and push to Ballerina Package Repo

 cd edifact4qa
 bal pack
 bal push --repository local


This command takes the schema file as input and generates the corresponding Ballerina record definitions in the specified output file.


Runnung the service in WSO2 Integrator:BI

Pull created edficat package bal pull madushanka/edifact4qa:0.1.0 --repository local