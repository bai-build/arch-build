--- xpp/mpptalk.c~	2021-05-20 09:04:43.500432617 +0900
+++ xpp/mpptalk.c	2021-05-20 09:05:02.303614427 +0900
@@ -208,7 +208,7 @@
 	);
 
 
-union XTALK_PDATA(MPP) {
+static union XTALK_PDATA(MPP) {
 		MEMBER(MPP, STATUS_GET);
 		MEMBER(MPP, STATUS_GET_REPLY);
 		MEMBER(MPP, EEPROM_SET);