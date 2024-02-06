USE SCHEMA INGESTION_FRAMEWORK;

CREATE TABLE IF NOT EXISTS tag_assignment COMMENT = 'Stores parameter values for pipeline/parameter combination'
(
 object_type                   VARCHAR()     COMMENT 'Composite PK. Type of object, valid values are "pipeline" or "parameter"'
,object_id                     BIGINT        COMMENT 'Composite PK and FK to either pipeline or parameter' 
,fwk_tag_name                  VARCHAR(24)   COMMENT 'Composite PK and FK to fwk_tag. Is the tag assigned to the object'
,fwk_tag_soft_delete_ind       BOOLEAN       COMMENT 'If true, record has been soft deleted, either because tag assignment is abandoned or superceded'
-- metadata
,md_inserted_datetime          TIMESTAMP     COMMENT 'Datetime of when record created' 
,md_inserted_by                VARCHAR()     COMMENT 'Initials of user responsible for record being inserted'
,md_last_updated_datetime      TIMESTAMP     COMMENT 'Datetime of when record updated'
,md_last_updated_by            VARCHAR()     COMMENT 'Initials of user responsible for last update'
,md_reference                  VARCHAR()     COMMENT 'Additional reference information.  Example is change release number'
); 
