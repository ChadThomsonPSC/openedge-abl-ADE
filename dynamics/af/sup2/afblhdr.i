/*********************************************************************
* Copyright (C) 2000 by Progress Software Corporation. All rights    *
* reserved. Prior versions of this work may contain portions         *
* contributed by participants of Possenet.                           *
*                                                                    *
*********************************************************************/
/* af/sup2/afblhdr.i - business logic procedure header file.

This file contains a list of standard parameters that are required in 
a business logic procedure call.

Parameters:
  pcInput        - allows the user to pass in a standard character parameter
                   as required.

  phParamTable   - allows input of parameters beyond what can be stored in 
                   pcInput

  pcIOParam      - Input-Output character variable for returning a character
                   string to the caller

  piNoTables     - Number of tables being returned.

  pcRetVal       - Return Value string

  TTPARAM01 - 20 - If defined, these parameters name the temp-tables. If not
                   defined, the procedure takes                   


*/

DEFINE INPUT PARAMETER           pcInput        AS CHARACTER NO-UNDO.
DEFINE INPUT-OUTPUT TABLE-HANDLE phParamTable.
DEFINE INPUT-OUTPUT PARAMETER    pcIOParam      AS CHARACTER NO-UNDO.
DEFINE OUTPUT PARAMETER          piNoTables     AS INTEGER   NO-UNDO.
DEFINE OUTPUT PARAMETER          pcRetVal       AS CHARACTER NO-UNDO.
DEFINE INPUT-OUTPUT PARAMETER    pmPtr          AS MEMPTR.

&IF DEFINED(TTPARAM01) NE 0 AND
    DEFINED(TTNAME01) NE 0 &THEN
DEFINE INPUT-OUTPUT {&TTPARAM01} FOR {&TTNAME01}.
&ELSE
DEFINE INPUT-OUTPUT TABLE-HANDLE phTT01.
&ENDIF

&IF DEFINED(TTPARAM02) NE 0 AND
    DEFINED(TTNAME02) NE 0 &THEN
DEFINE INPUT-OUTPUT {&TTPARAM02} FOR {&TTNAME02}.
&ELSE
DEFINE INPUT-OUTPUT TABLE-HANDLE phTT02.
&ENDIF

&IF DEFINED(TTPARAM03) NE 0 AND
    DEFINED(TTNAME03) NE 0 &THEN
DEFINE INPUT-OUTPUT {&TTPARAM03} FOR {&TTNAME03}.
&ELSE
DEFINE INPUT-OUTPUT TABLE-HANDLE phTT03.
&ENDIF

&IF DEFINED(TTPARAM04) NE 0 AND
    DEFINED(TTNAME04) NE 0 &THEN
DEFINE INPUT-OUTPUT {&TTPARAM04} FOR {&TTNAME04}.
&ELSE
DEFINE INPUT-OUTPUT TABLE-HANDLE phTT04.
&ENDIF

&IF DEFINED(TTPARAM05) NE 0 AND
    DEFINED(TTNAME05) NE 0 &THEN
DEFINE INPUT-OUTPUT {&TTPARAM05} FOR {&TTNAME05}.
&ELSE
DEFINE INPUT-OUTPUT TABLE-HANDLE phTT05.
&ENDIF

&IF DEFINED(TTPARAM06) NE 0 AND
    DEFINED(TTNAME06) NE 0 &THEN
DEFINE INPUT-OUTPUT {&TTPARAM06} FOR {&TTNAME06}.
&ELSE
DEFINE INPUT-OUTPUT TABLE-HANDLE phTT06.
&ENDIF

&IF DEFINED(TTPARAM07) NE 0 AND
    DEFINED(TTNAME07) NE 0 &THEN
DEFINE INPUT-OUTPUT {&TTPARAM07} FOR {&TTNAME07}.
&ELSE
DEFINE INPUT-OUTPUT TABLE-HANDLE phTT07.
&ENDIF

&IF DEFINED(TTPARAM08) NE 0 AND
    DEFINED(TTNAME08) NE 0 &THEN
DEFINE INPUT-OUTPUT {&TTPARAM08} FOR {&TTNAME08}.
&ELSE
DEFINE INPUT-OUTPUT TABLE-HANDLE phTT08.
&ENDIF

