if exists ( select *  from  sysobjects where name = 'REG_CERTIFICATE' and type = 'U')
drop table REG_CERTIFICATE ;
if exists ( select *  from  sysobjects where name = 'REG_SNAPSHOT' and type = 'U')
drop table REG_SNAPSHOT ;
if exists ( select *  from  sysobjects where name = 'REG_ASSOCIATION' and type = 'U')
drop table REG_ASSOCIATION ;
if exists ( select *  from  sysobjects where name = 'REG_CLUSTER_LOCK' and type = 'U')
drop table REG_CLUSTER_LOCK ;
if exists ( select *  from  sysobjects where name = 'REG_LOG' and type = 'U')
drop table REG_LOG ;
if exists ( select *  from  sysobjects where name = 'REG_RESOURCE' and type = 'U')
drop table REG_RESOURCE;
if exists ( select *  from  sysobjects where name = 'REG_RESOURCE_COMMENT' and type = 'U')
drop table REG_RESOURCE_COMMENT;
if exists ( select *  from  sysobjects where name = 'REG_RESOURCE_HISTORY' and type = 'U')
drop table REG_RESOURCE_HISTORY ;
if exists ( select *  from  sysobjects where name = 'REG_RESOURCE_PROPERTY' and type = 'U')
drop table REG_RESOURCE_PROPERTY ;
if exists ( select *  from  sysobjects where name = 'REG_PROPERTY' and type = 'U')
drop table REG_PROPERTY ;
if exists ( select *  from  sysobjects where name = 'REG_RESOURCE_RATING' and type = 'U')
drop table REG_RESOURCE_RATING ;
if exists ( select *  from  sysobjects where name = 'REG_RESOURCE_TAG' and type = 'U')
drop table REG_RESOURCE_TAG ;
if exists ( select *  from  sysobjects where name = 'REG_CONTENT' and type = 'U')
drop table REG_CONTENT;
if exists ( select *  from  sysobjects where name = 'REG_CONTENT_HISTORY' and type = 'U')
drop table REG_CONTENT_HISTORY ;
if exists ( select *  from  sysobjects where name = 'REG_PATH' and type = 'U')
drop table REG_PATH ;
if exists ( select *  from  sysobjects where name = 'REG_COMMENT' and type = 'U')
drop table REG_COMMENT ;
if exists ( select *  from  sysobjects where name = 'REG_RATING' and type = 'U')
drop table REG_RATING ;
if exists ( select *  from  sysobjects where name = 'UM_ROLE_PERMISSION' and type = 'U')
drop table UM_ROLE_PERMISSION ;
if exists ( select *  from  sysobjects where name = 'UM_TENANT' and type = 'U')
drop table UM_TENANT ;
if exists ( select *  from  sysobjects where name = 'UM_USER_ATTRIBUTE' and type = 'U')
drop table UM_USER_ATTRIBUTE ;
if exists ( select *  from  sysobjects where name = 'UM_USER_PERMISSION' and type = 'U')
drop table UM_USER_PERMISSION ;
if exists ( select *  from  sysobjects where name = 'UM_PERMISSION' and type = 'U')
drop table UM_PERMISSION ;
if exists ( select *  from  sysobjects where name = 'UM_USER_ROLE' and type = 'U')
drop table UM_USER_ROLE ;
if exists ( select *  from  sysobjects where name = 'UM_ROLE' and type = 'U')
drop table UM_ROLE ;
if exists ( select *  from  sysobjects where name = 'UM_USER' and type = 'U')
drop table UM_USER ;
if exists ( select *  from  sysobjects where name = 'REG_TAG' and type = 'U')
drop table REG_TAG ;
if exists ( select *  from  sysobjects where name = 'SAM_DEPLOY_INVOKE_LOG' and type = 'U')
drop table SAM_DEPLOY_INVOKE_LOG ;
if exists ( select *  from  sysobjects where name = 'SAM_DEPLOY_IP_LOG' and type = 'U')
drop table SAM_DEPLOY_IP_LOG ;
if exists ( select *  from  sysobjects where name = 'SAM_DEPLOY_DEF_LOG' and type = 'U')
drop table SAM_DEPLOY_DEF_LOG ;
if exists ( select *  from  sysobjects where name = 'SAM_DOMAIN' and type = 'U')
drop table SAM_DOMAIN;
if exists ( select *  from  sysobjects where name = 'SAM_APPSYSTEM' and type = 'U')
drop table SAM_APPSYSTEM;
if exists ( select *  from  sysobjects where name = 'SAM_SERVICE' and type = 'U')
drop table SAM_SERVICE;
if exists ( select *  from  sysobjects where name = 'SAM_OPERATION' and type = 'U')
drop table SAM_OPERATION;
if exists ( select *  from  sysobjects where name = 'sam_servicespecs_request' and type = 'U')
drop table sam_servicespecs_request;
if exists ( select *  from  sysobjects where name = 'SAM_PARAM' and type = 'U')
drop table SAM_PARAM;
if exists ( select *  from  sysobjects where name = 'SAM_APPSYSTEM_IP' and type = 'U')
drop table SAM_APPSYSTEM_IP;
if exists ( select *  from  sysobjects where name = 'SAM_SERVICE_USE' and type = 'U')
drop table SAM_SERVICE_USE;
if exists ( select *  from  sysobjects where name = 'ESB_DEPLOY' and type = 'U')
drop table ESB_DEPLOY;
if exists ( select *  from  sysobjects where name = 'ESB_SERVICE_CHANGELOG' and type = 'U')
drop table ESB_SERVICE_CHANGELOG;
if exists ( select *  from  sysobjects where name = 'SAM_OPERLOG' and type = 'U')
drop table SAM_OPERLOG;
if exists ( select *  from  sysobjects where name = 'SAM_FLOW_CONTROL' and type = 'U')
drop table SAM_FLOW_CONTROL;
if exists ( select *  from  sysobjects where name = 'SAM_FREQUENCY_CONTROL' and type = 'U')
drop table SAM_FREQUENCY_CONTROL;
if exists ( select *  from  sysobjects where name = 'SAM_SERVICE_TIMEOUT' and type = 'U')
drop table SAM_SERVICE_TIMEOUT;
if exists ( select *  from  sysobjects where name = 'SSM_SERVICE_STATISTICS' and type = 'U')
drop table SSM_SERVICE_STATISTICS ;
if exists ( select *  from  sysobjects where name = 'SSM_SERVICE_EXCEPTION' and type = 'U')
drop table SSM_SERVICE_EXCEPTION ;
if exists ( select *  from  sysobjects where name = 'SSM_SERVICE_TOP' and type = 'U')
drop table SSM_SERVICE_TOP ;
if exists ( select *  from  sysobjects where name = 'SSM_SERVICE_ALL' and type = 'U')
drop table SSM_SERVICE_ALL ;
if exists ( select *  from  sysobjects where name = 'SSM_SERVICE_MSG' and type = 'U')
drop table SSM_SERVICE_MSG ;
if exists ( select *  from  sysobjects where name = 'SAM_APPSYSTEM_BLACK_IP' and type = 'U')
DROP TABLE SAM_APPSYSTEM_BLACK_IP;
if exists ( select *  from  sysobjects where name = 'REG_SERVICE_TYPE' and type = 'U')
DROP TABLE REG_SERVICE_TYPE ;
if exists ( select *  from  sysobjects where name = 'REG_SERVICE_ROUTY' and type = 'U')
DROP TABLE REG_SERVICE_ROUTY ;
if exists ( select *  from  sysobjects where name = 'ESB_VERSION' and type = 'U')
DROP TABLE ESB_VERSION ;

if exists ( select *  from  sysobjects where name = 'SAM_ENDPOINT' and type = 'U')
DROP TABLE SAM_ENDPOINT ;
if exists ( select *  from  sysobjects where name = 'SAM_ENDPOINT_ROUTE' and type = 'U')
DROP TABLE SAM_ENDPOINT_ROUTE ;
if exists ( select *  from  sysobjects where name = 'SAM_MESSAGE_CONVERSION' and type = 'U')
DROP TABLE SAM_MESSAGE_CONVERSION ;
if exists ( select *  from  sysobjects where name = 'SAM_OPERATION_EXTEND' and type = 'U')
DROP TABLE SAM_OPERATION_EXTEND ;
if exists ( select *  from  sysobjects where name = 'SAM_SERVICE_ENDPOINT' and type = 'U')
DROP TABLE SAM_SERVICE_ENDPOINT ;
if exists ( select *  from  sysobjects where name = 'SAM_SERVICE_EXTEND' and type = 'U')
DROP TABLE SAM_SERVICE_EXTEND ;
if exists ( select *  from  sysobjects where name = 'SAM_WEBSERVICE_OPERATION' and type = 'U')
DROP TABLE SAM_WEBSERVICE_OPERATION ;
if exists ( select *  from  sysobjects where name = 'SAM_WEBSERVICE_PORT' and type = 'U')
DROP TABLE SAM_WEBSERVICE_PORT ;
if exists ( select *  from  sysobjects where name = 'SAM_WEBSERVICE_SERVICE' and type = 'U')
DROP TABLE SAM_WEBSERVICE_SERVICE ;
if exists ( select *  from  sysobjects where name = 'SAM_WSDL' and type = 'U')
DROP TABLE SAM_WSDL ;

