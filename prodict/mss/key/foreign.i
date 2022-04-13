/*********************************************************************
* Copyright (C) 2011 by Progress Software Corporation. All rights    *
* reserved. Prior versions of this work may contain portions         *
* contributed by participants of Possenet.                           *
*                                                                    *
*********************************************************************/

/*----------------------------------------------------------------------------

File: foreign.i

Description:   
   This file contains the form for Foreign Constraints.

HISTORY
Author: Kumar Mayur

Date Created:08/05/2011
----------------------------------------------------------------------------*/
{prodict/mss/key/check.i }

/* Query definitions                                                    */
DEFINE {1} VARIABLE modf AS CHARACTER FORMAT "X(12)":U 
     &IF "{&WINDOW-SYSTEM}" <> "TTY"
     &THEN  LABEL "Constraint Action." 
     &ELSE   LABEL "Con Action" 
     &ENDIF
    
     VIEW-AS COMBO-BOX INNER-LINES 3
     LIST-ITEMS "NONE","CASCADE","SET NULL","SET DEFAULT" 
     DROP-DOWN-LIST
     SIZE 19 BY 1 NO-UNDO.
     
DEFINE  VARIABLE counter AS INTEGER NO-UNDO.
DEFINE  VARIABLE flg     AS LOGICAL NO-UNDO.
DEFINE {1} QUERY BROWSE-PAR FOR 
      temp-parent SCROLLING.

DEFINE {1} QUERY BROWSE-PAR1 FOR 
      temp-parent1 SCROLLING.

DEFINE {1} QUERY BROWSE-CHILD FOR 
      temp-child SCROLLING.

DEFINE {1} QUERY BROWSE-CHILD1 FOR 
      temp-child1 SCROLLING.

/* Browse definitions                                                   */

DEFINE {1} BROWSE BROWSE-PAR
    QUERY BROWSE-PAR NO-LOCK DISPLAY
       temp-parent.ptb  FORMAT "x(14)":U
       temp-parent.pidx FORMAT "x(14)":U
       
    WITH NO-ROW-MARKERS SEPARATORS
    &IF "{&WINDOW-SYSTEM}" <> "TTY"
    &THEN SIZE 35 BY 3.5 FIT-LAST-COLUMN.
    &ELSE SIZE 35 BY 6 FIT-LAST-COLUMN.
    &ENDIF 

 DEFINE BROWSE BROWSE-PAR1
    QUERY BROWSE-PAR1 NO-LOCK DISPLAY
       temp-parent1.idxn FORMAT "x(13)":U
       temp-parent1.ctyp FORMAT "x(8)":U
       temp-parent1.fldl 
       
    WITH NO-ROW-MARKERS SEPARATORS
    &IF "{&WINDOW-SYSTEM}" <> "TTY"
    &THEN SIZE 37 BY 3.5 FIT-LAST-COLUMN.
    &ELSE SIZE 39 BY 6 FIT-LAST-COLUMN.
    &ENDIF 

DEFINE BROWSE BROWSE-CHILD
    QUERY BROWSE-CHILD NO-LOCK DISPLAY
       temp-child.cidx FORMAT "x(30)":U
    WITH NO-ROW-MARKERS SEPARATORS
    &IF "{&WINDOW-SYSTEM}" <> "TTY"
    &THEN SIZE 35 BY 3.5 FIT-LAST-COLUMN.
    &ELSE SIZE 35 BY 6 FIT-LAST-COLUMN.
    &ENDIF 

DEFINE BROWSE BROWSE-CHILD1
    QUERY BROWSE-CHILD1 NO-LOCK DISPLAY
       temp-child1.idxn FORMAT "x(13)":U
       temp-child1.ctyp FORMAT "x(8)":U
       temp-child1.fldl   
    
    WITH NO-ROW-MARKERS SEPARATORS
    &IF "{&WINDOW-SYSTEM}" <> "TTY"
    &THEN SIZE 37 BY 3.5 FIT-LAST-COLUMN.
    &ELSE SIZE 39 BY 6 FIT-LAST-COLUMN.
    &ENDIF 

&Scoped-define FRAME-NAME frame_foreign 

