
/*==============================================================*/
/* Table: 主键表                                              */
/*==============================================================*/
DROP TABLE IF EXISTS EOS_UNIQUE_TABLE;
CREATE TABLE EOS_UNIQUE_TABLE (
    NAME VARCHAR(255) NOT NULL,
    CODE NUMERIC(19,0) NULL,
    PRIMARY KEY (NAME)
);

/*==============================================================*/
/* Table: 锁表                                              */
/*==============================================================*/
DROP TABLE IF EXISTS EOS_LOCK;
CREATE TABLE EOS_LOCK (
    LOCK_ID      VARCHAR(255) NOT NULL,
    CREATE_USER  VARCHAR(255),
    CREATE_TIME  DATETIME,
    INVALID_TIME DATETIME,
    PRIMARY KEY (LOCK_ID)
);

/*==============================================================*/
/* Table: 服务端点表                                              */
/*==============================================================*/
DROP TABLE IF EXISTS EOS_SERVICE_ENDPOINT;
CREATE TABLE EOS_SERVICE_ENDPOINT (
    GLOBAL_ID VARCHAR(255) NOT NULL,
    SERVICE_NAME VARCHAR(255) NOT NULL,
    HOST VARCHAR(255),
    PORT VARCHAR(255),
    PROTROL VARCHAR(255) NOT NULL,
    CONTEXT VARCHAR(255),
    TYPE  VARCHAR(255),
    PRIORITY  VARCHAR(255),
    APP_NAME VARCHAR(255) NOT NULL,
    EXTENSION1 VARCHAR(255) NULL,
    EXTENSION2 VARCHAR(255) NULL,
    EXTENSION3 VARCHAR(255) NULL,
    EXTENSION4 VARCHAR(255) NULL,
    EXTENSION5 VARCHAR(22) NULL,
    EXTENSION6 VARCHAR(22) NULL,
    PRIMARY KEY (GLOBAL_ID)
);




DROP TABLE IF EXISTS EOS_QRTZ_BLOB_TRIGGERS;

DROP TABLE IF EXISTS EOS_QRTZ_CALENDARS;

DROP TABLE  IF EXISTS EOS_QRTZ_CRON_TRIGGERS;

DROP TABLE  IF EXISTS EOS_QRTZ_FIRED_TRIGGERS;

DROP TABLE  IF EXISTS EOS_QRTZ_JOB_LISTENERS;

DROP TABLE  IF EXISTS EOS_QRTZ_LOCKS;

DROP TABLE  IF EXISTS EOS_QRTZ_PAUSED_TRIGGER_GRPS;

DROP TABLE  IF EXISTS EOS_QRTZ_SCHEDULER_STATE;

DROP TABLE  IF EXISTS EOS_QRTZ_SIMPLE_TRIGGERS;

DROP TABLE  IF EXISTS EOS_QRTZ_TRIGGER_LISTENERS;

DROP TABLE  IF EXISTS EOS_QRTZ_TRIGGERS;

DROP TABLE  IF EXISTS EOS_QRTZ_JOB_DETAILS;

DROP TABLE  IF EXISTS EOS_QRTZ_SCHEDULER;

CREATE TABLE EOS_QRTZ_JOB_DETAILS (
    JOB_NAME VARCHAR(80) NOT NULL,
    JOB_GROUP VARCHAR(80) NOT NULL,
    DESCRIPTION VARCHAR(120) NULL,
    JOB_CLASS_NAME VARCHAR(128) NOT NULL,
    IS_DURABLE INT NOT NULL,
    IS_VOLATILE INT NOT NULL,
    IS_STATEFUL INT NOT NULL,
    REQUESTS_RECOVERY INT NOT NULL,
    JOB_DATA IMAGE NULL,
    PRIMARY KEY (JOB_NAME, JOB_GROUP)
);

CREATE TABLE EOS_QRTZ_JOB_LISTENERS (
    JOB_LISTENER VARCHAR(80) NOT NULL,
    JOB_NAME VARCHAR(80) NOT NULL,
    JOB_GROUP VARCHAR(80) NOT NULL,
    PRIMARY KEY (JOB_LISTENER, JOB_NAME, JOB_GROUP),
    FOREIGN KEY (JOB_NAME,JOB_GROUP)
       REFERENCES EOS_QRTZ_JOB_DETAILS(JOB_NAME,JOB_GROUP)
);

