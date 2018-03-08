﻿601,100
602,"}tp_util_is_dim_in_cube"
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
560,7
pCube
pDim_1
pDim_2
pDim_3
pElem_1
pElem_2
pElem_3
561,7
2
2
2
2
2
2
2
590,7
pCube,"None"
pDim_1,""
pDim_2,""
pDim_3,""
pElem_1,""
pElem_2,""
pElem_3,""
637,7
pCube,""
pDim_1,""
pDim_2,""
pDim_3,""
pElem_1,""
pElem_2,""
pElem_3,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,106


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


If (CubeExists(pCube) = 0);
	ProcessError;
EndIf;

If (pDim_1 @<> '' & DimensionExists(pDim_1) = 0);
	ProcessError;
EndIf;

If (pDim_2 @<> '' & DimensionExists(pDim_2) = 0);
	ProcessError;
EndIf;

If (pDim_3 @<> '' & DimensionExists(pDim_3) = 0);
	ProcessError;
EndIf;


If (pElem_1 @<> '' & DIMIX(pDim_1, pElem_1) = 0);
	ProcessError;
EndIf;

If (pElem_2 @<> '' & DIMIX(pDim_2, pElem_2) = 0);
	ProcessError;
EndIf;

If (pElem_3 @<> '' & DIMIX(pDim_3, pElem_3) = 0);
	ProcessError;
EndIf;


NumericGlobalVariable('gDim_1IndexInCube');
NumericGlobalVariable('gDim_2IndexInCube');
NumericGlobalVariable('gDim_3IndexInCube');
StringGlobalVariable('gSecurityOverlayTokenString');
StringGlobalVariable('gImportPattern');
gDim_1IndexInCube = 0;
gDim_2IndexInCube = 0;
gDim_3IndexInCube = 0;
gSecurityOverlayTokenString = '';
gImportPattern = '';


vIndex = 1;
While (vIndex > 0);
	vCubeDim = TABDIM(pCube, vIndex);

	If (vCubeDim @= '');
		vIndex = -1;
	ElseIf (pDim_1 @<> '' & vCubeDim @= pDim_1);	
		gDim_1IndexInCube = vIndex;
		vSingleToken = '1';
		If (pElem_1 @<> '');
			vSinglePattern = pElem_1 | '|';
		Else;
			vSinglePattern = '?|';
		EndIf;
	ElseIf (pDim_2 @<> '' & vCubeDim @= pDim_2);	
		gDim_2IndexInCube = vIndex;
		vSingleToken = '1';
		If (pElem_2 @<> '');
			vSinglePattern = pElem_2 | '|';
		Else;
			vSinglePattern = '?|';
		EndIf;
	ElseIf (pDim_3 @<> '' & vCubeDim @= pDim_3);	
		gDim_3IndexInCube = vIndex;
		vSingleToken = '1';
		If (pElem_3 @<> '');
			vSinglePattern = pElem_3 | '|';
		Else;
			vSinglePattern = '?|';
		EndIf;
	Else;
		vSingleToken = '0';
		vSinglePattern = '*|';
	EndIf;
	
	If (vIndex > 0);
		If (vIndex > 1);
			vSingleToken = ':' | vSingleToken;
		EndIf;
		gSecurityOverlayTokenString = gSecurityOverlayTokenString | vSingleToken;
	EndIf;
	
	gImportPattern = gImportPattern | vSinglePattern;
	
	vIndex = vIndex + 1;
End;

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