&IF DEFINED(TTPARAM09) NE 0 AND
    DEFINED(TTNAME09) NE 0 &THEN
DEFINE INPUT-OUTPUT {&TTPARAM09} FOR {&TTNAME09}.
&ELSE
DEFINE INPUT-OUTPUT TABLE-HANDLE phTT09.
&ENDIF

&IF DEFINED(TTPARAM10) NE 0 AND
    DEFINED(TTNAME10) NE 0 &THEN
DEFINE INPUT-OUTPUT {&TTPARAM10} FOR {&TTNAME10}.
&ELSE
DEFINE INPUT-OUTPUT TABLE-HANDLE phTT10.
&ENDIF

&IF DEFINED(TTPARAM11) NE 0 AND
    DEFINED(TTNAME11) NE 0 &THEN
DEFINE INPUT-OUTPUT {&TTPARAM11} FOR {&TTNAME11}.
&ELSE
DEFINE INPUT-OUTPUT TABLE-HANDLE phTT11.
&ENDIF

&IF DEFINED(TTPARAM12) NE 0 AND
    DEFINED(TTNAME12) NE 0 &THEN
DEFINE INPUT-OUTPUT {&TTPARAM12} FOR {&TTNAME12}.
&ELSE
DEFINE INPUT-OUTPUT TABLE-HANDLE phTT12.
&ENDIF

&IF DEFINED(TTPARAM13) NE 0 AND
    DEFINED(TTNAME13) NE 0 &THEN
DEFINE INPUT-OUTPUT {&TTPARAM13} FOR {&TTNAME13}.
&ELSE
DEFINE INPUT-OUTPUT TABLE-HANDLE phTT13.
&ENDIF

&IF DEFINED(TTPARAM14) NE 0 AND
    DEFINED(TTNAME14) NE 0 &THEN
DEFINE INPUT-OUTPUT {&TTPARAM14} FOR {&TTNAME14}.
&ELSE
DEFINE INPUT-OUTPUT TABLE-HANDLE phTT14.
&ENDIF

&IF DEFINED(TTPARAM15) NE 0 AND
    DEFINED(TTNAME15) NE 0 &THEN
DEFINE INPUT-OUTPUT {&TTPARAM15} FOR {&TTNAME15}.
&ELSE
DEFINE INPUT-OUTPUT TABLE-HANDLE phTT15.
&ENDIF

&IF DEFINED(TTPARAM16) NE 0 AND
    DEFINED(TTNAME16) NE 0 &THEN
DEFINE INPUT-OUTPUT {&TTPARAM16} FOR {&TTNAME16}.
&ELSE
DEFINE INPUT-OUTPUT TABLE-HANDLE phTT16.
&ENDIF

&IF DEFINED(TTPARAM17) NE 0 AND
    DEFINED(TTNAME17) NE 0 &THEN
DEFINE INPUT-OUTPUT {&TTPARAM17} FOR {&TTNAME17}.
&ELSE
DEFINE INPUT-OUTPUT TABLE-HANDLE phTT17.
&ENDIF

&IF DEFINED(TTPARAM18) NE 0 AND
    DEFINED(TTNAME18) NE 0 &THEN
DEFINE INPUT-OUTPUT {&TTPARAM18} FOR {&TTNAME18}.
&ELSE
DEFINE INPUT-OUTPUT TABLE-HANDLE phTT18.
&ENDIF

&IF DEFINED(TTPARAM19) NE 0 AND
    DEFINED(TTNAME19) NE 0 &THEN
DEFINE INPUT-OUTPUT {&TTPARAM19} FOR {&TTNAME19}.
&ELSE
DEFINE INPUT-OUTPUT TABLE-HANDLE phTT19.
&ENDIF

&IF DEFINED(TTPARAM20) NE 0 AND
    DEFINED(TTNAME20) NE 0 &THEN
DEFINE INPUT-OUTPUT {&TTPARAM20} FOR {&TTNAME20}.
&ELSE
DEFINE INPUT-OUTPUT TABLE-HANDLE phTT20.
&ENDIF


