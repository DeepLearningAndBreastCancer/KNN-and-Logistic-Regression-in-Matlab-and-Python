﻿601,100
602,"}tp_workflow_util_bounce_nodes"
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
560,8
pExecutionId
pAppId
pOwnerIdToBounce
pOwnershipNodeToBounce
pSourceNode
pTime
pParentTIUpdateStateCube
pControl
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
pExecutionId,"None"
pAppId,"MyApp"
pOwnerIdToBounce,"NA"
pOwnershipNodeToBounce,"NA"
pSourceNode,"NA"
pTime,"0"
pParentTIUpdateStateCube,"N"
pControl,"N"
637,8
pExecutionId,""
pAppId,""
pOwnerIdToBounce,""
pOwnershipNodeToBounce,""
pSourceNode,""
pTime,""
pParentTIUpdateStateCube,""
pControl,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,231

################################################################
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

cControlPrefix = '';
If (pControl @= 'Y');
	cControlPrefix = '}';
EndIf;

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
'pProcess', cTM1Process, 'pControl', pControl);
If (vReturnValue <> ProcessExitNormal());
	ProcessError;
EndIf;
Endif;

cPrologLog = gPrologLog;
cEpilogLog = gEpilogLog;
cDataLog = gDataLog;
cTM1Log = cPrologLog;

#***

cApprovalDim =  ATTRS('}tp_applications', pAppId,  'ApprovalDimension');
cApprovalSubset =ATTRS('}tp_applications', pAppId,  'ApprovalSubset');
cIsActive =ATTRS('}tp_applications', pAppId, 'IsActive');
cShadowApprovalDim =ATTRS('}tp_applications', pAppId, 'ApprovalShadowDimension');

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, 'get application attributes', cApprovalDim, cApprovalSubset, cIsActive,cShadowApprovalDim );
EndIf;

#*** Log Parameters
If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, TIMST(NOW,'\Y \M \d - \h:\i:\s'),
		'Parameters:', pExecutionId, pAppId, pOwnerIdToBounce, pOwnershipNodeToBounce, pControl);
EndIf;

#***
#constants
cLocked = '4';
cWorkInProgress = '2';
cState = 'State';
cStateCube = cControlPrefix | 'tp_application_state}' | pAppId;
cCurrentOwner = 'CurrentOwner';
cCurrentOwnerId = 'CurrentOwnerId';
cTakeOwnershipNode = 'TakeOwnershipNode';
cStateMeasureDim=cControlPrefix | 'tp_node_info';

#****

