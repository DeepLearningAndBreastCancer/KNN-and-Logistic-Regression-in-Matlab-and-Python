﻿601,100
602,"}Drill_ProductAnalysis"
562,"VIEW"
586,"Revenue"
585,"Revenue"
564,
565,"vH7VSE9ZUrhMhnA?i00Wzwatoq8kM3Bw^sqnhCN>Bok^vxHq0UnWN^7`g;o;KX>?PI4uzF;ybN6cfC3EqY:p]nbm00;98Qb2OidHk<>>X:imKtY2I_:8Zsxx6uhOKmQA@ckgGh3ffe^rdM80xJ9C1`M_vYlzw20ql\9VR53astxifYJurke`8R@BJ0y>SrOaxd4F1@Wt"
559,1
928,0
593,
594,
595,
597,
598,
596,
800,
801,
566,0
567,","
588,"."
589,
568,""""
570,Drill
571,
569,0
592,0
599,1000
560,8
cubename
organization
Channel
product
Month
Year
Version
Revenue
561,8
2
2
2
2
2
2
2
2
590,8
cubename,"Revenue"
organization,"100"
Channel,"Channel Total"
product,"20000"
Month,"Year"
Year,"Y1"
Version,"Version 1"
Revenue,"Unit Price"
637,8
cubename,""
organization,""
Channel,""
product,""
Month,""
Year,""
Version,""
Revenue,""
577,3
NVALUE
SVALUE
VALUE_IS_STRING
578,3
1
2
1
579,3
0
0
0
580,3
0
0
0
581,3
0
0
0
582,8
IgnoredInputVarName=organizationVarType=32ColType=1165
IgnoredInputVarName=ChannelVarType=32ColType=1165
IgnoredInputVarName=RevenueVarType=32ColType=1165
IgnoredInputVarName=V4VarType=32ColType=1165
IgnoredInputVarName=VersionVarType=32ColType=1165
IgnoredInputVarName=productVarType=32ColType=1165
IgnoredInputVarName=V7VarType=32ColType=1165
IgnoredInputVarName=ValueVarType=33ColType=1165
931,1
0,0,0,0,0,0,0,0,
603,0
572,22

#****Begin: Generated Statements***
#****End: Generated Statements****

#
# Get Member name of the Version that you are drilling from
#
vMemberName=DimensionElementPrincipalName( 'Version', Version);
#
# If the Dasboard version, then drill to the Current Version
#
IF (vMemberName @= 'Dashboard');
   vDashboard = cellgetS('Calendar','Current Version','String');
   Version = vDashboard;
ENDIF;
#
# If the DasboardCA version, then drill to the Current Version
#
IF (vMemberName @= 'DashboardCA');
   vDashboard = cellgetS('Calendar','Compare Against','String');
   Version = vDashboard;
ENDIF;
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,4

#****Begin: Generated Statements***
RETURNVIEWHANDLE('Revenue','Drill');
#****End: Generated Statements****
576,CubeAction=1511DataAction=1503CubeLogChanges=0
930,0
638,1
804,0
1217,1
900,
901,
902,
938,0
937,
936,
935,
934,
932,0
933,0
903,
906,
929,
907,
908,
904,0
905,0
909,0
911,
912,
913,
914,
915,
916,
917,0
918,1
919,0
920,50000
921,""
922,""
923,0
924,""
925,""
926,""
927,""