if exists ( select *  from  sysobjects where name = 'sam_alarm' and type = 'U')
DROP TABLE sam_alarm ;
if exists ( select *  from  sysobjects where name = 'sam_passageway' and type = 'U')
DROP TABLE sam_passageway ;
if exists ( select *  from  sysobjects where name = 'reg_monitor_config' and type = 'U')
DROP TABLE reg_monitor_config ;
if exists ( select *  from  sysobjects where name = 'SAM_RESENDSTATUS' and type = 'U')
DROP TABLE SAM_RESENDSTATUS ;
if exists ( select *  from  sysobjects where name = 'ESB_ALARM' and type = 'U')
DROP TABLE ESB_ALARM ;

if exists ( select *  from  sysobjects where name = 'GOV_API_INFO' and type = 'U')
DROP TABLE GOV_API_INFO ;
if exists ( select *  from  sysobjects where name = 'SAM_SERVICE_OFFLINE' and type = 'U')
DROP TABLE SAM_SERVICE_OFFLINE ;
if exists ( select *  from  sysobjects where name = 'SAM_OPERATION_TOKEN' and type = 'U')
DROP TABLE SAM_OPERATION_TOKEN ;


if exists ( select *  from  sysobjects where name = 'SAM_OPERATION_TASK' and type = 'U')
DROP TABLE SAM_OPERATION_TASK ;
if exists ( select *  from  sysobjects where name = 'SAM_OPERATION_TASK_LOG' and type = 'U')
DROP TABLE SAM_OPERATION_TASK_LOG ;
if exists ( select *  from  sysobjects where name = 'SAM_DATASOURCE' and type = 'U')
DROP TABLE SAM_DATASOURCE ;
if exists ( select *  from  sysobjects where name = 'SAM_DATASERVICE_SPEC' and type = 'U')
DROP TABLE SAM_DATASERVICE_SPEC ;

if exists ( select *  from  sysobjects where name = 'GLOBAL_MONITOR_CONFIG' and type = 'U')
DROP TABLE GLOBAL_MONITOR_CONFIG;
if exists ( select *  from  sysobjects where name = 'SAM_PUBSUB_MESSAGEQUEUE' and type = 'U')
DROP TABLE SAM_PUBSUB_MESSAGEQUEUE;
if exists ( select *  from  sysobjects where name = 'SAM_PUBSUB_RECORD' and type = 'U')
DROP TABLE SAM_PUBSUB_RECORD;
if exists ( select *  from  sysobjects where name = 'SAM_PUBSUB_RELATION' and type = 'U')
DROP TABLE SAM_PUBSUB_RELATION;
if exists ( select *  from  sysobjects where name = 'SAM_PUBSUB_PUBLISHER' and type = 'U')
DROP TABLE SAM_PUBSUB_PUBLISHER;
if exists ( select *  from  sysobjects where name = 'QRTZ_FIRED_TRIGGERS' and type = 'U')
DROP TABLE QRTZ_FIRED_TRIGGERS;
if exists ( select *  from  sysobjects where name = 'QRTZ_PAUSED_TRIGGER_GRPS' and type = 'U')
DROP TABLE QRTZ_PAUSED_TRIGGER_GRPS;
if exists ( select *  from  sysobjects where name = 'QRTZ_SCHEDULER_STATE' and type = 'U')
DROP TABLE QRTZ_SCHEDULER_STATE;
if exists ( select *  from  sysobjects where name = 'QRTZ_LOCKS' and type = 'U')
DROP TABLE QRTZ_LOCKS;
if exists ( select *  from  sysobjects where name = 'QRTZ_SIMPLE_TRIGGERS' and type = 'U')
DROP TABLE QRTZ_SIMPLE_TRIGGERS;
if exists ( select *  from  sysobjects where name = 'QRTZ_SIMPROP_TRIGGERS' and type = 'U')
DROP TABLE QRTZ_SIMPROP_TRIGGERS;
if exists ( select *  from  sysobjects where name = 'QRTZ_CRON_TRIGGERS' and type = 'U')
DROP TABLE QRTZ_CRON_TRIGGERS;
if exists ( select *  from  sysobjects where name = 'QRTZ_BLOB_TRIGGERS' and type = 'U')
DROP TABLE QRTZ_BLOB_TRIGGERS;
if exists ( select *  from  sysobjects where name = 'QRTZ_TRIGGERS' and type = 'U')
DROP TABLE QRTZ_TRIGGERS;
if exists ( select *  from  sysobjects where name = 'QRTZ_JOB_DETAILS' and type = 'U')
DROP TABLE QRTZ_JOB_DETAILS;
if exists ( select *  from  sysobjects where name = 'QRTZ_CALENDARS' and type = 'U')
DROP TABLE QRTZ_CALENDARS;
if exists ( select *  from  sysobjects where name = 'ESB_AUDIT_LOG' and type = 'U')
DROP TABLE ESB_AUDIT_LOG;
if exists ( select *  from  sysobjects where name = 'SAM_PUBSUB_REPEAT' and type = 'U')
DROP TABLE SAM_PUBSUB_REPEAT;