#IF (Bounce 0)
IF (pOwnerIdToBounce @<>'' & pOwnershipNodeToBounce @<> '');
	If (cGenerateLog @= 'Y');
		TextOutput(cTM1Log, 'Bounce nodes');
	EndIf;

	###bounce leaf nodes in the package
	IF (DIMIX('}Clients', pOwnerIdToBounce) >0);
		vOwnerToBounce = ATTRS('}Clients', pOwnerIdToBounce, '}TM1_DefaultDisplayValue');
	Else;
		vOwnerToBounce = pOwnerIdToBounce;
	EndIf;
	If (vOwnerToBounce @= '');
		vOwnerToBounce = pOwnerIdToBounce;
	EndIf;

	# *** escape double quotes characters, if found, in the user it (such as CAM user id)

	varX = vOwnerToBounce;
	vPos = SCAN('"', varX );
	If (vPos > 1);
		tempID = '';
		While (vPos > 1);	
			var1 = SUBST(varX , 1, vPos -1) ;
			var2 = SUBST(varX , vPos + 1, LONG(varX ) - vPos);	
			varX  = var2;
			vPos = SCAN('"', varX );
			If (vPos > 1);
				tempID = tempID | var1 | '""' ;
			Else;
				tempID = tempID | var1 | '""' | varX;
			EndIf;
		End;
        		vOwnerToBounce = tempID;
    	EndIf;
	
	#*** Escape the node to ensure valid MDX
	StringGlobalVariable('gEscapedId');
	vReturnValue = ExecuteProcess(cControlPrefix | 'tp_util_escape_id', 
		'pExecutionId', pExecutionId, 'pNode', pSourceNode, 'pControl', pControl);
	If (vReturnValue <> ProcessExitNormal());
		ProcessError;
	EndIf;
	If (cGenerateLog @= 'Y');
		TextOutput(cTM1Log, TIMST(NOW, '\Y-\m-\d \h:\i:\s'), 'Escaped Node name: ' | gEscapedId);
	EndIf;

	vMdx = '{FILTER(TM1FILTERBYLEVEL( TM1SUBSETTOSET([' | cShadowApprovalDim  | '],"' | cApprovalSubset | '"), 0), ';
	vMdx = vMdx | '[' | cStateCube | '].[' | cStateMeasureDim | '].[CurrentOwner]="' | vOwnerToBounce | '"' ;
	vMdx = vMdx | 'AND [' | cStateCube | '].[' | cStateMeasureDim | '].[TakeOwnershipNode]="' | pOwnershipNodeToBounce | '" ),';
	vMdx = vMdx | '[' | cShadowApprovalDim | '].[' | gEscapedId | ']}';

	vSubsetNodesToBounce = 'nodesToBounce_by_' | pExecutionId;
	IF (SubsetExists(cShadowApprovalDim, vSubsetNodesToBounce) <>0);
		SubsetDestroy(cShadowApprovalDim, vSubsetNodesToBounce);
	ENDIF;
	SubsetCreateByMdx(vSubsetNodesToBounce, vMDX);
	SubsetElementInsert(cShadowApprovalDim, vSubsetNodesToBounce, pSourceNode, 0);

	vBounceSize = SubsetGetSize(cShadowApprovalDim, vSubsetNodesToBounce);
	vUpdateAncestorState = 'Y';
	IF (pParentTIUpdateStateCube @= 'T' % pParentTIUpdateStateCube @= 'Y' % vBounceSize >100);
		vUpdateAncestorState = 'N';
	Endif;

	looperBounce = vBounceSize;

	While (looperBounce >=1);
		vNodeBounce =  SubsetGetElementName(cShadowApprovalDim, vSubsetNodesToBounce, looperBounce);
		#IF (Bounce1)
		#exclude dummy node
		IF (vNodeBounce @<> pSourceNode);

			If (cGenerateLog @= 'Y');
				TextOutput(cTM1Log, 'Bounce related nodes');
			EndIf;

			vBounceOwnerId = CellGetS(cStateCube, vNodeBounce, cCurrentOwnerId);
			vBounceOwnershipNode = CellGetS(cStateCube, vNodeBounce, cTakeOwnershipNode);
			vBounceState = CellGetS(cStateCube, vNodeBounce, cState);

			#IF (Bounce2)
			IF (vBounceOwnerId @=pOwnerIdToBounce & vBounceOwnershipNode @= pOwnershipNodeToBounce);

				#IF (Bounce3)
				If ((vBounceState @= '') % (vBounceState @=cWorkInProgress ));
					cBeingEdited = 'BeingEdited';
					cStartEditingDate = 'StartEditingDate';
					cOffline = 'Offline';
					If (cGenerateLog @= 'Y');
						TextOutput(cTM1Log, 'clean state fields');
					EndIf;

					CellPutS('', cStateCube, vNodeBounce, cCurrentOwner);
					CellPutS('', cStateCube, vNodeBounce, cCurrentOwnerId);
					CellPutS('', cStateCube, vNodeBounce, cTakeOwnershipNode);
					#***

					CellPutS('', cStateCube, vNodeBounce, cBeingEdited);
					CellPutS('', cStateCube, vNodeBounce, cStartEditingDate);
					CellPutS('', cStateCube, vNodeBounce, cOffline);

					#***
					#change state
					If (cGenerateLog @= 'Y');
						TextOutput(cTM1Log, 'Change state');
					EndIf;

					vReturnValue = ExecuteProcess(cControlPrefix | 'tp_workflow_change_node_state', 'pExecutionId', pExecutionId,
						'pTime', pTime, 'pAppId', pAppId, 'pNode', vNodeBounce, 'pPrivilege', 'BOUNCE','pUpdateAncestorState',vUpdateAncestorState,'pControl', pControl);
					If (vReturnValue <> ProcessExitNormal());
						ProcessError;
					EndIf;

				#***
				#IF (Bounce3)
				ENDIF;
			#***
			#IF (Bounce2)
			ENDIF;

		#IF (Bounce1)
		ENDIF;

		looperBounce = looperBounce-1;
	END;


	IF (pParentTIUpdateStateCube @='N' & vBounceSize >100);
		#We need to call }tp_update_state_cube to update state for all consolidated nodes
		vReturnValue = ExecuteProcess(cControlPrefix | 'tp_update_state_cube', 'pGuid', pExecutionId,'pAppId', pAppId, 'pUpdateLeafState', 'N', 'pControl', pControl);
								
		If (vReturnValue <> ProcessExitNormal());
			ProcessError;
		EndIf;

	Endif; 

#IF (Bounce 0)
ENDIF;

#Finally take out DR on consolidation level

If (cGenerateLog @= 'Y');
	TextOutput(cTM1Log, 'revoke ownership on consolidation');
EndIf;

vReturnValue = ExecuteProcess(cControlPrefix | 'tp_reserve_slice', 'pExecutionId', pExecutionId, 
	'pAppId', pAppId, 'pNode', pOwnershipNodeToBounce, 'pApprovalDim', cApprovalDim, 'pReserve', 'N', 'pUser', pOwnerIdToBounce, 'pControl', pControl);
If (vReturnValue <> ProcessExitNormal());
	ProcessError;
EndIf;



573,1

574,1

575,22


#################################################################
## IBM Confidential
##
## OCO Source Materials
##
## BI and PM: pmpsvc
##
## (C) Copyright IBM Corp. 2008, 2009
##
## The source code for this program is not published or otherwise
## divested of its trade secrets, irrespective of what has been
## deposited with the U.S. Copyright Office.
#################################################################


IF (SubsetExists(cShadowApprovalDim, vSubsetNodesToBounce ) <>0);
SubsetDestroy(cShadowApprovalDim, vSubsetNodesToBounce );
ENDIF;


576,
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