CREATE TABLE EOS_QRTZ_TRIGGERS (
    TRIGGER_NAME VARCHAR(80) NOT NULL,
    TRIGGER_GROUP VARCHAR(80) NOT NULL,
    IS_VOLATILE INT NOT NULL,
    DESCRIPTION VARCHAR(120) NULL,
    NEXT_FIRE_TIME NUMERIC(19,0) NULL,
    PREV_FIRE_TIME NUMERIC(19,0) NULL,
    TRIGGER_STATE VARCHAR(16) NOT NULL,
    TRIGGER_TYPE VARCHAR(8) NOT NULL,
    START_TIME NUMERIC(19,0) NOT NULL,
    END_TIME NUMERIC(19,0) NULL,
    CALENDAR_NAME VARCHAR(80) NULL,
    MISFIRE_INSTR SMALLINT DEFAULT 2 NULL,
    JOB_DATA IMAGE NULL,
    JOB_NAME VARCHAR(80) NOT NULL,
    JOB_GROUP VARCHAR(80) NOT NULL,
    PRIMARY KEY (TRIGGER_NAME, TRIGGER_GROUP),
    FOREIGN KEY (JOB_NAME,JOB_GROUP)
       REFERENCES EOS_QRTZ_JOB_DETAILS(JOB_NAME,JOB_GROUP)
);

CREATE TABLE EOS_QRTZ_CALENDARS (
    CALENDAR_NAME VARCHAR(80) NOT NULL,
    CALENDAR IMAGE NOT NULL,
    PRIMARY KEY (CALENDAR_NAME)
);

