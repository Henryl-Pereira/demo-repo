CREATE SCHEMA INGESTION_FRAMEWORK;

CREATE TABLE IF NOT EXISTS parameter COMMENT = 'Stores parameter information'
(
 parameter_id                  BIGINT        COMMENT 'Primary Key'
,paramater_name                VARCHAR()     COMMENT 'Paramater name'
,parameter_short_name          VARCHAR(12)   COMMENT 'Parameter short name'
,parameter_desc                VARCHAR()     COMMENT 'Parameter Long description'
,parameter_soft_delete_ind     BOOLEAN       COMMENT 'If true, record has been soft deleted, either because parameter is abandoned or superceded'
,parameter_sort_seq            BIGINT        COMMENT 'Used for sorting in displays'
-- metadata
,md_is_latest_ind              BOOLEAN       COMMENT 'True if latest record, false for all historical records'
,md_effective_from_date        DATE          COMMENT 'Date record effective from'
,md_effective_to_date          DATE          COMMENT 'Date record effective to.  If is latest then date = 2999-12-31'
,md_inserted_datetime          TIMESTAMP     COMMENT 'Datetime of when record created' 
,md_inserted_by                VARCHAR()     COMMENT 'Initials of user responsible for record being inserted'
,md_last_updated_datetime      TIMESTAMP     COMMENT 'Datetime of when record updated'
,md_last_updated_by            VARCHAR()     COMMENT 'Initials of user responsible for last update'
,md_reference                  VARCHAR()     COMMENT 'Additional reference information.  Example is change release number'
); 


CREATE TABLE IF NOT EXISTS pipeline COMMENT = 'Pipeline information for all parent and children pipelines'
(
 pipeline_id                  BIGINT        COMMENT 'Primary key for pipeline'
,pipeline_name                VARCHAR(125)  COMMENT 'Short name for pipeline'
,pipeline_description         VARCHAR()     COMMENT 'Extended description'
,pipeline_level               INT           COMMENT '1 = Master, 2 = Parent, 3 = Child'
,parent_pipeline_id           BIGINT        COMMENT 'Self joining foreign key which forms master/parent/child hierarchy.  If no parent value = -1'
,pipeline_active_ind          BOOLEAN       COMMENT 'If true, pipeline is considered active.  If false, will be ignored during run time.'
,pipeline_soft_delete_ind     BOOLEAN       COMMENT 'If true, record has been soft deleted, either because parameter is abandoned or superceded'
,pipeline_feature_flag        BOOLEAN       COMMENT 'If true, pipeline will run in debug mode'
-- metadata
,md_is_latest_ind             BOOLEAN       COMMENT 'True if latest record, false for all historical records'
,md_effective_from_date       DATE          COMMENT 'Date record effective from'
,md_effective_to_date         DATE          COMMENT 'Date record effective to.  If is latest then date = 2999-12-31'
,md_inserted_datetime         TIMESTAMP     COMMENT 'Datetime of when record created' 
,md_inserted_by               VARCHAR()     COMMENT 'Initials of user responsible for record being inserted'
,md_last_updated_datetime     TIMESTAMP     COMMENT 'Datetime of when record updated'
,md_last_updated_by           VARCHAR()     COMMENT 'Initials of user responsible for last update'
,md_reference                 VARCHAR()     COMMENT 'Additional reference information.  Example is change release number'
); 

CREATE TABLE IF NOT EXISTS pipeline_parameter COMMENT = 'Stores parameter values for pipeline/parameter combination'
(
 pipeline_id                            BIGINT        COMMENT 'Composite PK and FK for pipeline'
,parameter_id                           BIGINT        COMMENT 'Composite PK and FK for parameter'
,paramater_value                        VARCHAR()     COMMENT 'Paramater value for the combination of pipeline and parameter'
,pipeline_parameter_soft_delete_ind     BOOLEAN       COMMENT 'If true, record has been soft deleted, either because parameter is abandoned or superceded'
-- metadata
,md_is_latest_ind                       BOOLEAN       COMMENT 'True if latest record, false for all historical records'
,md_effective_from_date                 DATE          COMMENT 'Date record effective from'
,md_effective_to_date                   DATE          COMMENT 'Date record effective to.  If is latest then date = 2999-12-31'
,md_inserted_datetime                   TIMESTAMP     COMMENT 'Datetime of when record created' 
,md_inserted_by                         VARCHAR()     COMMENT 'Initials of user responsible for record being inserted'
,md_last_updated_datetime               TIMESTAMP     COMMENT 'Datetime of when record updated'
,md_last_updated_by                     VARCHAR()     COMMENT 'Initials of user responsible for last update'
,md_reference                           VARCHAR()     COMMENT 'Additional reference information.  Example is change release number'
); 

