iPaaS Openshift Cartridge using FSW
==============================

Overview
--------
* Provides an Openshift Enterprise (OSE) cartridge with full suite of Red Hat Fuse Service Works functionality.  
* A view of the deployment architecture of a gear using this cartridge can be found [here.](https://raw.github.com/jboss-gpe-ose/openshift-origin-cartridge-fsw-full/master/doc/images/bpmPaaS-standalone-deployment-architecture.png)
* This cartridge is essentially a fork of the OSE jbosseap cartridge.
  Subsequently, most of administration guidelines documented in the jbosseap cartridge apply to this cartridge.
* As of 10 Feb. 2014, the version of FSW 6 used is from :  jboss-fsw-installer-6.0.0.GA-redhat-4.jar


Details
-------
* This cartridge relies on RPMs.  In particular:

1. [an RPM](https://github.com/jboss-gpe-ose/jboss_bpm_soa_rpmbuild) that pre-installs JBoss EAP 6.1.1 on an Openshift Enterprise _node_.  NOTE:  This cartridge does not rely on the JBoss EAP available through the jbappplatform channel of the Red Hat Network.  The release cycle of JBoss EAP from that channel is not in sync with releases of FSW.  ie:  to-date, the version of EAP available from the jbappplatform channel is 6.2.  FSW6 has a hard-requirement on EAP 6.1.1 specifically.
2. [an RPM](https://github.com/jboss-gpe-ose/fsw_rpmbuild)  that pre-installs FSW6 modules and web artifacts on an Openshift Enterprise _node_.


The size of EAP 6.1.1 + FSW6  makes bundling of all of this within this downloadable cartridge impratical.  Because of the use of custom RPMs, this cartridge will only work on those Openshift Enterprise environments that have installed these custom RPMs.  Subsequently, this cartridge will not currently work on Openshift Online.  The medium term strategy is that these RPMs would eventually be added to a yet to be created FSW _channel_ on the Red Hat Network.

* This cartridge relies on the MySQL database provided by the OSE MySQL cartridge.
* In particular, MySQL is used to maintain both bpel, jbpm, rtgov and sramp databases
* This cartridge adheres to the OSE 1.2 cartridge specification.

  

INITIAL SETUP          
--------------------
1.  Create an OSE 1.2 environment that supports a medium gear size
2.  Install OSE 1.2 rhc tools
3.  Review the jboss_bpm_soa RPM found [here](https://github.com/jboss-gpe-ose/jboss_bpm_soa_rpmbuild)
4.  On your OSE nodes, install the jboss_bpm_soa RPM    
5.  Review the fsw RPM found [here](https://github.com/jboss-gpe-ose/fsw_rpmbuild)
7.  On your OSE nodes, install the fsw RPM    
8.  Delete any previous fsw related OSE applications that you may have previously created:
      rhc app delete -a fsw
9.  Create the *full* FSW6 *full* OSE application :
      rhc create-app fsw "http://cartreflect-claytondev.rhcloud.com/reflect?github=jboss-gpe-ose/openshift-origin-cartridge-fsw-full&commit=master" -g medium
            or
      rhc create-app fsw "http://cartreflect-claytondev.rhcloud.com/reflect?github=jboss-gpe-ose/openshift-origin-cartridge-fsw-full&commit=master" -g int_dev_medium
10. Add mysql cartridge:
      rhc cartridge add -a fsw -c mysql-5.1
11. execute:   rhc cartridge-restart fsw -a fsw
    - after several minutes, should expect to see the following as the last line in $HOME/fsw/standalone/log/server.log :



TEST
--------------------
    
    
TODO
----
1)  Upgrade to OSE cartridge specification 2.0
2)  MySQL cartridge should be an automatic child dependency such that steps 10 and 11 are eliminated.
