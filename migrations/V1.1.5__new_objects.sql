USE SCHEMA INGESTION_FRAMEWORK;

CREATE TABLE IF NOT EXISTS framework_tag COMMENT = 'Stores framework tags. Tags are used against parameters and pipelines to tag types/categories as required'
(
 framework_tag_name             VARCHAR(24)   COMMENT 'Tag name and primary key'
,framework_tag_description      VARCHAR()     COMMENT 'Parameter short name'
,framework_tag_soft_delete_ind  BOOLEAN       COMMENT 'If true, record has been soft deleted, either because parameter is abandoned or superceded'
-- metadata
,md_inserted_datetime           TIMESTAMP     COMMENT 'Datetime of when record created' 
,md_inserted_by                 VARCHAR()     COMMENT 'Initials of user responsible for record being inserted'
,md_last_updated_datetime       TIMESTAMP     COMMENT 'Datetime of when record updated'
,md_last_updated_by             VARCHAR()     COMMENT 'Initials of user responsible for last update'
,md_reference                   VARCHAR()     COMMENT 'Additional reference information.  Example is change release number'
); 