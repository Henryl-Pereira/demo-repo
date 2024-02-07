
USE SCHEMA trans_log;

-- A code table
CREATE OR REPLACE TABLE trans_code COMMENT = 'Stores various transaction codes and rich text information that links to transaction log table'
(trans_code_id                 BIGINT NOT NULL      COMMENT 'Unique PK for record'
 ,trans_code                   VARCHAR(4) NOT NULL  COMMENT '4 Character code unique to code type'
 ,trans_code_type_code         VARCHAR(4) NOT NULL  COMMENT 'Type of code.  Examples include Status code, Completion Code'
 ,trans_code_name_short        VARCHAR(10) NOT NULL COMMENT 'Short name' 
 ,trans_code_name_medium       VARCHAR(255)         COMMENT 'Medium length name'
 ,trans_code_description       VARCHAR()            COMMENT 'Long description of code'
 ,trans_code_sort_seq          INT                  COMMENT 'Number used to sort on for display purposes if required'
 ,trans_code_soft_delete_ind   BOOLEAN              COMMENT 'If true, record has been soft deleted, either because parameter is abandoned or superceded'
-- metadata
,md_inserted_datetime          TIMESTAMP            COMMENT 'Datetime of when record created' 
,md_inserted_by                VARCHAR()            COMMENT 'Initials of user responsible for record being inserted'
,md_last_updated_datetime      TIMESTAMP            COMMENT 'Datetime of when record updated'
,md_last_updated_by            VARCHAR()            COMMENT 'Initials of user responsible for last update'
,md_reference                  VARCHAR()            COMMENT 'Additional reference information.  Example is change release number'
); 