CREATE TABLE GLOBAL_MONITOR_CONFIG (
   DICT_ID        bigint NOT NULL,
   CONFIG_GROUP   VARCHAR(128) DEFAULT NULL,
   KEY_CODE       VARCHAR(128) DEFAULT NULL,
   KEY_NAME       VARCHAR(128) DEFAULT NULL,
   KEY_VALUE      VARCHAR(1000) DEFAULT NULL,
   CONFIG_DESC    VARCHAR(255) DEFAULT NULL,
   MODIFIED_DATE  DATETIME      NULL,
   PRIMARY KEY (DICT_ID)
);
CREATE TABLE SAM_OPERATION_TASK_LOG (
  ID varchar(32) NOT NULL,
  JOB_NAME varchar(120) NOT NULL,
  JOB_GROUP varchar(255) DEFAULT NULL,
  SERVER_IP varchar(500)   NOT NULL,
  MONITOR_RESULT varchar(120) NOT NULL,
  MONITOR_MESSAGE text  ,
  MODIFIED_DATE datetime DEFAULT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE SAM_OPERATION_TASK (
  ID varchar(32) NOT NULL,
  REST_TYPE varchar(10) NOT NULL,
  JOB_NAME varchar(120) NOT NULL,
  JOB_GROUP varchar(120) NOT NULL,
  CRON_EXPRESSION varchar(120) DEFAULT NULL,
  MESSAGE varchar(120) DEFAULT NULL,
  URL varchar(500) NOT NULL,
  HEADER varchar(1000) DEFAULT NULL,
  BODY text  ,
  ALARM_ENABLE bit,
  STATUS int DEFAULT NULL,
  LIVE_SERVER varchar(2) DEFAULT NULL,
  PRIMARY KEY (ID)
);
CREATE TABLE QRTZ_JOB_DETAILS
(
    SCHED_NAME VARCHAR(120) NOT NULL,
    JOB_NAME  VARCHAR(200) NOT NULL,
    JOB_GROUP VARCHAR(200) NOT NULL,
    DESCRIPTION VARCHAR(250) NULL,
    JOB_CLASS_NAME   VARCHAR(250) NOT NULL,
    IS_DURABLE VARCHAR(1) NOT NULL,
    IS_NONCONCURRENT VARCHAR(1) NOT NULL,
    IS_UPDATE_DATA VARCHAR(1) NOT NULL,
    REQUESTS_RECOVERY VARCHAR(1) NOT NULL,
    JOB_DATA IMAGE NULL,
    PRIMARY KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
);

CREATE TABLE QRTZ_TRIGGERS
(
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    JOB_NAME  VARCHAR(200) NOT NULL,
    JOB_GROUP VARCHAR(200) NOT NULL,
    DESCRIPTION VARCHAR(250) NULL,
    NEXT_FIRE_TIME BIGINT NULL,
    PREV_FIRE_TIME BIGINT NULL,
    PRIORITY INTEGER NULL,
    TRIGGER_STATE VARCHAR(16) NOT NULL,
    TRIGGER_TYPE VARCHAR(8) NOT NULL,
    START_TIME BIGINT NOT NULL,
    END_TIME BIGINT NULL,
    CALENDAR_NAME VARCHAR(200) NULL,
    MISFIRE_INSTR SMALLINT NULL,
    JOB_DATA IMAGE NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
        REFERENCES QRTZ_JOB_DETAILS(SCHED_NAME,JOB_NAME,JOB_GROUP)
);

CREATE TABLE QRTZ_SIMPLE_TRIGGERS
(
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    REPEAT_COUNT BIGINT NOT NULL,
    REPEAT_INTERVAL BIGINT NOT NULL,
    TIMES_TRIGGERED BIGINT NOT NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE QRTZ_CRON_TRIGGERS
(
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    CRON_EXPRESSION VARCHAR(200) NOT NULL,
    TIME_ZONE_ID VARCHAR(80),
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE QRTZ_SIMPROP_TRIGGERS
(
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    STR_PROP_1 VARCHAR(512) NULL,
    STR_PROP_2 VARCHAR(512) NULL,
    STR_PROP_3 VARCHAR(512) NULL,
    INT_PROP_1 INT NULL,
    INT_PROP_2 INT NULL,
    LONG_PROP_1 BIGINT NULL,
    LONG_PROP_2 BIGINT NULL,
    DEC_PROP_1 NUMERIC(13,4) NULL,
    DEC_PROP_2 NUMERIC(13,4) NULL,
    BOOL_PROP_1 VARCHAR(1) NULL,
    BOOL_PROP_2 VARCHAR(1) NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE QRTZ_BLOB_TRIGGERS
(
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    TEXT_DATA IMAGE NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE QRTZ_CALENDARS
(
    SCHED_NAME VARCHAR(120) NOT NULL,
    CALENDAR_NAME  VARCHAR(200) NOT NULL,
    CALENDAR IMAGE NOT NULL,
    PRIMARY KEY (SCHED_NAME,CALENDAR_NAME)
);

CREATE TABLE QRTZ_PAUSED_TRIGGER_GRPS
(
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_GROUP  VARCHAR(200) NOT NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_GROUP)
);

CREATE TABLE QRTZ_FIRED_TRIGGERS
(
    SCHED_NAME VARCHAR(120) NOT NULL,
    ENTRY_ID VARCHAR(95) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    INSTANCE_NAME VARCHAR(200) NOT NULL,
    FIRED_TIME BIGINT NOT NULL,
    SCHED_TIME BIGINT NOT NULL,
    PRIORITY INTEGER NOT NULL,
    STATE VARCHAR(16) NOT NULL,
    JOB_NAME VARCHAR(200) NULL,
    JOB_GROUP VARCHAR(200) NULL,
    IS_NONCONCURRENT VARCHAR(1) NULL,
    REQUESTS_RECOVERY VARCHAR(1) NULL,
    PRIMARY KEY (SCHED_NAME,ENTRY_ID)
);

CREATE TABLE QRTZ_SCHEDULER_STATE
(
    SCHED_NAME VARCHAR(120) NOT NULL,
    INSTANCE_NAME VARCHAR(200) NOT NULL,
    LAST_CHECKIN_TIME BIGINT NOT NULL,
    CHECKIN_INTERVAL BIGINT NOT NULL,
    PRIMARY KEY (SCHED_NAME,INSTANCE_NAME)
);

CREATE TABLE QRTZ_LOCKS
(
    SCHED_NAME VARCHAR(120) NOT NULL,
    LOCK_NAME  VARCHAR(40) NOT NULL,
    PRIMARY KEY (SCHED_NAME,LOCK_NAME)
);
CREATE TABLE ESB_ALARM(
  ID            VARCHAR(32)  NOT NULL PRIMARY KEY,
  ESB_SERVER 	VARCHAR(255) NULL,
  ESB_SERVER_HOST 	VARCHAR(255) NULL,
  SYSTEM_CODE   VARCHAR(255) NULL,
  SERVICE_CODE	VARCHAR(255) NULL,
  OPERATION_CODE	VARCHAR(255) NULL,
  PASSAGEWAY_ID	VARCHAR(255) NULL,
  ALARM_OBJECT	VARCHAR(255) NULL,
  ALARM_TITLE	VARCHAR(255) NULL,
  DETAIL        TEXT NULL,
  ALARM_TIME    DATETIME NOT NULL,
  UPDATE_TIME	DATETIME NOT NULL,
  UPDATE_USER	VARCHAR(255) NULL,
  STATUS        VARCHAR(255) NULL
);

CREATE TABLE SAM_RESENDSTATUS (
  request_id VARCHAR(200) NOT NULL PRIMARY KEY,
  dest_operation_code VARCHAR(200) DEFAULT NULL,
  src_ip VARCHAR(200) DEFAULT NULL,
  src_app_code VARCHAR(200) DEFAULT NULL,
  request_time DATETIME DEFAULT NULL,
  resend_state INT DEFAULT 0
);

create table reg_monitor_config
(
    id                    varchar(128) not null
        primary key,
    monitor_trace         bit,
    cpu_alarm             bit,
    cpu_threshold         int,
    created_date          datetime2    not null,
    creator               varchar(255),
    custom_alarm          bit,
    custom_alarm_param    varchar(255),
    thread_pool_threshold int,
    thread_pool_alarm     bit,
    queue_threshold       int,
    queue_alarm           bit,
    alarm_interval        int,
    alarm_times           int,
    alarm_freq_enable     bit,
    mail                  varchar(2000),
    mail_alarm            bit,
    memory_alarm          bit,
    memory_threshold      int,
    modified_date         datetime2    not null,
    modifier              varchar(255),
    record_message        bit
);

CREATE TABLE sam_alarm (
  alarm_id varchar(32) PRIMARY KEY  NOT NULL,
  alarm_key varchar(50)  DEFAULT NULL,
  alarm_name varchar(100)  DEFAULT NULL,
  alarm_value varchar(2000)  DEFAULT NULL,
  is_enable varchar(10)  DEFAULT NULL,
  passageway_id varchar(32)  DEFAULT NULL,
  alarm_type varchar(20)  DEFAULT NULL,
  create_time DATETIME,
  create_user varchar(50)  DEFAULT NULL
);


CREATE TABLE sam_passageway(
  passageway_id varchar(32) PRIMARY KEY  NOT NULL,
  passageway_name varchar(100)  DEFAULT NULL,
  passageway_type varchar(20)  DEFAULT NULL,
  port VARCHAR(20) DEFAULT NULL,
  protocol varchar(30)  DEFAULT NULL,
  mq_ip varchar(60)  DEFAULT NULL,
  mq_port VARCHAR(20) DEFAULT NULL,
  certificate varchar(200)  DEFAULT NULL,
  is_alarm varchar(10)  DEFAULT NULL,
  careat_time DATETIME,
  create_user varchar(50)  DEFAULT NULL,
  user_name varchar(50)  DEFAULT NULL,
  password varchar(50)  DEFAULT NULL,
  ftp_ip varchar(50)  DEFAULT NULL,
  ftp_port VARCHAR(20) DEFAULT NULL
);


CREATE TABLE sam_endpoint (
  id varchar(32) DEFAULT NULL,
  business_protocol varchar(16) DEFAULT NULL,
  certificate_id varchar(32) DEFAULT NULL,
  business_service_ip varchar(128) DEFAULT NULL,
  business_service_port varchar(16) DEFAULT NULL,
  update_time DATETIME,
  update_user varchar(50) DEFAULT NULL
);

CREATE TABLE sam_endpoint_route (
  id varchar(32) NOT NULL,
  operation_code varchar(255) DEFAULT NULL,
  key_type varchar(32) DEFAULT NULL,
  key_code varchar(255) DEFAULT NULL,
  route_condition varchar(32) DEFAULT NULL,
  compute_result varchar(255) DEFAULT NULL,
  destination_ids varchar(2000) DEFAULT NULL,
  update_time DATETIME,
  update_user varchar(50) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE sam_message_conversion (
  id varchar(32) NOT NULL,
  operation_code varchar(255) DEFAULT NULL,
  key_type varchar(32) DEFAULT NULL,
  key_code varchar(255) DEFAULT NULL,
  new_key varchar(255) DEFAULT NULL,
  new_value text,
  is_variable INT DEFAULT NULL,
  direction INT DEFAULT NULL,
  sort_num int,
  update_time DATETIME,
  update_user varchar(50) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE sam_operation (
  OPERATION_CODE varchar(128) NOT NULL,
  SAM_SERVICE_CODE varchar(128) NOT NULL,
  OPERATION_NAME varchar(256) DEFAULT NULL,
  RELEASE_DATE DATETIME default current_timestamp ,
  OPERATION_DESC varchar(4000) DEFAULT NULL,
  OPERATION_STATUS char(1) DEFAULT NULL,
  S_AUDIT_STATUS char(1) DEFAULT NULL,
  D_AUDIT_STATUS char(1) DEFAULT NULL,
  SERVICE_STATUS2 varchar(1) DEFAULT '1',
  SERVICE_VALIDATE varchar(1) DEFAULT '1',
  SERVICE_VERSIONS varchar(200) DEFAULT NULL,
  LAST_MODIFY_DATE DATETIME,
  update_user varchar(16) DEFAULT NULL,
  operation_version varchar(32) DEFAULT NULL,
  SERVER_ADDR varchar(400) DEFAULT NULL,
  GROUP_ADDR varchar(400) DEFAULT NULL,
  GROUP_NAME varchar(200) DEFAULT NULL,
  PRIMARY KEY (OPERATION_CODE)
);

CREATE TABLE sam_servicespecs_request (
  OPERATION_CODE varchar(128)  NOT NULL,
  REQUEST_METHOD varchar(16) DEFAULT NULL ,
  REQUEST_URL varchar(512)  DEFAULT NULL,
  HEADER TEXT ,
  REQUEST_PARAM_INFO TEXT ,
  RESPONSE_PARAM_INFO TEXT ,
  REQUEST_INFO TEXT ,
  RESPONSE_INFO TEXT ,
  UPDATE_USER varchar(64)  DEFAULT NULL,
  UPDATE_TIME DATETIME,
  PRIMARY KEY (OPERATION_CODE)
);

CREATE TABLE sam_operation_extend (
  id varchar(32) NOT NULL,
  operation_code varchar(128) DEFAULT NULL,
  key_code varchar(128) DEFAULT NULL,
  key_name varchar(128) DEFAULT NULL,
  key_value varchar(255) DEFAULT NULL,
  update_time DATETIME,
  update_user varchar(50) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE sam_service (
  SERVICE_CODE varchar(128) NOT NULL,
  SERVICE_ID           varchar(32),
  APP_CODE varchar(128) DEFAULT NULL,
  SERVICE_NAME varchar(128) DEFAULT NULL,
  RELEASE_DATE datetime2,
  SERV_WSDL varchar(32) DEFAULT NULL,
  SERVICE_DESC varchar(4000) DEFAULT NULL,
  LAST_MODI_DATE datetime2,
  LAST_MODI_MAN varchar(128) DEFAULT NULL,
  SERVICE_STATUS char(1) DEFAULT NULL,
  SERVICE_OWNER varchar(32) DEFAULT NULL,
  owner_email varchar(1000) DEFAULT NULL,
  S_AUDIT_STATUS char(1) DEFAULT NULL,
  SERVICE_TYPE varchar(32) DEFAULT '1',
  DEPLOY_ID bigint DEFAULT NULL,
  DETECT_WSDL_URL varchar(300) DEFAULT NULL,
  DETECT_FLAG varchar(1) DEFAULT NULL,
  DETECT_CRON varchar(20) DEFAULT NULL,
  wsdl_path varchar(500) DEFAULT NULL,
  release_org varchar(128) DEFAULT NULL,
  service_version varchar(20) DEFAULT NULL,
  service_keyword varchar(128) DEFAULT NULL,
  verify_status char(1) DEFAULT NULL,
  dynamic_routing varchar(128) DEFAULT NULL,
  service_url varchar(300) DEFAULT NULL,
  verify_result varchar(300) DEFAULT NULL,
  apply_date datetime2,
  service_auth_type varchar(128) DEFAULT NULL,
  route_key varchar(128) DEFAULT NULL,
  channel_id varchar(128) DEFAULT NULL,
  cust_alarm        VARCHAR(255) DEFAULT NULL,
  cust_param        VARCHAR(255) DEFAULT NULL,
  is_alarm tinyint DEFAULT NULL,
  PRIMARY KEY (SERVICE_CODE)
);

CREATE TABLE sam_service_endpoint (
  service_code varchar(255) DEFAULT NULL,
  endpoint_id varchar(32) DEFAULT NULL,
  update_time DATETIME,
  update_user varchar(50) DEFAULT NULL
);

CREATE TABLE sam_service_extend (
  id varchar(32) NOT NULL,
  service_code varchar(128) DEFAULT NULL,
  key_code varchar(128) DEFAULT NULL,
  key_name varchar(128) DEFAULT NULL,
  key_value varchar(128) DEFAULT NULL,
  update_time DATETIME,
  update_user varchar(50) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE SAM_WEBSERVICE_OPERATION  (
   ID VARCHAR(32)  not null,
   WSDL_ID VARCHAR(128) ,
   PORT_ID VARCHAR(128) ,
   UPDATE_TIME DATETIME NOT NULL,
   UPDATE_USER VARCHAR(50) ,
   WS_URL VARCHAR(255) ,
   WS_OPERATION_NAME VARCHAR(255) ,
   primary key (ID)
);


CREATE TABLE SAM_WEBSERVICE_PORT  (
   ID VARCHAR(128)  not null,
   WSDL_ID VARCHAR(128) ,
   PORT_ID VARCHAR(128) ,
   SERVICE_ID VARCHAR(128) ,
   UPDATE_TIME  DATETIME NOT NULL,
   UPDATE_USER VARCHAR(50) ,
   WS_PORT_NAME VARCHAR(255) ,
   constraint PK_SAM_WEBSERVICE_PORT primary key (ID)
);


CREATE TABLE SAM_WEBSERVICE_SERVICE  (
   ID VARCHAR(128)  not null,
   WSDL_ID VARCHAR(32) ,
   SERVICE_ID VARCHAR(128) ,
   UPDATE_TIME DATETIME NOT NULL,
   UPDATE_USER VARCHAR(50) ,
   WS_SERVICE_NAME VARCHAR(255) ,
   primary key (ID)
);

CREATE TABLE sam_wsdl (
  id varchar(32) NOT NULL,
  content image,
  ws_url varchar(255) DEFAULT NULL,
  update_time DATETIME,
  update_user varchar(50) DEFAULT NULL,
  PRIMARY KEY (id)
);




create table reg_certificate
(
    id bigint not null
        primary key,
    content varbinary(MAX),
    created_date datetime2 not null,
    creator varchar(255),
    c_domain varchar(512),
    email varchar(512),
    encrypt_algorithm varchar(32) not null,
    encrypt_digit int not null,
    issuer varchar(512) not null,
    modified_date datetime2 not null,
    modifier varchar(255),
    name varchar(255) not null
        constraint UK_reg_certificate_name
        unique,
    password varchar(512) not null,
    serial_number varchar(128),
    signature_algorithm varchar(32) not null,
    source varchar(64) not null,
    status varchar(255) not null,
    subject varchar(512) not null,
    type varchar(32) not null,
    valid_end_date datetime2 not null,
    valid_start_date datetime2 not null
);

CREATE TABLE REG_CLUSTER_LOCK(
             REG_LOCK_NAME VARCHAR (20),
             REG_LOCK_STATUS VARCHAR (20),
             REG_LOCKED_TIME DATETIME,
             REG_TENANT_ID INTEGER DEFAULT 0,
             PRIMARY KEY (REG_LOCK_NAME)
);

CREATE TABLE REG_LOG(
             REG_LOG_ID INTEGER IDENTITY(1,1) ,
             REG_PATH VARCHAR (750),
             REG_USER_ID VARCHAR (31) NOT NULL,
             REG_LOGGED_TIME DATETIME NOT NULL,
             REG_ACTION INTEGER NOT NULL,
             REG_ACTION_DATA VARCHAR (500),
             REG_TENANT_ID INTEGER DEFAULT 0,
             PRIMARY KEY (REG_LOG_ID, REG_TENANT_ID)
);

CREATE TABLE  REG_PATH(
             REG_PATH_ID INTEGER IDENTITY(1,1),
             REG_PATH_VALUE VARCHAR(750) NOT NULL,
             REG_PATH_PARENT_ID INTEGER,
             REG_TENANT_ID INTEGER DEFAULT 0,
             CONSTRAINT PK_REG_PATH PRIMARY KEY(REG_PATH_ID, REG_TENANT_ID)
);

CREATE INDEX REG_PATH_IND_BY_PATH_VALUE ON REG_PATH(REG_PATH_VALUE, REG_TENANT_ID);
CREATE INDEX REG_PATH_IND_BY_PATH_PARENT_ID ON REG_PATH(REG_PATH_PARENT_ID, REG_TENANT_ID);

CREATE TABLE REG_CONTENT(
             REG_CONTENT_ID INTEGER IDENTITY(1,1),
             REG_CONTENT_DATA VARBINARY(MAX),
             REG_TENANT_ID INTEGER DEFAULT 0,
             CONSTRAINT PK_REG_CONTENT PRIMARY KEY(REG_CONTENT_ID, REG_TENANT_ID)
);

CREATE TABLE REG_CONTENT_HISTORY(
             REG_CONTENT_ID INTEGER NOT NULL,
             REG_CONTENT_DATA VARBINARY(MAX),
             REG_DELETED   SMALLINT,
             REG_TENANT_ID INTEGER DEFAULT 0,
             CONSTRAINT PK_REG_CONTENT_HISTORY PRIMARY KEY(REG_CONTENT_ID, REG_TENANT_ID)
);

CREATE TABLE REG_RESOURCE(
            REG_PATH_ID         INTEGER NOT NULL,
            REG_NAME            VARCHAR(256),
            REG_VERSION         INTEGER IDENTITY(1,1),
            REG_MEDIA_TYPE      VARCHAR(500),
            REG_CREATOR         VARCHAR(31) NOT NULL,
            REG_CREATED_TIME    DATETIME NOT NULL,
            REG_LAST_UPDATOR    VARCHAR(31),
            REG_LAST_UPDATED_TIME    DATETIME NOT NULL,
            REG_DESCRIPTION     VARCHAR(1000),
            REG_CONTENT_ID      INTEGER,
            REG_TENANT_ID INTEGER DEFAULT 0,
            CONSTRAINT PK_REG_RESOURCE PRIMARY KEY(REG_VERSION, REG_TENANT_ID)
);

ALTER TABLE REG_RESOURCE ADD CONSTRAINT REG_RESOURCE_FK_BY_PATH_ID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);
ALTER TABLE REG_RESOURCE ADD CONSTRAINT REG_RESOURCE_FK_BY_CONTENT_ID FOREIGN KEY (REG_CONTENT_ID, REG_TENANT_ID) REFERENCES REG_CONTENT (REG_CONTENT_ID, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_IND_BY_NAME ON REG_RESOURCE(REG_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_IND_BY_PATH_ID_NAME ON REG_RESOURCE(REG_PATH_ID, REG_NAME, REG_TENANT_ID);

CREATE TABLE REG_RESOURCE_HISTORY(
            REG_PATH_ID         INTEGER NOT NULL,
            REG_NAME            VARCHAR(256),
            REG_VERSION         INTEGER NOT NULL,
            REG_MEDIA_TYPE      VARCHAR(500),
            REG_CREATOR         VARCHAR(31) NOT NULL,
            REG_CREATED_TIME    DATETIME NOT NULL,
            REG_LAST_UPDATOR    VARCHAR(31),
            REG_LAST_UPDATED_TIME    DATETIME NOT NULL,
            REG_DESCRIPTION     VARCHAR(1000),
            REG_CONTENT_ID      INTEGER,
            REG_DELETED         SMALLINT,
            REG_TENANT_ID INTEGER DEFAULT 0,
            CONSTRAINT PK_REG_RESOURCE_HISTORY PRIMARY KEY(REG_VERSION, REG_TENANT_ID)
);

ALTER TABLE REG_RESOURCE_HISTORY ADD CONSTRAINT REG_RESOURCE_HIST_FK_BY_PATHID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);
ALTER TABLE REG_RESOURCE_HISTORY ADD CONSTRAINT REG_RESOURCE_HIST_FK_BY_CONTENT_ID FOREIGN KEY (REG_CONTENT_ID, REG_TENANT_ID) REFERENCES REG_CONTENT_HISTORY (REG_CONTENT_ID, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_HISTORY_IND_BY_NAME ON REG_RESOURCE_HISTORY(REG_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_HISTORY_IND_BY_PATH_ID_NAME ON REG_RESOURCE(REG_PATH_ID, REG_NAME, REG_TENANT_ID);

CREATE TABLE REG_COMMENT(
            REG_ID        INTEGER IDENTITY(1,1),
            REG_COMMENT_TEXT      VARCHAR(500) NOT NULL,
            REG_USER_ID           VARCHAR(31) NOT NULL,
            REG_COMMENTED_TIME    DATETIME NOT NULL,
            REG_TENANT_ID INTEGER DEFAULT 0,
            CONSTRAINT PK_REG_COMMENT PRIMARY KEY(REG_ID, REG_TENANT_ID)
);

CREATE TABLE REG_RESOURCE_COMMENT(
            REG_COMMENT_ID          INTEGER NOT NULL,
            REG_VERSION             INTEGER,
            REG_PATH_ID             INTEGER,
            REG_RESOURCE_NAME       VARCHAR(256),
            REG_TENANT_ID INTEGER DEFAULT 0
);

ALTER TABLE REG_RESOURCE_COMMENT ADD CONSTRAINT REG_RESOURCE_COMMENT_FK_BY_PATH_ID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);
ALTER TABLE REG_RESOURCE_COMMENT ADD CONSTRAINT REG_RESOURCE_COMMENT_FK_BY_COMMENT_ID FOREIGN KEY (REG_COMMENT_ID, REG_TENANT_ID) REFERENCES REG_COMMENT (REG_ID, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_COMMENT_IND_BY_PATH_ID_AND_RESOURCE_NAME ON REG_RESOURCE_COMMENT(REG_PATH_ID, REG_RESOURCE_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_COMMENT_IND_BY_VERSION ON REG_RESOURCE_COMMENT(REG_VERSION, REG_TENANT_ID);

CREATE TABLE REG_RATING(
            REG_ID     INTEGER IDENTITY(1,1),
            REG_RATING        INTEGER NOT NULL,
            REG_USER_ID       VARCHAR(31) NOT NULL,
            REG_RATED_TIME    DATETIME NOT NULL,
            REG_TENANT_ID INTEGER DEFAULT 0,
            CONSTRAINT PK_REG_RATING PRIMARY KEY(REG_ID, REG_TENANT_ID)
);

CREATE TABLE REG_RESOURCE_RATING(
            REG_RATING_ID           INTEGER NOT NULL,
            REG_VERSION             INTEGER,
            REG_PATH_ID             INTEGER,
            REG_RESOURCE_NAME       VARCHAR(256),
            REG_TENANT_ID INTEGER DEFAULT 0
);

ALTER TABLE REG_RESOURCE_RATING ADD CONSTRAINT REG_RESOURCE_RATING_FK_BY_PATH_ID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);
ALTER TABLE REG_RESOURCE_RATING ADD CONSTRAINT REG_RESOURCE_RATING_FK_BY_RATING_ID FOREIGN KEY (REG_RATING_ID, REG_TENANT_ID) REFERENCES REG_RATING (REG_ID, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_RATING_IND_BY_PATH_ID_AND_RESOURCE_NAME ON REG_RESOURCE_RATING(REG_PATH_ID, REG_RESOURCE_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_RATING_IND_BY_VERSION ON REG_RESOURCE_RATING(REG_VERSION, REG_TENANT_ID);


CREATE TABLE REG_TAG(
            REG_ID         INTEGER IDENTITY(1,1),
            REG_TAG_NAME       VARCHAR(500) NOT NULL,
            REG_USER_ID        VARCHAR(31) NOT NULL,
            REG_TAGGED_TIME    DATETIME NOT NULL,
            REG_TENANT_ID INTEGER DEFAULT 0,
            CONSTRAINT PK_REG_TAG PRIMARY KEY(REG_ID, REG_TENANT_ID)
);

CREATE TABLE REG_RESOURCE_TAG(
            REG_TAG_ID              INTEGER NOT NULL,
            REG_VERSION             INTEGER,
            REG_PATH_ID             INTEGER,
            REG_RESOURCE_NAME       VARCHAR(256),
            REG_TENANT_ID INTEGER DEFAULT 0
);

ALTER TABLE REG_RESOURCE_TAG ADD CONSTRAINT REG_RESOURCE_TAG_FK_BY_PATH_ID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);
ALTER TABLE REG_RESOURCE_TAG ADD CONSTRAINT REG_RESOURCE_TAG_FK_BY_TAG_ID FOREIGN KEY (REG_TAG_ID, REG_TENANT_ID) REFERENCES REG_TAG (REG_ID, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_TAG_IND_BY_PATH_ID_AND_RESOURCE_NAME ON REG_RESOURCE_TAG(REG_PATH_ID, REG_RESOURCE_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_TAG_IND_BY_VERSION ON REG_RESOURCE_TAG(REG_VERSION, REG_TENANT_ID);

CREATE TABLE REG_PROPERTY(
            REG_ID         INTEGER IDENTITY(1,1),
            REG_NAME       VARCHAR(100) NOT NULL,
            REG_VALUE        VARCHAR(1000),
            REG_TENANT_ID INTEGER DEFAULT 0,
            CONSTRAINT PK_REG_PROPERTY PRIMARY KEY(REG_ID, REG_TENANT_ID)
);

CREATE TABLE REG_RESOURCE_PROPERTY(
            REG_PROPERTY_ID         INTEGER NOT NULL,
            REG_VERSION             INTEGER,
            REG_PATH_ID             INTEGER,
            REG_RESOURCE_NAME       VARCHAR(256),
            REG_TENANT_ID INTEGER DEFAULT 0
);

ALTER TABLE REG_RESOURCE_PROPERTY ADD CONSTRAINT REG_RESOURCE_PROPERTY_FK_BY_PATH_ID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);
ALTER TABLE REG_RESOURCE_PROPERTY ADD CONSTRAINT REG_RESOURCE_PROPERTY_FK_BY_TAG_ID FOREIGN KEY (REG_PROPERTY_ID, REG_TENANT_ID) REFERENCES REG_PROPERTY (REG_ID, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_PROPERTY_IND_BY_PATH_ID_AND_RESOURCE_NAME ON REG_RESOURCE_PROPERTY(REG_PATH_ID, REG_RESOURCE_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_PROPERTY_IND_BY_VERSION ON REG_RESOURCE_PROPERTY(REG_VERSION, REG_TENANT_ID);

CREATE TABLE REG_ASSOCIATION(
            REG_ASSOCIATION_ID INTEGER IDENTITY(1,1),
            REG_SOURCEPATH VARCHAR (750) NOT NULL,
            REG_TARGETPATH VARCHAR (750) NOT NULL,
            REG_ASSOCIATION_TYPE VARCHAR (2000) NOT NULL,
            REG_TENANT_ID INTEGER DEFAULT 0,
            PRIMARY KEY (REG_ASSOCIATION_ID, REG_TENANT_ID)
);

CREATE TABLE REG_SNAPSHOT(
            REG_SNAPSHOT_ID     INTEGER IDENTITY(1,1),
            REG_PATH_ID            INTEGER NOT NULL,
            REG_RESOURCE_NAME      VARCHAR(255),
            REG_RESOURCE_VIDS     VARBINARY(MAX) NOT NULL,
            REG_TENANT_ID INTEGER DEFAULT 0,
            CONSTRAINT PK_REG_SNAPSHOT PRIMARY KEY(REG_SNAPSHOT_ID, REG_TENANT_ID)
);

CREATE INDEX REG_SNAPSHOT_IND_BY_PATH_ID_AND_RESOURCE_NAME ON REG_SNAPSHOT(REG_PATH_ID, REG_RESOURCE_NAME, REG_TENANT_ID);

ALTER TABLE REG_SNAPSHOT ADD CONSTRAINT REG_SNAPSHOT_FK_BY_PATH_ID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);

CREATE TABLE UM_TENANT (
			UM_ID INTEGER IDENTITY(1,1),
	    UM_DOMAIN_NAME VARCHAR(255) NOT NULL,
            UM_EMAIL VARCHAR(255),
            UM_ACTIVE BIT DEFAULT ('0'),
			PRIMARY KEY (UM_ID),
			UNIQUE(UM_DOMAIN_NAME));

CREATE TABLE UM_USER (
             UM_ID INTEGER IDENTITY(1,1),
             UM_USER_NAME VARCHAR(255) NOT NULL,
             UM_USER_PASSWORD VARCHAR(255) NOT NULL,
             UM_SALT_VALUE VARCHAR(32),
             UM_REQUIRE_CHANGE BIT DEFAULT ('0'),
             UM_CHANGED_TIME DATETIME NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0,
             PRIMARY KEY (UM_ID, UM_TENANT_ID),
             UNIQUE(UM_USER_NAME, UM_TENANT_ID)
);

CREATE TABLE UM_ROLE (
             UM_ID INTEGER IDENTITY(1,1),
             UM_ROLE_NAME VARCHAR(255) NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0,
             PRIMARY KEY (UM_ID, UM_TENANT_ID),
             UNIQUE(UM_ROLE_NAME, UM_TENANT_ID)
);

CREATE TABLE UM_PERMISSION (
             UM_ID INTEGER IDENTITY(1,1),
             UM_RESOURCE_ID VARCHAR(255) NOT NULL,
             UM_ACTION VARCHAR(255) NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0,
             PRIMARY KEY (UM_ID, UM_TENANT_ID)
);

CREATE INDEX INDEX_UM_PERMISSION_UM_RESOURCE_ID_UM_ACTION
                    ON UM_PERMISSION (UM_RESOURCE_ID, UM_ACTION, UM_TENANT_ID);

CREATE TABLE UM_ROLE_PERMISSION (
             UM_ID INTEGER IDENTITY(1,1),
             UM_PERMISSION_ID INTEGER NOT NULL,
             UM_ROLE_NAME VARCHAR(255) NOT NULL,
             UM_IS_ALLOWED SMALLINT NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0,
             FOREIGN KEY (UM_PERMISSION_ID, UM_TENANT_ID) REFERENCES UM_PERMISSION(UM_ID, UM_TENANT_ID),
             PRIMARY KEY (UM_ID, UM_TENANT_ID)
);

CREATE TABLE UM_USER_PERMISSION (
             UM_ID INTEGER IDENTITY(1,1),
             UM_PERMISSION_ID INTEGER NOT NULL,
             UM_USER_NAME VARCHAR(255) NOT NULL,
             UM_IS_ALLOWED SMALLINT NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0,
             FOREIGN KEY (UM_PERMISSION_ID, UM_TENANT_ID) REFERENCES UM_PERMISSION(UM_ID, UM_TENANT_ID),
             PRIMARY KEY (UM_ID, UM_TENANT_ID)
);

CREATE TABLE UM_USER_ROLE (
             UM_ID INTEGER IDENTITY(1,1),
             UM_ROLE_ID INTEGER NOT NULL,
             UM_USER_ID INTEGER NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0,
             UNIQUE (UM_USER_ID, UM_ROLE_ID, UM_TENANT_ID),
             FOREIGN KEY (UM_ROLE_ID, UM_TENANT_ID) REFERENCES UM_ROLE(UM_ID, UM_TENANT_ID),
             FOREIGN KEY (UM_USER_ID, UM_TENANT_ID) REFERENCES UM_USER(UM_ID, UM_TENANT_ID),
             PRIMARY KEY (UM_ID, UM_TENANT_ID)
);


CREATE TABLE UM_USER_ATTRIBUTE (
            UM_ID INTEGER IDENTITY(1,1),
            UM_ATTR_NAME VARCHAR(255) NOT NULL,
            UM_ATTR_VALUE VARCHAR(1024),
            UM_PROFILE_ID VARCHAR(255),
            UM_USER_ID INTEGER,
            UM_TENANT_ID INTEGER DEFAULT 0,
            FOREIGN KEY (UM_USER_ID, UM_TENANT_ID) REFERENCES UM_USER(UM_ID, UM_TENANT_ID),
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
);




CREATE TABLE SAM_DEPLOY_INVOKE_LOG  (
  USER_ID         VARCHAR(128) NOT NULL,
  DEPLOY_TIME     DATETIME NOT NULL,
  CLIENT_ID       VARCHAR(255) NOT NULL,
  OPERATION_CODE  VARCHAR(255) NOT NULL,
  DEPLOY_TYPE     VARCHAR(25) NOT NULL
);

CREATE TABLE SAM_DEPLOY_IP_LOG  (
  USER_ID     VARCHAR(128) NOT NULL,
  DEPLOY_TIME DATETIME NOT NULL,
  APP_ID      VARCHAR(255) NOT NULL,
  APP_IP      VARCHAR(32) NOT NULL,
  DEPLOY_TYPE VARCHAR(25) NOT NULL
);

CREATE TABLE SAM_DEPLOY_DEF_LOG  (
  USER_ID         VARCHAR(128) NOT NULL,
  DEPLOY_TIME     DATETIME NOT NULL,
  OPERATION_CODE  VARCHAR(255) NOT NULL,
  DEPLOY_TYPE     VARCHAR(25) NOT NULL
);

create table SAM_DOMAIN  (
   DOMAIN_CODE          VARCHAR(32)                    not null,
   DOMAIN_NAME          VARCHAR(256),
   DOMAIN_DESC          VARCHAR(4000),
   constraINT PK_SAM_DOMAIN primary key (DOMAIN_CODE)
);

create table SAM_APPSYSTEM  (
   APP_CODE             VARCHAR(128)                   not null,
   DOMAIN_CODE          VARCHAR(32),
   APP_NAME             VARCHAR(128),
   APP_OWNER            VARCHAR(32),
   APP_START            DATE,
   APP_STATUS           CHAR,
   APP_DESC             VARCHAR(4000),
   PARENT_CODE VARCHAR(128) NULL  ,
   CATALOG_SEQ VARCHAR(512) NULL  ,
   SORT_NO INT NULL,
   APP_LOGIN_CODE  VARCHAR(32)  NULL,
   APP_LOGIN_PASSWORD  VARCHAR(32)  NULL,
   constraINT PK_SAM_APPSYSTEM primary key (APP_CODE)
);

create table SAM_PARAM  (
   PARAM_ID             VARCHAR(128)                    not null,
   PARENT_PARAM_ID      VARCHAR(128),
   OPERATION_CODE       VARCHAR(128),
   PARAM_CODE           VARCHAR(128),
   PARAM_NAME           VARCHAR(256),
   PARAM_TYPE           VARCHAR(64),
   PARAM_ORDER          INT,
   IN_OUT               CHAR,
   PARAM_DESC           VARCHAR(4000),
   REQUIRED     CHAR,
   constraINT PK_SAM_PARAM primary key (PARAM_ID)
);

CREATE TABLE    SAM_APPSYSTEM_IP    (
        APP_CODE       VARCHAR(128)    NOT NULL,
        APP_IP         VARCHAR(128)     NOT NULL,
		SERVER_ADDR VARCHAR(4000) NOT NULL,
        constraINT PK_SAM_APPSYSTEM_IP primary key (APP_CODE,APP_IP)
    );

CREATE TABLE SAM_SERVICE_USE  (
   SRC_APP_CODE         VARCHAR(128)                   NOT NULL,
   DEST_OPERATION_CODE  VARCHAR(128)                   NOT NULL,
   RELEASE_DATE         DATETIME           DEFAULT current_timestamp,
   LAST_MODI_DATE       DATETIME,
   LAST_MODI_USER       VARCHAR(128),
   CONSTRAINT PK_SAM_SERVICE_USE PRIMARY KEY (SRC_APP_CODE, DEST_OPERATION_CODE)
);

create table ESB_DEPLOY  (
   DEPLOY_ID            BIGINT                      not null,
   DEPLOY_DATE          DATETIME                            not null,
   SERV_CHANGETYPE      VARCHAR(8),
   DEPLOY_DESC          VARCHAR(1024),
   DEPLOY_FILE          VARBINARY(MAX),
   constraINT PK_ESB_DEPLOY primary key (DEPLOY_ID, DEPLOY_DATE)
);

create table ESB_SERVICE_CHANGELOG  (
   CHANGE_ID            BIGINT                      not null,
   DEPLOY_ID            BIGINT,
   CHANGE_DATE          DATETIME,
   SERV_CHANGETYPE      VARCHAR(8),
   MODIFY_MAN           VARCHAR(40),
   VERSION              VARCHAR(20),
   SERVICE_CODE         VARCHAR(128),
   SERV_WSDL            TEXT,
   constraINT PK_ESB_SERVICE_CHANGELOG primary key (CHANGE_ID)
);

CREATE TABLE SAM_OPERLOG (
	LOGID VARCHAR(32) NOT NULL,
	USERID VARCHAR(50) NOT NULL,
	OPERTIME DATETIME NOT NULL,
	OPERDESC VARCHAR(500),
	CONSTRAINT LOG_ID PRIMARY KEY (LOGID)
);

CREATE TABLE SAM_FLOW_CONTROL (
	OPERATION_CODE VARCHAR(128) NOT NULL,
	CONTROL_TYPE BIGINT NOT NULL,
	PERIOD_TIME BIGINT,
	THRESHOLD BIGINT,
	SERVER_ADDR VARCHAR(4000) NOT NULL,
	APP_CODE VARCHAR(128) NOT NULL,
    PRIMARY KEY (OPERATION_CODE, CONTROL_TYPE,APP_CODE)

);

CREATE TABLE SAM_FREQUENCY_CONTROL (
	OPERATION_CODE VARCHAR(128) NOT NULL,
	PERIOD_TIME BIGINT,
	THRESHOLD BIGINT,
	SERVER_ADDR VARCHAR(4000) NOT NULL,
    APP_CODE varchar(128) NOT NULL,
    PRIMARY KEY (OPERATION_CODE,APP_CODE)
);

CREATE TABLE SAM_SERVICE_TIMEOUT (
	DEST_OPERATION_CODE VARCHAR(128) NOT NULL UNIQUE,
	TIMEOUT BIGINT NOT NULL,
	UUID VARCHAR(128) NOT NULL PRIMARY KEY,
	SERVER_ADDR VARCHAR(4000) NOT NULL,
    APP_CODE varchar(128) DEFAULT NULL
);

create table SSM_SERVICE_STATISTICS  (
   SRC_APP_CODE         VARCHAR(128),
   SRC_IP               VARCHAR(20),
   DEST_OPERATION_CODE  VARCHAR(128),
   ESB_ID               VARCHAR(128),
   STATISTICS_TIME      DATETIME,
   TARGET_URL           VARCHAR(256),
   TOTAL_DURATION         INT default 0,
   SUCCESS_NUM           INT default 0,
   SYSTEM_EXCEPTION_NUM     INT default 0,
   BUSI_EXCEPTION_NUM       INT default 0,
   TIMEOUT_NUM          INT,
   ILLEGAL_USE_NUM          INT default 0,
   ILLEGAL_IP_NUM          INT default 0,
   TOTAL_REQ_SIZE         INT default 0,
   TOTAL_RESP_SIZE        INT default 0
);

create table SSM_SERVICE_EXCEPTION  (
   REQUEST_ID           VARCHAR(128)                   not null,
   DEST_OPERATION_CODE  VARCHAR(128),
   ESB_ID               VARCHAR(128),
   SRC_APP_CODE         VARCHAR(128),
   SRC_IP               VARCHAR(20),
   STATISTICS_TIME      DATETIME,
   TARGET_URL           VARCHAR(256),
   IN_DATA              TEXT,
   OUT_DATA             TEXT,
   STATUS               CHAR,
   constraINT PK_SSM_SERVICE_EXCEPTION primary key (REQUEST_ID)
);

create table SSM_SERVICE_TOP  (
   REQUEST_ID           VARCHAR(128)                   not null,
   DEST_OPERATION_CODE  VARCHAR(128),
   ESB_ID               VARCHAR(128),
   SRC_APP_CODE         VARCHAR(128),
   SRC_IP               VARCHAR(20),
   STATISTICS_TIME      DATETIME,
   TARGET_URL           VARCHAR(256),
   LOG_TIME1            VARCHAR(128) ,
   LOG_TIME2            VARCHAR(128) ,
   LOG_TIME3            VARCHAR(128) ,
   LOG_TIME4            VARCHAR(128) ,
   DURATION             INT,
   IN_DATA              TEXT,
   OUT_DATA             TEXT,
   constraINT PK_SSM_SERVICE_TOP primary key (REQUEST_ID)
);

CREATE TABLE SSM_SERVICE_ALL  (
   REQUEST_ID           VARCHAR(128)                   NOT NULL,
   DEST_OPERATION_CODE  VARCHAR(128),
   ESB_ID               VARCHAR(128),
   SRC_APP_CODE         VARCHAR(128),
   SRC_IP               VARCHAR(20),
   STATISTICS_TIME      DATETIME,
   TARGET_URL           VARCHAR(256),
   LOG_TIME1            DATETIME,
   LOG_TIME2            DATETIME,
   LOG_TIME3            DATETIME,
   LOG_TIME4            DATETIME,
   DURATION             INT,
   IN_DATA              TEXT,
   OUT_DATA             TEXT,
   IN_DATA_SIZE       INT DEFAULT 0,
   OUT_DATA_SIZE      INT DEFAULT 0,
   STATUS               CHAR,
   CONSTRAINT PK_SSM_SERVICE_ALL PRIMARY KEY (REQUEST_ID)
);

CREATE TABLE SSM_SERVICE_MSG (
  REQUEST_ID VARCHAR(100) DEFAULT NULL,
  MSGID VARCHAR(100) DEFAULT NULL
) ;

CREATE TABLE SAM_APPSYSTEM_BLACK_IP (
  APP_CODE VARCHAR(128) NOT NULL,
  APP_IP VARCHAR(128) NOT NULL,
  SERVER_ADDR VARCHAR(4000) NOT NULL,
  PRIMARY KEY (APP_CODE,APP_IP)
);

CREATE TABLE REG_SERVICE_TYPE (
  TYPE_ID VARCHAR(32) NOT NULL,
  TYPE_NAME VARCHAR(32) NOT NULL,
  PROXYADDRESS VARCHAR(512) NOT NULL,
  SORT_NO INT NOT NULL,
  IDLEAF CHAR(1) NOT NULL,
  PARENT_TYPE_ID VARCHAR(32),
  SEQ_NO VARCHAR(4) NOT NULL,
  OPTRCODE VARCHAR(32) NOT NULL,
  OPTDATE DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  REMARK VARCHAR(512),
  PRIMARY KEY  (TYPE_ID)
);

CREATE TABLE REG_SERVICE_ROUTY (
  ROUTY_KEY VARCHAR(128) NOT NULL,
  TYPEID VARCHAR(128) NOT NULL,
  APP_CODE VARCHAR(128) NOT NULL,
  DETECT_WSDL_URL VARCHAR(128) NOT NULL,
  DYNAMIC_ROUTING VARCHAR(128) NOT NULL,
  SERVICE_URL VARCHAR(128) NOT NULL,
  OPTRCODE VARCHAR(32) NOT NULL,
  OPTDATE DATETIME NULL default current_timestamp,
  REMARK VARCHAR(512),
  STAND VARCHAR(512),
  PRIMARY KEY  (ROUTY_KEY)
);

CREATE TABLE ESB_VERSION (
  ESB_VERSION VARCHAR(32) NOT NULL
);

CREATE TABLE GOV_API_INFO(
     ID BIGINT NOT NULL,
     URL VARCHAR(1024),
     HTTP_METHOD VARCHAR(32),
     PRIMARY KEY (ID)
);

CREATE TABLE SAM_SERVICE_OFFLINE
(
    OPERATION_ID   VARCHAR(255) NOT NULL,
    OPERATION_NAME VARCHAR(255) NULL DEFAULT NULL,
    PROXY_URL      VARCHAR(255) NULL DEFAULT NULL,
    OPERATION_TYPE VARCHAR(255) NULL DEFAULT NULL,
    CHANNEL_ID     VARCHAR(255) NULL DEFAULT NULL,
    UPDATE_USER    VARCHAR(255) NULL DEFAULT NULL,
        PROXY_PORT    VARCHAR(255) NULL DEFAULT NULL,
    PROXY_ID    VARCHAR(255) NULL DEFAULT NULL,
    WS_OPERATION    VARCHAR(255) NULL DEFAULT NULL,
    PRIMARY KEY (OPERATION_ID)
);
CREATE TABLE SAM_OPERATION_TOKEN
(
    ID                VARCHAR(255) NOT NULL,
    OPERATION_CODE    VARCHAR(255) NOT NULL,
    CONSUMER_APP_CODE VARCHAR(255),
    EXPIRE_TIME       DATETIME,
    TOKEN             VARCHAR(1000),
    CREATE_TIME       DATETIME,
    PRIMARY KEY (id)
);


CREATE TABLE SAM_DATASOURCE
(
    ID                VARCHAR(50) NOT NULL,
    NAME              VARCHAR(128)  DEFAULT NULL,
    DB_VENDOR         VARCHAR(50)  DEFAULT NULL,
    DB_TYPE        VARCHAR(50)  DEFAULT NULL,
    USER_ACCOUNT              VARCHAR(50)  DEFAULT NULL,
    PASSWORD          VARCHAR(512)  DEFAULT NULL,
    ALGORITHM         INTEGER DEFAULT 0 ,
    MAXIMUM_POOL_SIZE INTEGER DEFAULT NULL,
    MINIMUM_IDLE      INTEGER DEFAULT NULL,
    JDBC_URL          VARCHAR(512)  DEFAULT NULL,
    DATABASE_NAME         VARCHAR(255)  DEFAULT NULL,
    DATABASE_IP           VARCHAR(255)  DEFAULT NULL,
    DATABASE_PORT           VARCHAR(155)  DEFAULT NULL ,
	DATABASE_SCHEMA           VARCHAR(155)  DEFAULT NULL ,
    JDBC_DRIVER         VARCHAR(155) DEFAULT NULL,
    TEST_SQL          VARCHAR(128)  DEFAULT NULL,
    RAW_EXTRA         TEXT NULL ,
    LAST_MODIFIED_AT  DATETIME DEFAULT NULL ,
    PRIMARY KEY (ID)
);

CREATE TABLE SAM_DATASERVICE_SPEC
(
    ID            VARCHAR(128) NOT NULL ,
    VERSION       VARCHAR(16) NOT NULL,
    NAME          VARCHAR(128)  DEFAULT NULL ,
    TYPE          INTEGER  DEFAULT 0 ,
    RAW_SPEC      TEXT NULL,
    SPEC_JSON      TEXT NULL ,
    RAW_SPEC_MD5  VARCHAR(32)  DEFAULT NULL ,
    DATA_SOURCE   VARCHAR(2000)  DEFAULT NULL,
    RELEASED_TIME DATETIME  DEFAULT NULL,
    REMARK        VARCHAR(255)  DEFAULT NULL,
    PRIMARY KEY (ID, VERSION)
);

CREATE TABLE SAM_PUBSUB_MESSAGEQUEUE
(
    ID           VARCHAR(255) NOT NULL  ,
    DOMAIN_CODE  VARCHAR(255) DEFAULT NULL ,
    SYSTEM_CODE  VARCHAR(255) DEFAULT NULL ,
    BUSINESS     VARCHAR(255) DEFAULT NULL ,
    MESSAGE_MODE VARCHAR(255) DEFAULT NULL ,
    NAME         VARCHAR(255) DEFAULT NULL ,
    CREATE_TIME  DATETIME  DEFAULT NULL,
    CREATE_USER  VARCHAR(255) DEFAULT NULL ,
    PRIMARY KEY (ID)
);

CREATE TABLE SAM_PUBSUB_RECORD
(
    ID                  VARCHAR(255) NOT NULL ,
    MESSAGE_QUEUE_NAME  VARCHAR(255) NOT NULL ,
    MESSAGE_MODE        VARCHAR(255) NOT NULL ,
    MQ_IP               VARCHAR(255) NOT NULL,
    MQ_PORT             VARCHAR(255) NOT NULL ,
    SUB_ADDRESS         VARCHAR(255) NOT NULL ,
    SUB_OPERATION_CODE  VARCHAR(255)          DEFAULT NULL ,
    ERROR_MESSGAE       TEXT         DEFAULT NULL ,
    STATE               INTEGER  DEFAULT NULL,
    SEND_MASSAGE        TEXT          DEFAULT NULL ,
    SEND_REQUEST_HEADER TEXT          DEFAULT NULL ,
    SEND_TIME           DATETIME  DEFAULT NULL  ,
    PRIMARY KEY (ID)
);


CREATE TABLE SAM_PUBSUB_RELATION
(
    ID                 VARCHAR(255) NOT NULL ,
    MESSAGE_QUEUE_NAME VARCHAR(255) DEFAULT NULL ,
    MQ_IP              VARCHAR(255) DEFAULT NULL ,
    MQ_PORT            VARCHAR(255) DEFAULT NULL ,
    MESSAGE_MODE       VARCHAR(255) DEFAULT NULL ,
    QUEUE_DOMAIN_CODE  VARCHAR(255) DEFAULT NULL ,
    QUEUE_SYSTEM_CODE  VARCHAR(255) DEFAULT NULL ,
    QUEUE_BUSINESS     VARCHAR(255) DEFAULT NULL ,
    SUB_ADDRESS        VARCHAR(255) DEFAULT NULL ,
    SUB_DOMAIN_CODE    VARCHAR(255) DEFAULT NULL ,
    SUB_SYSTEM_CODE    VARCHAR(255) DEFAULT NULL ,
    SUB_SERVICE_CODE   VARCHAR(255) DEFAULT NULL ,
    SUB_OPERATION_CODE VARCHAR(255) DEFAULT NULL ,
    CREATE_TIME  DATETIME  DEFAULT NULL,
    PRIMARY KEY (ID)
) ;
CREATE TABLE SAM_PUBSUB_PUBLISHER
(
    OPERATION_CODE     VARCHAR(255) NOT NULL,
    DOMAIN_CODE        VARCHAR(255) DEFAULT NULL,
    SYSTEM_CODE        VARCHAR(255) DEFAULT NULL,
    MESSAGE_QUEUE_NAME VARCHAR(255) DEFAULT NULL,
    MQ_IP              VARCHAR(255) DEFAULT NULL,
    MQ_PORT            VARCHAR(255) DEFAULT NULL,
    MESSAGE_MODE       VARCHAR(255) DEFAULT NULL,
    QUEUE_DOMAIN_CODE  VARCHAR(255) DEFAULT NULL,
    QUEUE_SYSTEM_CODE  VARCHAR(255) DEFAULT NULL,
    QUEUE_BUSINESS     VARCHAR(255) DEFAULT NULL,
    PROXY_URL          VARCHAR(255) DEFAULT NULL,
    PROXY_PORT         VARCHAR(255) DEFAULT NULL,
    CREATE_TIME        DATETIME     DEFAULT NULL,
    PRIMARY KEY (OPERATION_CODE)
);


CREATE TABLE ESB_AUDIT_LOG (
    ID varchar(255) not null
         primary key,
    ACTION varchar(255),
    ACTION_TYPE varchar(255),
    DATA varchar(max),
	ERROR_MESSAGE varchar(max),
	MESSAGE varchar(255),
	METHOD varchar(255),
	MODULE varchar(255),
	OPERATE_IP varchar(255),
	OPERATE_PARAM varchar(max),
	OPERATE_TIME datetime2,
	OPERATE_TYPE varchar(255),
	OPERATE_URL varchar(255),
	PRINCIPAL varchar(255),
	PRINCIPAL_NAME varchar(255),
	PRINCIPAL_TYPE varchar(255),
	PROCESS_TIME bigint not null,
	RECORD_TIME datetime2,
	REQUEST_METHOD varchar(255),
	RESULT varchar(max),
	STATUS varchar(255),
	TARGET_SYS varchar(255),
	TENANT_CODE varchar(255)
);

CREATE TABLE SAM_PUBSUB_REPEAT  (
        ID varchar(255)  NOT NULL primary key,
        STATE varchar(2) ,
        REPEAT_DATE DATETIME,
        RECORD_ID varchar(255),
        RESPONSE_MESSAGE varchar(max)
);

if exists (select * from sysobjects where name = 'SYSTEM_HIERARCHY_VIEW')
drop view SYSTEM_HIERARCHY_VIEW;

if exists (select * from sysobjects where name = 'SERVICE_HIERARCHY_VIEW')
drop view SERVICE_HIERARCHY_VIEW;

if exists (select * from sysobjects where name = 'OPERATION_HIERARCHY_VIEW')
drop view OPERATION_HIERARCHY_VIEW;


CREATE VIEW SYSTEM_HIERARCHY_VIEW AS
SELECT SD.DOMAIN_CODE AS "domain_code",
       SD.DOMAIN_NAME AS "domain_name",
       SA.APP_CODE    AS "app_code",
       SA.APP_NAME    AS "app_name"
FROM SAM_APPSYSTEM SA
         INNER JOIN SAM_DOMAIN SD
                    ON SA.DOMAIN_CODE = SD.DOMAIN_CODE;

CREATE VIEW SERVICE_HIERARCHY_VIEW AS
SELECT SD.DOMAIN_CODE  AS "domain_code",
       SD.DOMAIN_NAME  AS "domain_name",
       SA.APP_CODE     AS "app_code",
       SA.APP_NAME     AS "app_name",
       SS.SERVICE_CODE AS "service_code",
       SS.SERVICE_NAME AS "service_name"
FROM SAM_APPSYSTEM SA
         INNER JOIN SAM_DOMAIN SD ON SA.DOMAIN_CODE = SD.DOMAIN_CODE
         INNER JOIN SAM_SERVICE SS ON SA.APP_CODE = SS.APP_CODE;

CREATE VIEW OPERATION_HIERARCHY_VIEW AS
SELECT SD.DOMAIN_CODE  AS "domain_code",
       SD.DOMAIN_NAME  AS "domain_name",
       SA.APP_CODE     AS "app_code",
       SA.APP_NAME     AS "app_name",
       SS.SERVICE_CODE AS "service_code",
       SS.SERVICE_NAME AS "service_name",
       SO.OPERATION_CODE AS "operation_code",
       SO.OPERATION_NAME AS "operation_name"
FROM  SAM_DOMAIN SD
          INNER JOIN SAM_APPSYSTEM SA ON SA.DOMAIN_CODE = SD.DOMAIN_CODE
          INNER JOIN SAM_SERVICE SS ON SA.APP_CODE = SS.APP_CODE
          INNER JOIN SAM_OPERATION SO ON SS.SERVICE_CODE = SO.SAM_SERVICE_CODE;