﻿601,100
602,"}Drill_JobTypeAssumption"
562,"VIEW"
586,"Job Type Assumption"
585,"Job Type Assumption"
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
560,6
cubename
organization
EmployeeList
pYear
Version
Employee
561,6
2
2
2
2
2
2
590,6
cubename,"Employee"
organization,"100"
EmployeeList,"Total"
pYear,"Y1"
Version,"Version 1"
Employee,"Name/Desc"
637,6
cubename,""
organization,""
EmployeeList,""
pYear,""
Version,""
Employee,""
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
582,5
IgnoredInputVarName=vVersionVarType=32ColType=1165
IgnoredInputVarName=JobTypeVarType=32ColType=1165
IgnoredInputVarName=JobTypeAssumptionVarType=32ColType=1165
IgnoredInputVarName=V4VarType=32ColType=1165
IgnoredInputVarName=ValueVarType=33ColType=1165
931,1
0,0,0,0,0,
603,0
572,30

#****Begin: Generated Statements***
#****End: Generated Statements****


Job=CELLGETS('Employee',organization,employeelist,pyear,version,'Job Type');

IF(SubsetGetSize('JobType','Drill')>0);
SubsetDeleteAllElements('JobType','Drill');
ENDIF;
SubsetElementInsert('JobType','Drill',Job,1);

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
573,4

#****Begin: Generated Statements***
#****End: Generated Statements****

574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,4

#****Begin: Generated Statements***
RETURNVIEWHANDLE('Job Type Assumption','Drill');
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
