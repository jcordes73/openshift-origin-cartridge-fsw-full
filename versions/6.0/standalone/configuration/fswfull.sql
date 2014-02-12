create database if not exists bpel;
grant all on bpel.* to 'bpel'@'${env.OPENSHIFT_BPMS_IP}' identified by '${env.OPENSHIFT_MYSQL_DB_USERNAME}';
create database if not exists gs;
grant all on gs.* to 'gs'@'${env.OPENSHIFT_BPMS_IP}' identified by '${env.OPENSHIFT_MYSQL_DB_USERNAME}';
create database if not exists jbpm;
grant all on jbpm.* to 'jbpm'@'${env.OPENSHIFT_BPMS_IP}' identified by '${env.OPENSHIFT_MYSQL_DB_USERNAME}';
create database if not exists rtgov;
grant all on rtgov.* to 'rtgov'@'${env.OPENSHIFT_BPMS_IP}' identified by '${env.OPENSHIFT_MYSQL_DB_USERNAME}';
create database if not exists sramp;
grant all on sramp.* to 'sramp'@'${env.OPENSHIFT_BPMS_IP}' identified by '${env.OPENSHIFT_MYSQL_DB_USERNAME}';

create database if not exists demo;
grant all on demo.* to 'demo'@'${env.OPENSHIFT_BPMS_IP}' identified by '${env.OPENSHIFT_MYSQL_DB_USERNAME}';
