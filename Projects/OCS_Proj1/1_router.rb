# Cisco IOS Software, 3700 Software (C3725-ADVENTERPRISEK9-M), Version 12.4(15)T1
## COPY AND PAST THIS SECTION
==========================================================
en
conf t

service password-encryption
!
hostname OCS_R1
!

aaa new-model
username admin privilege 15 secret cisco
username python privilege 15 secret cisco
aaa local authentication attempts max-fail 3
aaa authentication login default local
!
enable secret cisco
!
!
no ip domain lookup 
!        
!
interface FastEthernet0/0
 description *****COMCAST****
 ip address dhcp
 duplex full
 speed 100
 shut
!
interface FastEthernet0/1
 description ****AT&T*******
 no ip address
 shutdown
 duplex full
 speed 100
!         
interface FastEthernet1/0
 no ip address
 shutdown
 duplex auto
 speed auto
!
interface FastEthernet2/0
 no ip address
 shutdown
 duplex full
 speed 100
!
=====================================================================
## NOW  COPY AND PAST THIS SECTION

banner login %
****************************************************************
             WARNING!! WARNING!!                               *
IF YOUR HAVE NOT BEEN AUTHORIZED TO ACCESS THIS EQUIPMENT STOP!*
UNAUTHORIZED USE CONSTITUTES CONSENT TO MONITORING OF THIS     *
SYSTEM AND WILL RESULT IN CRIMINAL PROSECUTION!!!!!!!!!!!!     *
---------------------------------------------------------------*
****************************************************************
%
!

banner motd %
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
%


!
banner login %
****************************************************************************
WARNING: THERE IS NO EXPECTATION OF PRIVACY WHEN USING THIS SYSTEM
---------------------------------------------------------------------------
ANY UNAUTHORIZED ACCESS OR USE OF THIS EQUIPMENT IS PROHIBITED AND 
CONSTITUES AN OFFENCES UNDER THE COPMUTER MISUSE ACT 1990.
IF YOU ARE NOT AUTHORIZED TO ACCESS THIS SYSTEM, 
        TERMINATE THIS SESSION IMMEDIATELY......
****************************************************************************
%
!

=======================================================================================
## Lastly copy these


ip domain-name ocs.com 
crypto key generate rsa modulus 1024  
ip ssh version 2
ip ssh time-out 60
ip ssh authentication-retries 5
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
 exec-timeout 2 0
 transport input ssh
 privilege level 15
!
!
end

wr

show run