CREATE TABLE EOS_QRTZ_BLOB_TRIGGERS (
    TRIGGER_NAME VARCHAR(80) NOT NULL,
    TRIGGER_GROUP VARCHAR(80) NOT NULL,
    BLOB_DATA IMAGE NULL,
    PRIMARY KEY (TRIGGER_NAME, TRIGGER_GROUP),
    FOREIGN KEY (TRIGGER_NAME,TRIGGER_GROUP)
       REFERENCES EOS_QRTZ_TRIGGERS(TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE EOS_QRTZ_CRON_TRIGGERS (
    TRIGGER_NAME VARCHAR(80) NOT NULL,
    TRIGGER_GROUP VARCHAR(80) NOT NULL,
    CRON_EXPRESSION VARCHAR(80) NOT NULL,
    TIME_ZONE_ID VARCHAR(80) NULL,
    PRIMARY KEY (TRIGGER_NAME, TRIGGER_GROUP),
    FOREIGN KEY (TRIGGER_NAME,TRIGGER_GROUP)
       REFERENCES EOS_QRTZ_TRIGGERS(TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE EOS_QRTZ_FIRED_TRIGGERS (
    ENTRY_ID VARCHAR(95) NOT NULL,
    TRIGGER_NAME VARCHAR(80) NOT NULL,
    TRIGGER_GROUP VARCHAR(80) NOT NULL,
    IS_VOLATILE INT NOT NULL,
    INSTANCE_NAME VARCHAR(80) NOT NULL,
    FIRED_TIME NUMERIC(19,0) NOT NULL,
    STATE VARCHAR(16) NOT NULL,
    JOB_NAME VARCHAR(80) NULL,
    JOB_GROUP VARCHAR(80) NULL,
    IS_STATEFUL INT NULL,
    REQUESTS_RECOVERY INT NULL,
    PRIMARY KEY (ENTRY_ID)
);

CREATE TABLE EOS_QRTZ_PAUSED_TRIGGER_GRPS (
    TRIGGER_GROUP VARCHAR(80) NOT NULL,
    PRIMARY KEY (TRIGGER_GROUP)
);

CREATE TABLE EOS_QRTZ_SCHEDULER_STATE (
    INSTANCE_NAME VARCHAR(80) NOT NULL,
    LAST_CHECKIN_TIME NUMERIC(19,0) NOT NULL,
    CHECKIN_INTERVAL NUMERIC(19,0) NOT NULL,
    RECOVERER VARCHAR(80) NULL,
    PRIMARY KEY (INSTANCE_NAME)
);

CREATE TABLE EOS_QRTZ_SIMPLE_TRIGGERS (
    TRIGGER_NAME VARCHAR(80) NOT NULL,
    TRIGGER_GROUP VARCHAR(80) NOT NULL,
    REPEAT_COUNT NUMERIC(19,0) NOT NULL,
    REPEAT_INTERVAL NUMERIC(19,0) NOT NULL,
    TIMES_TRIGGERED NUMERIC(19,0) NOT NULL,
    PRIMARY KEY (TRIGGER_NAME, TRIGGER_GROUP),
    FOREIGN KEY (TRIGGER_NAME,TRIGGER_GROUP)
       REFERENCES EOS_QRTZ_TRIGGERS(TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE EOS_QRTZ_TRIGGER_LISTENERS (
    TRIGGER_LISTENER VARCHAR(80) NOT NULL,
    TRIGGER_NAME VARCHAR(80) NOT NULL,
    TRIGGER_GROUP VARCHAR(80) NOT NULL,
    PRIMARY KEY (TRIGGER_LISTENER, TRIGGER_NAME, TRIGGER_GROUP),
    FOREIGN KEY (TRIGGER_NAME,TRIGGER_GROUP)
       REFERENCES EOS_QRTZ_TRIGGERS(TRIGGER_NAME,TRIGGER_GROUP)
);

CREATE TABLE EOS_QRTZ_LOCKS (
    LOCK_NAME VARCHAR(40) NOT NULL,
    PRIMARY KEY (LOCK_NAME)
);
CREATE TABLE EOS_QRTZ_SCHEDULER(
       UUID  NVARCHAR(64)  NOT NULL,
       SCHEDULER NVARCHAR(64),
       NODE  NVARCHAR(64),
       STATUS  DECIMAL(2,0),
       HEARTBEATTIME   DECIMAL(20,0),
       VALIDATEFLAG  DECIMAL(2,0),
       VALIDATETIME  DATETIME,
       INVALIDATETIME  DATETIME,
       PRIMARY KEY (UUID)
);

INSERT INTO EOS_QRTZ_LOCKS VALUES('TRIGGER_ACCESS');
INSERT INTO EOS_QRTZ_LOCKS VALUES('JOB_ACCESS');
INSERT INTO EOS_QRTZ_LOCKS VALUES('CALENDAR_ACCESS');
INSERT INTO EOS_QRTZ_LOCKS VALUES('STATE_ACCESS');
INSERT INTO EOS_QRTZ_LOCKS VALUES('MISFIRE_ACCESS');
INSERT INTO EOS_QRTZ_SCHEDULER(UUID,SCHEDULER,STATUS,HEARTBEATTIME,VALIDATEFLAG) VALUES ('SCHEDULE_CTRL','SCHEDULE_CTRL',0,0,1);

-- ----------------------------
-- Table structure for EOS_DICT_ENTRY
-- ----------------------------
if exists ( select *  from  sysobjects where name = 'EOS_DICT_ENTRY' and type = 'U') 
DROP TABLE EOS_DICT_ENTRY;
CREATE TABLE EOS_DICT_ENTRY (
	DICT_ID bigint NOT NULL PRIMARY KEY,
	CREATED_TIME datetime DEFAULT NULL,
	MODIFIED_TIME datetime DEFAULT NULL,
	DELETED bit NOT NULL,
	TENANT_CODE varchar(255) DEFAULT NULL,
	DICT_CODE varchar(128) DEFAULT NULL,
	DICT_NAME varchar(255) DEFAULT NULL,
	DICT_TYPE_CODE varchar(128) DEFAULT NULL,
	FILTER1 varchar(255) DEFAULT NULL,
	FILTER2 varchar(255) DEFAULT NULL,
	PARENT_CODE varchar(255) DEFAULT NULL,
	RANK int DEFAULT NULL,
	SEQ_NO varchar(255) DEFAULT NULL,
	SORT_NO int DEFAULT NULL,
	STATUS int DEFAULT NULL,
	CREATOR bigint DEFAULT NULL,
	MODIFIER bigint DEFAULT NULL
);
INSERT INTO EOS_DICT_ENTRY VALUES ('301', '1970-01-01 00:00:00', null, '0', '', 'm', '男', 'COF_GENDER', null, null, null, '0', null, '1', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('302', '1970-01-01 00:00:00', null, '0', '', 'f', '女', 'COF_GENDER', null, null, null, '0', null, '2', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('303', '1970-01-01 00:00:00', null, '0', '', 'n', '未知', 'COF_GENDER', null, null, null, '0', null, '3', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('304', '1970-01-01 00:00:00', null, '0', '', 'id', '身份证', 'COF_CARDTYPE', null, null, null, '0', null, '1', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('305', '1970-01-01 00:00:00', null, '0', '', 'junguan', '军官证', 'COF_CARDTYPE', null, null, null, '0', null, '2', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('306', '1970-01-01 00:00:00', null, '0', '', 'passport', '护照', 'COF_CARDTYPE', null, null, null, '0', null, '3', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('307', '1970-01-01 00:00:00', null, '0', '', 'student', '学生证', 'COF_CARDTYPE', null, null, null, '0', null, '4', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('308', '1970-01-01 00:00:00', null, '0', '', 'zhanzhu', '暂住证', 'COF_CARDTYPE', null, null, null, '0', null, '5', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('309', '1970-01-01 00:00:00', null, '0', '', 'ldap', 'LDAP认证', 'COF_AUTHMODE', null, null, null, '0', null, '1', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('310', '1970-01-01 00:00:00', null, '0', '', 'local', '本地密码认证', 'COF_AUTHMODE', null, null, null, '0', null, '2', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('311', '1970-01-01 00:00:00', null, '0', '', 'portal', 'Portal认证', 'COF_AUTHMODE', null, null, null, '0', null, '3', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('312', '1970-01-01 00:00:00', null, '0', '', 'remote', '远程认证', 'COF_AUTHMODE', null, null, null, '0', null, '4', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('313', '1970-01-01 00:00:00', null, '0', '', 'running', '正常', 'COF_OPERSTATUS', null, null, null, '0', null, '1', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('314', '1970-01-01 00:00:00', null, '0', '', 'stop', '不正常', 'COF_OPERSTATUS', null, null, null, '0', null, '2', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('315', '1970-01-01 00:00:00', null, '0', '', 'b', '分公司', 'COF_ORGTYPE', null, null, null, '0', null, '1', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('316', '1970-01-01 00:00:00', null, '0', '', 'bd', '分公司部门', 'COF_ORGTYPE', null, null, null, '0', null, '2', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('317', '1970-01-01 00:00:00', null, '0', '', 'h', '总公司', 'COF_ORGTYPE', null, null, null, '0', null, '3', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('318', '1970-01-01 00:00:00', null, '0', '', 'hd', '总公司部门', 'COF_ORGTYPE', null, null, null, '0', null, '4', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('319', '1970-01-01 00:00:00', null, '0', '', 'branch', '分行', 'COF_ORGDEGREE', null, null, null, '0', null, '1', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('320', '1970-01-01 00:00:00', null, '0', '', 'hq', '总行', 'COF_ORGDEGREE', null, null, null, '0', null, '2', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('321', '1970-01-01 00:00:00', null, '0', '', 'oversea', '海外分行', 'COF_ORGDEGREE', null, null, null, '0', null, '3', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('322', '1970-01-01 00:00:00', null, '0', '', 'running', '正常', 'COF_ORGSTATUS', null, null, null, '0', null, '1', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('323', '1970-01-01 00:00:00', null, '0', '', 'cancel', '注销', 'COF_ORGSTATUS', null, null, null, '0', null, '2', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('324', '1970-01-01 00:00:00', null, '0', '', 'leave', '离职', 'COF_EMPSTATUS', null, null, null, '0', null, '1', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('325', '1970-01-01 00:00:00', null, '0', '', 'off', '退休', 'COF_EMPSTATUS', null, null, null, '0', null, '2', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('326', '1970-01-01 00:00:00', null, '0', '', 'on', '在岗', 'COF_EMPSTATUS', null, null, null, '0', null, '3', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('327', '1970-01-01 00:00:00', null, '0', '', 'wait', '待岗', 'COF_EMPSTATUS', null, null, null, '0', null, '4', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('328', '1970-01-01 00:00:00', null, '0', '', 'level1', '级别1', 'COF_EMPLEVEL', null, null, null, '0', null, '1', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('329', '1970-01-01 00:00:00', null, '0', '', 'level2', '级别2', 'COF_EMPLEVEL', null, null, null, '0', null, '2', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('330', '1970-01-01 00:00:00', null, '0', '', 'level3', '级别3', 'COF_EMPLEVEL', null, null, null, '0', null, '3', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('331', '1970-01-01 00:00:00', null, '0', '', 'comsomol', '团员', 'COF_PARTYVISAGE', null, null, null, '0', null, '1', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('332', '1970-01-01 00:00:00', null, '0', '', 'crowd', '群众', 'COF_PARTYVISAGE', null, null, null, '0', null, '2', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('333', '1970-01-01 00:00:00', null, '0', '', 'partymember', '党员', 'COF_PARTYVISAGE', null, null, null, '0', null, '3', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('338', '1970-01-01 00:00:00', null, '0', '', '0', '挂起', 'COF_USERSTATUS', null, null, null, '0', null, '1', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('339', '1970-01-01 00:00:00', null, '0', '', '1', '正常', 'COF_USERSTATUS', null, null, null, '0', null, '2', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('340', '1970-01-01 00:00:00', null, '0', '', '2', '锁定', 'COF_USERSTATUS', null, null, null, '0', null, '3', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('341', '1970-01-01 00:00:00', null, '0', '', '9', '注销', 'COF_USERSTATUS', null, null, null, '0', null, '4', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('343', '1970-01-01 00:00:00', null, '0', '', 'default', '默认布局', 'COF_SKINLAYOUT', null, null, null, '0', null, '1', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('344', '1970-01-01 00:00:00', null, '0', '', 'outlookmenu', 'outlookmenu', 'COF_SKINLAYOUT', null, null, null, '0', null, '2', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('345', '1970-01-01 00:00:00', null, '0', '', 'outlooktree', 'outlooktree', 'COF_SKINLAYOUT', null, null, null, '0', null, '3', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('346', '1970-01-01 00:00:00', null, '0', '', 'win7', 'win7', 'COF_SKINLAYOUT', null, null, null, '0', null, '4', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('347', '1970-01-01 00:00:00', null, '0', '', 'navtree', 'navtree', 'COF_SKINLAYOUT', null, null, null, '0', null, '5', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('348', '1970-01-01 00:00:00', null, '0', '', 'menubar', 'menubar', 'COF_SKINLAYOUT', null, null, null, '0', null, '6', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('349', '1970-01-01 00:00:00', null, '0', '', '0', '本地', 'COF_APPTYPE', null, null, null, '0', null, '1', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('350', '1970-01-01 00:00:00', null, '0', '', '1', '远程', 'COF_APPTYPE', null, null, null, '0', null, '2', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('351', '1970-01-01 00:00:00', null, '0', '', 'flow', '页面流', 'COF_SKINLAYOUT', null, null, null, '0', null, '1', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('352', '1970-01-01 00:00:00', null, '0', '', 'page', '页面', 'COF_SKINLAYOUT', null, null, null, '0', null, '2', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('353', '1970-01-01 00:00:00', null, '0', '', 'form', '表单', 'COF_SKINLAYOUT', null, null, null, '0', null, '3', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('354', '1970-01-01 00:00:00', null, '0', '', 'view', '视图', 'COF_SKINLAYOUT', null, null, null, '0', null, '4', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('355', '1970-01-01 00:00:00', null, '0', '', 'startprocess', '启动流程', 'COF_SKINLAYOUT', null, null, null, '0', null, '5', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('356', '1970-01-01 00:00:00', null, '0', '', 'other', '其他', 'COF_SKINLAYOUT', null, null, null, '0', null, '6', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('357', '1970-01-01 00:00:00', null, '0', '', '0', '否', 'COF_SKINLAYOUT', null, null, null, '0', null, '1', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('358', '1970-01-01 00:00:00', null, '0', '', '1', '是', 'COF_SKINLAYOUT', null, null, null, '0', null, '2', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('359', '1970-01-01 00:00:00', null, '0', '', 'N', '不生效', 'COF_SKINLAYOUT', null, null, null, '0', null, '1', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('360', '1970-01-01 00:00:00', null, '0', '', 'Y', '生效', 'COF_SKINLAYOUT', null, null, null, '0', null, '2', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('361', '1970-01-01 00:00:00', null, '0', '', 'allow', '允许访问', 'COF_SKINLAYOUT', null, null, null, '0', null, '1', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('362', '1970-01-01 00:00:00', null, '0', '', 'prohibit', '禁止访问', 'COF_SKINLAYOUT', null, null, null, '0', null, '2', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('401', '1970-01-01 00:00:00', null, '0', '', 'SUCCESS', '成功', 'IAM_AUDIT_STATUS', null, null, null, '0', null, '1', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('402', '1970-01-01 00:00:00', null, '0', '', 'FAILURE', '失败', 'IAM_AUDIT_STATUS', null, null, null, '0', null, '1', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('403', '1970-01-01 00:00:00', null, '0', '', 'ERROR', '错误', 'IAM_AUDIT_STATUS', null, null, null, '0', null, '1', '0', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('405', null, null, '0', null, '1', '上线', 'SAM_App_Status', null, null, null, '1', '.1.', '1', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('406', null, null, '0', null, '2', '注销', 'SAM_App_Status', null, null, null, '1', '.2.', '2', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('407', null, null, '0', null, '1', '系统', 'SAM_AssertUseAudit_AssertType', null, null, null, '1', '.1.', '1', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('408', null, null, '0', null, '2', '操作', 'SAM_AssertUseAudit_AssertType', null, null, null, '1', '.2.', '2', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('409', null, null, '0', null, '1', '调用未注册', 'SAM_AssertUseAudit_BreakeRule', null, null, null, '1', '.1.', '1', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('410', null, null, '0', null, '2', '注册未调用', 'SAM_AssertUseAudit_BreakeRule', null, null, null, '1', '.2.', '2', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('411', null, null, '0', null, '11', '手工接口注册全量', 'SAM_AUDIT_TYPE', null, null, null, '1', '.11.', '11', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('412', null, null, '0', null, '12', '定时接口注册全量', 'SAM_AUDIT_TYPE', null, null, null, '1', '.12.', '12', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('413', null, null, '0', null, '13', '手工接口注册增量', 'SAM_AUDIT_TYPE', null, null, null, '1', '.13.', '13', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('414', null, null, '0', null, '14', '定时接口注册增量', 'SAM_AUDIT_TYPE', null, null, null, '1', '.14.', '14', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('415', null, null, '0', null, '15', '手工接口注册单个', 'SAM_AUDIT_TYPE', null, null, null, '1', '.15.', '15', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('416', null, null, '0', null, '21', '手工接口调用全量', 'SAM_AUDIT_TYPE', null, null, null, '1', '.21.', '21', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('417', null, null, '0', null, '22', '定时接口调用全量', 'SAM_AUDIT_TYPE', null, null, null, '1', '.22.', '22', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('418', null, null, '0', null, '101', '接口服务不匹配', 'SAM_BREAK_RULE', null, null, null, '1', '.101.', '1', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('419', null, null, '0', null, '201', '操作不匹配', 'SAM_BREAK_RULE', null, null, null, '1', '.201.', '3', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('420', null, null, '0', null, '401', '服务未注册', 'SAM_BREAK_RULE', null, null, null, '1', '.401.', '4', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('421', null, null, '0', null, '402', '服务未部署', 'SAM_BREAK_RULE', null, null, null, '1', '.402.', '5', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('422', null, null, '0', null, '404', 'WSDL不符合规范', 'SAM_BREAK_RULE', null, null, null, '1', '.404.', '6', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('423', null, null, '0', null, '0', '过期批次', 'SAM_DeployBatch_Status', null, null, null, '1', '.0.', '2', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('424', null, null, '0', null, '1', '当前批次', 'SAM_DeployBatch_Status', null, null, null, '1', '.1.', '1', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('425', null, null, '0', null, '1', 'http://127.0.0.1:9099/org.gocom.esb.ws.route', 'SAM_DYNAMIC_ROUTING', null, null, null, '1', '.1.', '1', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('426', null, null, '0', null, '2', 'http://127.0.0.1:9099/org.gocom.esb.rest.route', 'SAM_DYNAMIC_ROUTING', null, null, null, '1', '.2.', '2', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('427', null, null, '0', null, '1', '服务消费者', 'SAM_ESB_Type', null, null, null, '1', '.1.', '1', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('428', null, null, '0', null, '2', 'ESB总线', 'SAM_ESB_Type', null, null, null, '1', '.2.', '2', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('429', null, null, '0', null, '3', '服务提供者', 'SAM_ESB_Type', null, null, null, '1', '.3.', '3', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('430', null, null, '0', null, '0', '周期控制', 'SAM_flow_control_type', null, null, null, '1', '.1.', '1', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('431', null, null, '0', null, '1', '单次请求控制', 'SAM_flow_control_type', null, null, null, '1', '.2.', '2', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('432', null, null, '0', null, '-1', '暂停部署上线', 'SAM_OnlineStatus', null, null, null, '1', '.-1.', '2', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('433', null, null, '0', null, '1', '允许部署上线', 'SAM_OnlineStatus', null, null, null, '1', '.1.', '1', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('434', null, null, '0', null, '1', '操作部署', 'SAM_OptChange_Type', null, null, null, '1', '.1.', '1', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('435', null, null, '0', null, '2', '操作注销', 'SAM_OptChange_Type', null, null, null, '1', '.2.', '2', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('436', null, null, '0', null, '3', '操作恢复', 'SAM_OptChange_Type', null, null, null, '1', '.3.', '3', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('437', null, null, '0', null, '4', '操作卸载', 'SAM_OptChange_Type', null, null, null, '1', '.4.', '4', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('438', null, null, '0', null, '1', '部署', 'SAM_Opt_Changelog_Type', null, null, null, '1', '.1.', '1', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('439', null, null, '0', null, '2', '卸载', 'SAM_Opt_Changelog_Type', null, null, null, '1', '.2.', '2', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('440', null, null, '0', null, '1', '输入', 'SAM_Param_Dir', null, null, null, '1', '.1.', '1', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('441', null, null, '0', null, '2', '输出', 'SAM_Param_Dir', null, null, null, '1', '.2.', '2', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('442', null, null, '0', null, '3', '异常', 'SAM_Param_Dir', null, null, null, '1', '.3.', '3', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('443', null, null, '0', null, '1', '是', 'SAM_Param_Required', null, null, null, '1', '.1.', '1', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('444', null, null, '0', null, '2', '否', 'SAM_Param_Required', null, null, null, '1', '.2.', '2', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('445', null, null, '0', null, 'anyURI', 'anyURI', 'SAM_Param_Type', null, null, null, '1', '.anyURI.', '13', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('446', null, null, '0', null, 'base64Binary', 'base64Binary', 'SAM_Param_Type', null, null, null, '1', '.base64Binary.', '16', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('447', null, null, '0', null, 'boolean', 'boolean', 'SAM_Param_Type', null, null, null, '1', '.boolean.', '7', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('448', null, null, '0', null, 'complexType', 'complexType', 'SAM_Param_Type', null, null, null, '1', '.complexType.', '5', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('449', null, null, '0', null, 'date', 'date', 'SAM_Param_Type', null, null, null, '1', '.date.', '9', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('450', null, null, '0', null, 'dateTime', 'dateTime', 'SAM_Param_Type', null, null, null, '1', '.dateTime.', '11', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('451', null, null, '0', null, 'decimal', 'decimal', 'SAM_Param_Type', null, null, null, '1', '.decimal.', '8', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('452', null, null, '0', null, 'double', 'double', 'SAM_Param_Type', null, null, null, '1', '.double.', '6', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('453', null, null, '0', null, 'duration', 'duration', 'SAM_Param_Type', null, null, null, '1', '.duration.', '12', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('454', null, null, '0', null, 'float', 'float', 'SAM_Param_Type', null, null, null, '1', '.float.', '4', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('455', null, null, '0', null, 'int', 'int', 'SAM_Param_Type', null, null, null, '1', '.int.', '1', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('456', null, null, '0', null, 'long', 'long', 'SAM_Param_Type', null, null, null, '1', '.long.', '2', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('457', null, null, '0', null, 'NOTATION', 'NOTATION', 'SAM_Param_Type', null, null, null, '1', '.NOTATION.', '15', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('458', null, null, '0', null, 'QName', 'QName', 'SAM_Param_Type', null, null, null, '1', '.QName.', '14', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('459', null, null, '0', null, 'string', 'string', 'SAM_Param_Type', null, null, null, '1', '.string.', '3', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('460', null, null, '0', null, 'time', 'time', 'SAM_Param_Type', null, null, null, '1', '.time.', '10', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('461', null, null, '0', null, '1', '增加', 'SAM_Policy_Changelog_Type', null, null, null, '1', '.1.', '1', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('462', null, null, '0', null, '2', '删除', 'SAM_Policy_Changelog_Type', null, null, null, '1', '.2.', '2', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('463', null, null, '0', null, '1', '已注册', 'SAM_Service_Type', null, null, null, '1', '.1.', '1', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('464', null, null, '0', null, '2', '已发布', 'SAM_Service_Type', null, null, null, '1', '.2.', '2', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('465', null, null, '0', null, '3', '已暂停', 'SAM_Service_Type', null, null, null, '1', '.3.', '3', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('466', null, null, '0', null, '4', '已注销', 'SAM_Service_Type', null, null, null, '1', '.4.', '4', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('467', null, null, '0', null, '1', '上线', 'SAM_Serv_Status', null, null, null, '1', '.1.', '1', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('468', null, null, '0', null, '2', '注销', 'SAM_Serv_Status', null, null, null, '1', '.2.', '2', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('469', null, null, '0', null, '1', 'WebService', 'SAM_Serv_Type', null, null, null, '1', '.1.', '1', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('470', null, null, '0', null, '2', 'HTTP+JSON', 'SAM_Serv_Type', null, null, null, '1', '.2.', '2', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('471', null, null, '0', null, '3', 'REST', 'SAM_Serv_Type', null, null, null, '1', '.3.', '3', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('472', null, null, '0', null, '1', '业务包部署', 'SAM_SrvChange_Type', null, null, null, '1', '.1.', '1', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('473', null, null, '0', null, '2', '业务包卸载', 'SAM_SrvChange_Type', null, null, null, '1', '.2.', '2', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('474', null, null, '0', null, '3', '公共包部署', 'SAM_SrvChange_Type', null, null, null, '1', '.3.', '3', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('475', null, null, '0', null, '4', '公共包卸载', 'SAM_SrvChange_Type', null, null, null, '1', '.4.', '4', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('476', null, null, '0', null, '1800000', '30分钟', 'SAM_Time_Span', null, null, null, '1', '.1800000.', '3', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('477', null, null, '0', null, '300000', '5分钟', 'SAM_Time_Span', null, null, null, '1', '.300000.', '1', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('478', null, null, '0', null, '3600000', '60分钟', 'SAM_Time_Span', null, null, null, '1', '.3600000.', '4', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('479', null, null, '0', null, '900000', '15分钟', 'SAM_Time_Span', null, null, null, '1', '.900000.', '2', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('480', null, null, '0', null, '1', '5分钟', 'SAM_Time_Type', null, null, null, '1', '.1.', '1', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('481', null, null, '0', null, '2', '10分钟', 'SAM_Time_Type', null, null, null, '1', '.2.', '2', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('482', null, null, '0', null, '3', '30分钟', 'SAM_Time_Type', null, null, null, '1', '.3.', '3', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('483', null, null, '0', null, '4', '一小时', 'SAM_Time_Type', null, null, null, '1', '.4.', '4', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('484', null, null, '0', null, '5', '一天', 'SAM_Time_Type', null, null, null, '1', '.5.', '5', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('485', null, null, '0', null, 'boss', '业务支撑系统', 'SAM_TreeSecond', null, null, null, '1', '.boss.', '1', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('486', null, null, '0', null, '1', '非授权关系调用', 'SAM_UseAudit_Type', null, null, null, '1', '.1.', '1', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('487', null, null, '0', null, '2', '授权关系未调用', 'SAM_UseAudit_Type', null, null, null, '1', '.2.', '2', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('488', null, null, '0', null, '3', '非授权IP调用', 'SAM_UseAudit_Type', null, null, null, '1', '.3.', '3', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('489', null, null, '0', null, '4', '授权IP未调用', 'SAM_UseAudit_Type', null, null, null, '1', '.4.', '4', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('490', null, null, '0', null, '1', '新建', 'SAM_Verify_Status', null, null, null, '1', '.1.', '1', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('491', null, null, '0', null, '2', '申请注册', 'SAM_Verify_Status', null, null, null, '1', '.2.', '2', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('492', null, null, '0', null, '3', '申请注册未通过', 'SAM_Verify_Status', null, null, null, '1', '.3.', '3', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('493', null, null, '0', null, '4', '同意发布', 'SAM_Verify_Status', null, null, null, '1', '.4.', '4', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('494', null, null, '0', null, '5', '申请注销', 'SAM_Verify_Status', null, null, null, '1', '.5.', '5', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('495', null, null, '0', null, '6', '申请注销未通过', 'SAM_Verify_Status', null, null, null, '1', '.6.', '6', '1', null, null);
INSERT INTO EOS_DICT_ENTRY VALUES ('496', null, null, '0', null, '7', '同意注销', 'SAM_Verify_Status', null, null, null, '1', '.7.', '7', '1', null, null);
