﻿601,100
602,"}tp_dyn_util_instant_action"
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
560,1
pExecutionId
561,1
2
590,1
pExecutionId,"None"
637,1
pExecutionId,""
577,0
578,0
579,0
580,0
581,0
582,0
603,0
572,42
#******
#******
#***BEGIN(Prolog): }tp_dyn_util_instant_action
#******
cCognosEveryoneGroup = 'CAMID("::Everyone")';
cTpEveryoneGroup = '}tp_Everyone';
If (DIMIX('}Groups', cCognosEveryoneGroup) <> 0);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__enter__classic_approval', cCognosEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__own__classic_approval', cCognosEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__check-bounce-message__classic_approval', cCognosEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__release__classic_approval', cCognosEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__save__classic_approval', cCognosEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__submit__classic_approval', cCognosEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__submit-leaf-children__classic_approval', cCognosEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__reject__classic_approval', cCognosEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__check-reject-bounce__classic_approval', cCognosEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__reject-own__classic_approval', cCognosEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__offline__classic_approval', cCognosEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__online__classic_approval', cCognosEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__leave__classic_approval', cCognosEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__execute_action__classic_approval', cCognosEveryoneGroup);
EndIf;
If (DIMIX('}Groups', cTpEveryoneGroup) <> 0);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__enter__classic_approval', cTpEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__own__classic_approval', cTpEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__check-bounce-message__classic_approval', cTpEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__release__classic_approval', cTpEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__save__classic_approval', cTpEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__submit__classic_approval', cTpEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__submit-leaf-children__classic_approval', cTpEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__reject__classic_approval', cTpEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__check-reject-bounce__classic_approval', cTpEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__reject-own__classic_approval', cTpEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__offline__classic_approval', cTpEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__online__classic_approval', cTpEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__leave__classic_approval', cTpEveryoneGroup);
CellPutS('READ', '}ProcessSecurity', '}tp_workflow__execute_action__classic_approval', cTpEveryoneGroup);
EndIf;
#******
#***END(Prolog): }tp_dyn_util_instant_action
#******

573,1

574,1

575,1

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
