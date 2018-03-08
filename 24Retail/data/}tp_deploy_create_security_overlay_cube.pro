﻿601,100
602,"}tp_deploy_create_security_overlay_cube"
562,"NULL"
586,
585,
564,
565,"fCWHoaaDWRNE?\z[=m62bHS9x_o;lz3k0DsW3sC67wz?zcEO9gx:>2]hXx9DLy_eXHVTN[9fSM8LuNtTIgRN;OD\0qOVuu^]G]FxIvLVn8l\wxwH6]JIX6G]g=FIw7db\@a=DYxPLBs?_osMUCh:?SWuoe]?oVIFgXstcbUHu5nTs?F>LnxogwefjKEzPGtt\UwrfyAX"
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
570,
571,
569,0
592,0
599,1000
560,3
pExecutionId
pAppId
pCubeName
561,3
2
2
2
590,3
pExecutionId,"None"
pAppId,"None"
pCubeName,"None"
637,3
pExecutionId,""
pAppId,""
pCubeName,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,104
#################################################################
## IBM Confidential
##
## OCO Source Materials
##
## BI and PM: pmpsvc
##
## (C) Copyright IBM Corp. 2008, 2009, 2010
##
## The source code for this program is not published or otherwise
## divested of its trade secrets, irrespective of what has been
## deposited with the U.S. Copyright Office.
#################################################################

cControlPrefix = '}';

#*** Log File Name
cConfigDim = cControlPrefix | 'tp_config';
If (DimensionExists(cConfigDim) = 1);
	cGenerateLog = ATTRS(cConfigDim, 'Generate TI Log', 'String Value');
Else;
	cGenerateLog = 'N';
EndIf;

cTM1Process = GetProcessName();
StringGlobalVariable('gPrologLog');
StringGlobalVariable('gEpilogLog');
StringGlobalVariable('gDataLog');

IF (cGenerateLog @= 'Y' % cGenerateLog @= 'T');
vReturnValue = ExecuteProcess(cControlPrefix | 'tp_get_log_file_names', 'pExecutionId', pExecutionId,
'pProcess', cTM1Process, 'pControl', 'Y');
If (vReturnValue <> ProcessExitNormal());
	ProcessError;
EndIf;
Endif;

cPrologLog = gPrologLog;
cEpilogLog = gEpilogLog;
cDataLog = gDataLog;
cTM1Log = cPrologLog;

#***
cTaskNavDimensions = '}tp_task_navigation_dims}' | pAppId;
cTaskNavigationCube = '}tp_task_navigations}' | pAppId;
#***
cApprovalDIM = ATTRS(cControlPrefix | 'tp_applications', pAppId, 'ApprovalDimension');
cVersionDim = ATTRS('}tp_applications', pAppId, 'VersionDimension');
vCubeName = pCubeName;

#***create Security overlay cube
If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Check for security overly cube and RD cell security cube for ' | vCubeName);
EndIf;

vSecuirtyOverlayCube = '}SecurityOverlayGlobal_' | vCubeName;
vCellSecurityPermissionCube = '}CellSecurity_}tp_application_permission}' | pAppId;			
vDimIndex =1;
vDimension = TABDIM(vCubeName, vDimIndex);
vTokenString = '';
vNavDimensionFound = 'F';
vVersionFound = 'F';
While (vDimension @<> '');
	vTotalNavDimensions = DIMSIZ(cTaskNavDimensions);
	vNavLooper = 1;
	vIsNavDimension = 'F';
	While (vNavLooper <= vTotalNavDimensions);
		vNavDimension = DIMNM(cTaskNavDimensions, vNavLooper);
		IF (vDimension @= vNavDimension);
			vIsNavDimension = 'T';
		Endif;

		vNavLooper = vNavLooper +1;
	End;

	IF (vIsNavDimension @= 'T');
		vSingleToken = '1';
		vNavDimensionFound  = 'T';
	ElseIF (vDimension @= cVersionDim);
		vSingleToken = '1';
		vVersionFound = 'T';
	Else;
		vSingleToken = '0';
	EndIf;

	IF (vDimIndex > 1);
		vSingleToken = ':' | vSingleToken;
	Endif;

	vTokenString = vTokenString | vSingleToken;
	vDimIndex = vDimIndex +1;
	vDimension = TABDIM(vCubeName, vDimIndex);
End;

IF (vNavDimensionFound  @= 'T');
	IF (CubeExists(vSecuirtyOverlayCube) = 0);
		SecurityOverlayCreateGlobalDefault(vCubeName, vTokenString);
	Endif;
Endif;

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'The end has been reached.');
EndIf;

573,1

574,1

575,1

576,
930,0
638,1
804,0
1217,0
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