/* Definitions for BROWSE BROWSE-PAR                                      */
&Scoped-define FRAME-NAME frame_foreign
&Scoped-define BROWSE-NAME BROWSE-PAR
&Scoped-define FIELDS-IN-QUERY-BROWSE-PAR temp-parent.ptb temp-parent.pidx
&Scoped-define ENABLED-FIELDS-IN-QUERY-BROWSE-PAR 
&Scoped-define QUERY-STRING-BROWSE-PAR FOR EACH temp-parent NO-LOCK. 
&Scoped-define OPEN-QUERY-BROWSE-PAR OPEN QUERY BROWSE-PAR FOR EACH temp-parent NO-LOCK .
&Scoped-define TABLES-IN-QUERY-BROWSE-PAR temp-parent
&Scoped-define FIRST-TABLE-IN-QUERY-BROWSE-PAR temp-parent




/* Definitions for BROWSE BROWSE-PAR1                                     */
&Scoped-define FRAME-NAME frame_foreign
&Scoped-define BROWSE-NAME BROWSE-PAR1
&Scoped-define FIELDS-IN-QUERY-BROWSE-PAR1  temp-parent1.idxn temp-parent1.ctyp temp-parent1.fldl
&Scoped-define ENABLED-FIELDS-IN-QUERY-BROWSE-PAR1
&Scoped-define QUERY-STRING-BROWSE-PAR1 FOR EACH temp-parent1 NO-LOCK.
&Scoped-define OPEN-QUERY-BROWSE-PAR1 OPEN QUERY BROWSE-PAR1 FOR EACH temp-parent1 NO-LOCK.
&Scoped-define TABLES-IN-QUERY-BROWSE-PAR1 temp-parent1
&Scoped-define FIRST-TABLE-IN-QUERY-BROWSE-PAR1 temp-parent1


/* Definitions for BROWSE BROWSE-CHILD                                      */
&Scoped-define FIELDS-IN-QUERY-BROWSE-CHILD temp-child.cidx
&Scoped-define ENABLED-FIELDS-IN-QUERY-BROWSE-CHILD 
&Scoped-define QUERY-STRING-BROWSE-CHILD FOR EACH temp-child NO-LOCK.
&Scoped-define OPEN-QUERY-BROWSE-CHILD OPEN QUERY BROWSE-CHILD FOR EACH temp-child NO-LOCK.
&Scoped-define TABLES-IN-QUERY-BROWSE-CHILD temp-child
&Scoped-define FIRST-TABLE-IN-QUERY-BROWSE-CHILD temp-child

/* Definitions for BROWSE BROWSE-CHILD1                                     */
&Scoped-define FIELDS-IN-QUERY-BROWSE-CHILD1  temp-child1.idxn  temp-child1.ctyp temp-child1.fldl
&Scoped-define ENABLED-FIELDS-IN-QUERY-BROWSE-CHILD1 
&Scoped-define QUERY-STRING-BROWSE-CHILD1  FOR EACH temp-child1 NO-LOCK.
&Scoped-define OPEN-QUERY-BROWSE-CHILD1  OPEN QUERY BROWSE-CHILD1  FOR EACH temp-child1 NO-LOCK.
&Scoped-define TABLES-IN-QUERY-BROWSE-CHILD1  temp-child1
&Scoped-define FIRST-TABLE-IN-QUERY-BROWSE-CHILD1  temp-child1
  

