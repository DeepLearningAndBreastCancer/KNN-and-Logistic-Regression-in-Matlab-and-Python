﻿601,100
602,"}tp_mdx_find_descendants"
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
560,6
pExecutionId
pDim
pSubset
pNode
pDepth
pSelf
561,6
2
2
2
2
2
2
590,6
pExecutionId,"None"
pDim,"None"
pSubset,"None"
pNode,"None"
pDepth,"None"
pSelf,"Y"
637,6
pExecutionId,""
pDim,""
pSubset,""
pNode,""
pDepth,""
pSelf,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,63


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



#*** Check dimension
If (DimensionExists(pDim) = 0);
ProcessError;
EndIf;

#*** Check node in dimension
If (DIMIX(pDim, pNode) = 0);
ProcessError;
EndIf;

cNodePName = DimensionElementPrincipalName(pDim, pNode);

#*** Check depth

cDepth = NUMBR(pDepth);
If (cDepth < 0);
ProcessError;
Else;
cDepth = cDepth + 1;
EndIf;

#*** Create MDX

StringGlobalVariable('gMdxFindDescendants');

If (pSelf @= 'Y');
vMDX1 = 'DESCENDANTS([' | pDim | '].[' | cNodePName | '], 0, SELF_AND_AFTER)';
Else;
vMDX1 = 'DESCENDANTS([' | pDim | '].[' | cNodePName | '], 0, AFTER)';
EndIf;

vMDX2 = 'DESCENDANTS([' | pDim | '].[' | cNodePName | '], ' | TRIM(STR(cDepth, 5, 0)) | ', SELF_AND_AFTER)';
vMDX3 = 'EXCEPT(' | vMDX1 | ', ' | vMDX2 | ')';
If (SubsetExists(pDim, pSubset) = 0);
gMdxFindDescendants = vMDX3;
Else;
If (CubeExists(pDim) = 0);
vMDX4 = 'INTERSECT(TM1SubsetToSet([' | pDim | '], "' | pSubset | '"), ' | vMDX3 | ')';
Else;
vMDX4 = 'INTERSECT(TM1SubsetToSet([' | pDim | '].[' | pDim | '], "' | pSubset | '"), ' | vMDX3 | ')';
EndIf;
gMdxFindDescendants = vMDX4;
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
