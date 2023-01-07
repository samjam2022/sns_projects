#Cisco IOS Software, Linux Software (I86BI_LINUX_L2-ADVENTERPRISEK9-M), Version 15.6(0.9)S
## COPY AND PAST THIS AREA
===========================================================================================
conf t

service pass

hostname OCS_SW1
!

aaa new-model
username admin privilege 15 secret cisco
username python priviege 15 secret cisco
aaa local authentication attempts max-fail 3
aaa authentication login default local
!
!
enable secret cisco

vtp mode transparent
!        

no ip domain lookup

ip domain-name ocs.com 
crypto key generate rsa modulus 1024  
ip ssh version 2
ip ssh time-out 60
ip ssh authentication-retries 2
!

interface range e0/0-3, e1/0-3, e2/0-3, e3/0-3
 shutdown
 duplex full
!
=================================================================================================
## NOW THIS AREA!!
=================================================================================================

banner motd #
****************************************************************************
                    PROPERTY OF Omalies Coffee Shop
Detroit,MI USA
USE OF OMALIES COFFEE SHOP SYSTEM, AUTHORIZED OR UNAUTHORIZED,
CONSTITUTES CONSENT TO MONITORING OF THIS SYSTEM. UNAUTHORIZED USE
MAY SUBJECT YOU TO CRIMINAL PROSECUTION. EVIDENCE OF UNAUTHORIZED USE
COLLECTED DURING MONITORING MAY BE USED FOR ADMINISTRATIVE, CRIMINAL
OR OTHER ADVERSE ACTION. USE OF THIS SYSTEM CONSTITUTES CONSENT TO
MONITORING FOR THESE PURPOSE
****************************************************************************
#
!
banner login !
****************************************************************************
WARNING: THERE IS NO EXPECTATION OF PRIVACY WHEN USING THIS SYSTEM
---------------------------------------------------------------------------
ANY UNAUTHORIZED ACCESS OR USE OF THIS EQUIPMENT IS PROHIBITED AND 
CONSTITUES AN OFFENCES UNDER THE COPMUTER MISUSE ACT 1990.
IF YOU ARE NOT AUTHORIZED TO ACCESS THIS SYSTEM, 
        TERMINATE THIS SESSION IMMEDIATELY......
****************************************************************************
!
===============================================================================================
## copy and past last
================================================================================================
!
!
line con 0
 exec-timeout 0 0
 login authentication default
 logging synchronous
 privilege level 15
  
line aux 0
 transport input none
 transport output none
 no exec
 exec-timeout 0 1
 no password

line vty 0 4
 login authentication default
 exec-timeout 0 0
 transport input ssh
 privilege level 15
!
end


wr

show run