FORM
     &IF "{&WINDOW-SYSTEM}" <> "TTY"
     &THEN
     name AT ROW 1.2 COL 17 COLON-ALIGNED WIDGET-ID 4
     BROWSE-PAR AT ROW 3.1 COL 2 WIDGET-ID 200 
     BROWSE-PAR1 AT ROW 3.1 COL 43 WIDGET-ID 300
     BROWSE-CHILD AT ROW 7.6 COL 2 WIDGET-ID 400
     BROWSE-CHILD1 AT ROW 7.6 COL 43 WIDGET-ID 500   
     child AT ROW 6.6 COL 12 COLON-ALIGNED WIDGET-ID 84
     ACTIVE AT ROW 11.4 COL 2 WIDGET-ID 40
     modf   AT ROW 11.3 COL 43
     DESC_EDIT AT ROW 12.4 COL 14 WIDGET-ID 36 NO-LABEL
     msg AT ROW 14.4 COL 2 WIDGET-ID 4 NO-LABEL
     OK_BUT AT ROW 15.3 COL 3
     CREATE_BUT AT ROW 15.3 COL 17
     CANCEL_BUT AT ROW 15.3 COL 31
     HELP_BUT AT ROW 15.3 COL 60
     "Description:" VIEW-AS TEXT
          SIZE 11 BY .62 AT ROW 12.6 COL 2 WIDGET-ID 38
     "Index Key Composite Fields" VIEW-AS TEXT
          SIZE 28 BY .62 AT ROW 2.3 COL 43 WIDGET-ID 600
     "Index Key Composite Fields" VIEW-AS TEXT
          SIZE 28 BY .62 AT ROW 6.7 COL 43 WIDGET-ID 600          
     "* = Primary Constraint" VIEW-AS TEXT
          SIZE 24 BY .62 AT ROW 2.3 COL 16 WIDGET-ID 600
     WITH FRAME frame_foreign
         NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COL 1 ROW 2.4
         SIZE 80 BY 16 WIDGET-ID 100.
              
     &ELSE
     name AT ROW 1.2 COL 17 COLON-ALIGNED WIDGET-ID 4
     BROWSE-PAR AT ROW 3.4 COL 2 WIDGET-ID 200 
     BROWSE-PAR1 AT ROW 3.4 COL 39 WIDGET-ID 300
     BROWSE-CHILD AT ROW 10 COL 2 WIDGET-ID 400
     BROWSE-CHILD1 AT ROW 10 COL 39 WIDGET-ID 500   
     child AT ROW 9 COL 13.4 COLON-ALIGNED WIDGET-ID 84
     ACTIVE AT ROW 16 COL 2 WIDGET-ID 40
     modf   AT ROW 16 COL 43
     DESC_EDIT AT ROW 17.3 COL 2 WIDGET-ID 36
     OK_BUT AT ROW 20.3 COL 18 WIDGET-ID 26
     CREATE_BUT AT ROW 20.3 COL 35 WIDGET-ID 28
     CANCEL_BUT AT ROW 20.3 COL 52 WIDGET-ID 30
     "Index Key Composite Fields" VIEW-AS TEXT
          SIZE 28 BY .62 AT ROW 9 COL 43 WIDGET-ID 600
     "Index Key Composite Fields" VIEW-AS TEXT
          SIZE 28 BY .62 AT ROW 2.4 COL 43 WIDGET-ID 600          
     WITH FRAME frame_foreign
         NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COL 1 ROW 3
         SIZE 80 BY 21 WIDGET-ID 100.
     &ENDIF
 ASSIGN       
       BROWSE-PAR:COLUMN-RESIZABLE IN FRAME frame_foreign       = TRUE            
       BROWSE-PAR1:COLUMN-RESIZABLE IN FRAME frame_foreign      = TRUE       
       BROWSE-CHILD:COLUMN-RESIZABLE IN FRAME frame_foreign     = TRUE      
       BROWSE-CHILD1:COLUMN-RESIZABLE IN FRAME frame_foreign    = TRUE.     
 
 DEF VAR fnintSub AS INTEGER NO-UNDO.
 DEF VAR chldintSub AS INTEGER NO-UNDO.
 DEF VAR tbllist AS INTEGER NO-UNDO.
 DEF VAR pirec AS INTEGER NO-UNDO.
 DEF VAR cirec AS INTEGER NO-UNDO.

        DEFINE VARIABLE fnQuery AS HANDLE.
        DEFINE VARIABLE fnBrowse AS HANDLE.
        DEFINE VARIABLE fnBuffer AS HANDLE.
        DEFINE VARIABLE fnField AS HANDLE.
        DEFINE VARIABLE fnField1 AS HANDLE.
        DEFINE VARIABLE fnField2 AS HANDLE.
        
	    DEFINE VARIABLE chldQuery AS HANDLE.
        DEFINE VARIABLE chldBrowse AS HANDLE.
        DEFINE VARIABLE chldBuffer AS HANDLE.
        DEFINE VARIABLE chldField1 AS HANDLE.
	    DEFINE VARIABLE chldField2 AS HANDLE.
        
ON CHOOSE OF OK_BUT IN FRAME frame_foreign
  DO:          
          ASSIGN is-saved = FALSE.
          RUN validate_foreign.
     IF is-saved THEN
          APPLY "CLOSE":U TO THIS-PROCEDURE.
          RETURN NO-APPLY.        
  END.

ON CHOOSE OF CREATE_BUT IN FRAME frame_foreign
 DO:
          RUN validate_foreign.
 END. 

