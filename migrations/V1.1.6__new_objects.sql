CREATE SCHEMA trans_log;

USE SCHEMA trans_log;

CREATE OR REPLACE TABLE trans_activity
( trans_activity_id               BIGINT NOT NULL  COMMENT 'PK for transaction activity'
 ,trans_activity_name_short       VARCHAR(50)      COMMENT 'Transaction activity short name'
 ,trans_activity_name_medium      VARCHAR(255)      COMMENT 'Transaction activity short name'
 ,trans_activity_category         VARCHAR(20)      COMMENT 'Transaction activity category'
 ,trans_activity_description      VARCHAR()        COMMENT 'Transaction description, including what it does and why it does it.'
 ,trans_activity_sort_seq         INT              COMMENT 'Used for sorting in displays'
 ,trans_activity_soft_delete_ind  BOOLEAN          COMMENT 'If true, record has been soft deleted, either because parameter is abandoned or superceded'
-- metadata
,md_inserted_datetime          TIMESTAMP     COMMENT 'Datetime of when record created' 
,md_inserted_by                VARCHAR()     COMMENT 'Initials of user responsible for record being inserted'
,md_last_updated_datetime      TIMESTAMP     COMMENT 'Datetime of when record updated'
,md_last_updated_by            VARCHAR()     COMMENT 'Initials of user responsible for last update'
,md_reference                  VARCHAR()     COMMENT 'Additional reference information.  Example is change release number'
); 