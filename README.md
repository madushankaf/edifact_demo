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