ON CHOOSE OF CANCEL_BUT IN FRAME frame_foreign
  DO:     
           APPLY "CLOSE":U TO THIS-PROCEDURE.
           RETURN NO-APPLY.      
  END. 
   
ON VALUE-CHANGED OF BROWSE-PAR IN FRAME frame_foreign /* Browse 1 */
DO:
  RUN Fill_Parent_Record.
  RUN Fetch_Foreign_Name.
END.

ON VALUE-CHANGED OF BROWSE-CHILD IN FRAME frame_foreign /* Browse 2 */
DO:
  RUN Fill_Child_Info.
  RUN Fetch_Foreign_Name.

END.

ON ENTRY OF DESC_EDIT IN FRAME frame_foreign
 DO:
  &IF "{&WINDOW-SYSTEM}" <> "TTY"  &THEN
  ASSIGN msg:SCREEN-VALUE IN FRAME frame_foreign ="". 
  &ENDIF
END. 

ON ENTRY OF name IN FRAME frame_foreign
 DO:
  &IF "{&WINDOW-SYSTEM}" <> "TTY"  &THEN
  ASSIGN msg:SCREEN-VALUE IN FRAME frame_foreign ="". 
  &ENDIF
 END.
       
PROCEDURE foreign :
   &Scoped-define OPEN-BROWSERS-IN-QUERY-frame_foreign 

     HIDE FRAME frame_clustered.
     HIDE FRAME frame_primary.   
     HIDE FRAME frame_unique.    
     HIDE FRAME frame_default.    
     HIDE FRAME frame_check.    
     VIEW FRAME frame_foreign.
     DISPLAY name BROWSE-PAR  BROWSE-PAR1  child BROWSE-CHILD BROWSE-CHILD1 Active modf DESC_EDIT 
                    &IF "{&WINDOW-SYSTEM}" <> "TTY"  &THEN msg &ENDIF
          WITH FRAME frame_foreign.
     ASSIGN child:SCREEN-VALUE IN FRAME frame_foreign = c_table_name.
     ASSIGN Active:SCREEN-VALUE IN FRAME frame_foreign ="yes".
     ASSIGN modf:SCREEN-VALUE IN FRAME frame_foreign ="NONE".
     ENABLE  name BROWSE-PAR  BROWSE-PAR1   BROWSE-CHILD BROWSE-CHILD1 Active modf DESC_EDIT
                  OK_BUT CREATE_BUT CANCEL_BUT 
                 &IF "{&WINDOW-SYSTEM}" <> "TTY"
                 &THEN HELP_BUT  
                 &ENDIF
     WITH FRAME frame_foreign.
    {&OPEN-BROWSERS-IN-QUERY-frame_foreign}

RUN Fill_Par_Table_Index.
RUN Fill_Parent_Record.
RUN Fill_Child_Index.
RUN Fill_Child_Info. 
RUN Fetch_Foreign_Name.


  
END PROCEDURE.

PROCEDURE Fill_Par_Table_Index:
   EMPTY TEMP-TABLE temp-parent.
   FOR EACH DICTDB._file WHERE DICTDB._file._Db-Recid = DbRecId:
              FOR EACH DICTDB._index WHERE DICTDB._index._file-recid = RECID(DICTDB._file) NO-LOCK:
               
               ASSIGN pirec = RECID(DICTDB._index).
               FIND FIRST DICTDB._Constraint WHERE DICTDB._Constraint._Index-Recid = pirec AND 
               (DICTDB._Constraint._Con-Type = "U" OR DICTDB._Constraint._Con-Type = "P" OR
                DICTDB._Constraint._Con-Type = "PC" OR DICTDB._Constraint._Con-Type = "MP" ) NO-LOCK NO-ERROR.
               IF AVAILABLE (DICTDB._Constraint) THEN
               DO:
               CREATE temp-parent.
               IF (DICTDB._Constraint._Con-Type <> "U" )
               THEN
                    ASSIGN temp-parent.ptb = "*" + DICTDB._file._file-name .
               ELSE 
                    ASSIGN temp-parent.ptb = DICTDB._file._file-name.
                    
               ASSIGN   temp-parent.pidx = DICTDB._Index._Index-name
                        temp-parent.prec = pirec.
               END.
	      END.
    END.
    
{&OPEN-QUERY-BROWSE-PAR}
END PROCEDURE.



