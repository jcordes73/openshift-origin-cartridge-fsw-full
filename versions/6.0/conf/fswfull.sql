create database if not exists demo;
grant all on demo.* to 'demo'@'${env.OPENSHIFT_BPMS_IP}' identified by '${env.OPENSHIFT_MYSQL_DB_USERNAME}';