PROCEDURE Fill_Parent_Record:

    fnBrowse = BROWSE BROWSE-PAR:HANDLE. 
    fnQuery  = fnBrowse:QUERY.
    fnBuffer = fnQuery:GET-BUFFER-HANDLE(1). 
    
    DO fnintSub = 1 TO fnBrowse:NUM-SELECTED-ROWS:
           fnBrowse:FETCH-SELECTED-ROW(fnintSub).
           fnField  = fnBuffer:BUFFER-FIELD( "ptb" ).
	       fnField1 = fnBuffer:BUFFER-FIELD( "pidx" ).
	       fnField2 = fnBuffer:BUFFER-FIELD( "prec" ).
    END.
  IF CAN-FIND (FIRST temp-parent) THEN
      ASSIGN Par_Idx = fnField1:BUFFER-VALUE.
  ELSE MESSAGE " No Primary or Unique constraint(s) have been defined, Foreign Key cannot be created " view-as alert-box warning.    
  EMPTY TEMP-TABLE temp-parent1.
  counter = 0.
  FIND FIRST _file WHERE _file._file-name = TRIM(fnField:BUFFER-VALUE) AND DICTDB._file._Db-Recid = DbRecId NO-LOCK NO-ERROR.
  FIND FIRST DICTDB._index where  DICTDB._index._Index-name = fnField1:BUFFER-VALUE
                                and  DICTDB._index._file-recid = RECID(DICTDB._File) No-Lock no-error.
  FOR EACH DICTDB._index-field where DICTDB._index-field._Index-recid =  fnField2:BUFFER-VALUE NO-LOCK:
       find dictdb._field of dictdb._index-field no-lock.
      counter = counter + 1.
      CREATE temp-parent1.
      ASSIGN            temp-parent1.idxn = DICTDB._FIELD._Field-name 
                        temp-parent1.ctyp = DICTDB._FIELD._Data-Type
		                temp-parent1.fldl = LENGTH(DICTDB._FIELD._Field-name, "CHARACTER")
		                temp-parent1.fnum = counter.

  END.
    {&OPEN-QUERY-BROWSE-PAR1} 

END PROCEDURE.

PROCEDURE Fill_Child_Index:
EMPTY TEMP-TABLE temp-child.
FOR EACH DICTDB._file where DICTDB._file._file-name = child:SCREEN-VALUE IN FRAME frame_foreign AND DICTDB._file._Db-Recid = DbRecId:
 file_rec = RECID(DICTDB._file).
              FOR EACH DICTDB._index WHERE DICTDB._index._file-recid = file_rec AND DICTDB._index._wordidx <> 1 NO-LOCK:
               CREATE temp-child.
	       ASSIGN 
	             temp-child.cidx = DICTDB._Index._Index-name
	             temp-child.crec = RECID(DICTDB._index).
	       END.
	        
 END.
 {&OPEN-QUERY-BROWSE-CHILD}
 END PROCEDURE.


PROCEDURE Fill_Child_Info:

    chldBrowse = BROWSE BROWSE-CHILD:HANDLE. 
    chldQuery  = chldBrowse:QUERY.
    chldBuffer = chldQuery:GET-BUFFER-HANDLE(1).

    DO chldintSub = 1 TO chldBrowse:NUM-SELECTED-ROWS:
           chldBrowse:FETCH-SELECTED-ROW(chldintSub).
	       chldField1 = chldBuffer:BUFFER-FIELD( "cidx" ).
	       chldField2 = chldBuffer:BUFFER-FIELD( "crec" ).
    END.

  EMPTY TEMP-TABLE temp-child1.
  counter = 0.
  
  FIND FIRST _file WHERE _file._file-name = child:SCREEN-VALUE IN FRAME frame_foreign AND DICTDB._file._Db-Recid = DbRecId NO-LOCK NO-ERROR.
  FIND FIRST DICTDB._index where  DICTDB._index._Index-name = chldField1:BUFFER-VALUE
                                and  DICTDB._index._file-recid = RECID(DICTDB._File) No-Lock no-error.
  FOR EACH DICTDB._index-field where DICTDB._index-field._Index-recid =  chldField2:BUFFER-VALUE NO-LOCK:
       find dictdb._field of dictdb._index-field no-lock.

      CREATE temp-child1.
      counter = counter + 1.
      ASSIGN            temp-child1.idxn = DICTDB._FIELD._Field-name 
                        temp-child1.ctyp = DICTDB._FIELD._Data-Type
		                temp-child1.fldl = LENGTH(DICTDB._FIELD._Field-name, "CHARACTER")
		                temp-child1.fnum = counter.

      END.
  
  {&OPEN-QUERY-BROWSE-CHILD1}


	  
END PROCEDURE.


PROCEDURE Fetch_Foreign_Name:
   chldBrowse = BROWSE BROWSE-CHILD:HANDLE. 
   chldQuery  = chldBrowse:QUERY.
   chldBuffer = chldQuery:GET-BUFFER-HANDLE(1).

   DO chldintSub = 1 TO chldBrowse:NUM-SELECTED-ROWS:
           chldBrowse:FETCH-SELECTED-ROW(chldintSub).
	       chldField1 = chldBuffer:BUFFER-FIELD( "cidx" ).
	       chldField2 = chldBuffer:BUFFER-FIELD( "crec" ).
   
     
     ASSIGN Selected_Idx = chldField1:BUFFER-VALUE.
   END.
run Create_Const_Name.
END PROCEDURE.
 
PROCEDURE foreign_save:
    IF NOT CAN-FIND (FIRST DICTDB._Constraint WHERE DICTDB._Constraint._Con-Name = name:SCREEN-VALUE IN FRAME frame_foreign 
                     AND DICTDB._Constraint._Db-Recid = DbRecId AND DICTDB._constraint._Con-Status <> "O" AND
                             DICTDB._constraint._Con-Status <> "D") 
    THEN DO:
       num = num + 1.
       CREATE DICTDB._Constraint.
       ASSIGN _Con-Type = "F"
              _Con-Name = name:SCREEN-VALUE IN FRAME frame_foreign
              _For-Name = "".
       IF ACTIVE:SCREEN-VALUE IN FRAME frame_foreign = "yes" 
          THEN ASSIGN _Con-Active = TRUE.
          ELSE ASSIGN _Con-Active = FALSE.
       ASSIGN _Con-Desc = DESC_EDIT:SCREEN-VALUE IN FRAME frame_foreign 
              _con-misc2[1] = modf:SCREEN-VALUE IN FRAME frame_foreign               
              _File-recid = file_rec
              _Con-Status = "N"
              _Index-recid = chldField2:BUFFER-VALUE
              _Index-parent-recid = fnField2:BUFFER-VALUE
              _Con-Num = num
              _db-recid = DbRecId.
       RUN TEMP1.
       RUN foreign.
       &IF "{&WINDOW-SYSTEM}" <> "TTY"  &THEN
       ASSIGN msg:SCREEN-VALUE IN FRAME frame_foreign ="Constraint Created".  &ENDIF  
     ASSIGN is-saved = TRUE.            
    END.       
    ELSE
      MESSAGE "Constraint with this name already exists in the DB" VIEW-AS ALERT-BOX ERROR.                
END.

PROCEDURE validate_foreign:
        
        assign flg=TRUE.
        FOR EACH temp-child1:
          FIND FIRST temp-parent1 WHERE Temp-parent1.fnum = temp-child1.fnum NO-LOCK NO-ERROR.
          IF NOT AVAILABLE (temp-parent1) THEN DO:
             MESSAGE "Number of fields do not match" VIEW-AS ALERT-BOX ERROR. 
             ASSIGN flg = FALSE.
          END. 
          ELSE DO:
          IF Temp-parent1.ctyp <> temp-child1.ctyp AND flg = TRUE
           THEN DO:
              MESSAGE "Field Types do not match" VIEW-AS ALERT-BOX ERROR.
              flg = FALSE.
           END.
          END. 
        END.
        
        FOR EACH temp-parent1:
          FIND FIRST temp-child1 WHERE Temp-parent1.fnum = temp-child1.fnum NO-LOCK NO-ERROR.
          IF NOT AVAILABLE (temp-child1) THEN DO:
             MESSAGE "Number of fields do not match" VIEW-AS ALERT-BOX ERROR. 
             ASSIGN flg = FALSE.
          END. 
          ELSE DO:
          IF temp-child1.ctyp <> temp-parent1.ctyp AND flg = TRUE
           THEN DO:
              MESSAGE "Field Types do not match" VIEW-AS ALERT-BOX ERROR.
              flg = FALSE.
           END.
          END. 
        END.          
        
        IF flg THEN DO:        
           RUN foreign_save.     
        END.   
END PROCEDURE.
