&ANALYZE-SUSPEND _VERSION-NUMBER AB_v10r12 GUI ADM2
&ANALYZE-RESUME
/* Connected Databases 
*/
&Scoped-define WINDOW-NAME CURRENT-WINDOW
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS bTableWin 
/*************************************************************/  
/* Copyright (c) 1984-2005 by Progress Software Corporation  */
/*                                                           */
/* All rights reserved.  No part of this program or document */
/* may be  reproduced in  any form  or by  any means without */
/* permission in writing from PROGRESS Software Corporation. */
/*************************************************************/
/*------------------------------------------------------------------------

  File: adm2\src\browser.w

  Description: SmartDataBrowser Object

  Input Parameters:
      <none>

  Output Parameters:
      <none>

------------------------------------------------------------------------*/
/*          This .W file was created with the Progress AppBuilder.      */
/*----------------------------------------------------------------------*/

/* Create an unnamed pool to store all the widgets created 
     by this procedure. This is a good default which assures
     that this procedure's triggers and internal procedures 
     will execute in this procedure's storage, and that proper
     cleanup will occur on deletion of the procedure. */

CREATE WIDGET-POOL.

/* ***************************  Definitions  ************************** */

/* Parameters Definitions ---                                           */

/* Local Variable Definitions ---                                       */

{src/adm2/widgetprto.i}

{auditing/include/_aud-std.i}

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE SmartDataBrowser
&Scoped-define DB-AWARE no

&Scoped-define ADM-SUPPORTED-LINKS TableIO-Target,Data-Target,Update-Source

/* Include file with RowObject temp-table definition */
&Scoped-define DATA-FIELD-DEFS "auditing/sdo/_audfieldpolicysdo.i"

/* Name of designated FRAME-NAME and/or first browse and/or first query */
&Scoped-define FRAME-NAME F-Main
&Scoped-define BROWSE-NAME br_table

/* Internal Tables (found by Frame, Query & Browse Queries)             */
&Scoped-define INTERNAL-TABLES rowObject

/* Definitions for BROWSE br_table                                      */
&Scoped-define FIELDS-IN-QUERY-br_table rowObject._File-name ~
rowObject._Owner rowObject._Field-name rowObject.CreateLevelDesc ~
rowObject.UpdateLevelDesc rowObject.DeleteLevelDesc ~
rowObject._Audit-identifying-field 
&Scoped-define ENABLED-FIELDS-IN-QUERY-br_table 
&Scoped-define QUERY-STRING-br_table FOR EACH rowObject NO-LOCK INDEXED-REPOSITION
&Scoped-define OPEN-QUERY-br_table OPEN QUERY br_table FOR EACH rowObject NO-LOCK INDEXED-REPOSITION.
&Scoped-define TABLES-IN-QUERY-br_table rowObject
&Scoped-define FIRST-TABLE-IN-QUERY-br_table rowObject


/* Definitions for FRAME F-Main                                         */

/* Standard List Definitions                                            */
&Scoped-Define ENABLED-OBJECTS br_table 

/* Custom List Definitions                                              */
/* List-1,List-2,List-3,List-4,List-5,List-6                            */

/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME


/* ************************  Function Prototypes ********************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD hasMultipleSelected bTableWin 
FUNCTION hasMultipleSelected RETURNS LOGICAL
  ( /* parameter-definitions */ )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* ***********************  Control Definitions  ********************** */


/* Menu Definitions                                                     */
DEFINE MENU POPUP-MENU-br_table 
       MENU-ITEM m_Add_Multiple_Fields LABEL "Add Multiple &Fields".


/* Definitions of the field level widgets                               */
/* Query definitions                                                    */
&ANALYZE-SUSPEND
DEFINE TEMP-TABLE RowObject NO-UNDO
    {{&DATA-FIELD-DEFS}}
    {src/adm2/robjflds.i}.

DEFINE QUERY br_table FOR 
      rowObject SCROLLING.
&ANALYZE-RESUME

/* Browse definitions                                                   */
DEFINE BROWSE br_table
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _DISPLAY-FIELDS br_table bTableWin _STRUCTURED
  QUERY br_table NO-LOCK DISPLAY
      rowObject._File-name FORMAT "X(32)":U WIDTH 25
      rowObject._Owner FORMAT "X(32)":U WIDTH 13
      rowObject._Field-name FORMAT "X(32)":U WIDTH 28
      rowObject.CreateLevelDesc FORMAT "x(20)":U
      rowObject.UpdateLevelDesc FORMAT "x(20)":U
      rowObject.DeleteLevelDesc FORMAT "x(20)":U
      rowObject._Audit-identifying-field FORMAT "->9":U WIDTH 7
/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME
    WITH NO-ASSIGN NO-AUTO-VALIDATE NO-ROW-MARKERS SEPARATORS MULTIPLE SIZE 149 BY 5.95
         TITLE "Overridden Audit Fields" FIT-LAST-COLUMN.


/* ************************  Frame Definitions  *********************** */

DEFINE FRAME F-Main
     br_table AT ROW 1 COL 1 WIDGET-ID 2
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COL 1 ROW 1 SCROLLABLE  WIDGET-ID 96.


/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Type: SmartDataBrowser
   Data Source: "auditing/sdo/_audfieldpolicysdo.w"
   Allow: Basic,Browse
   Frames: 1
   Add Fields to: Neither
   Other Settings: PERSISTENT-ONLY COMPILE
 */

/* This procedure should always be RUN PERSISTENT.  Report the error,  */
/* then cleanup and return.                                            */
IF NOT THIS-PROCEDURE:PERSISTENT THEN DO:
  MESSAGE "{&FILE-NAME} should only be RUN PERSISTENT.":U
          VIEW-AS ALERT-BOX ERROR BUTTONS OK.
  RETURN.
END.

&ANALYZE-RESUME _END-PROCEDURE-SETTINGS

/* *************************  Create Window  ************************** */

&ANALYZE-SUSPEND _CREATE-WINDOW
/* DESIGN Window definition (used by the UIB) 
  CREATE WINDOW bTableWin ASSIGN
         HEIGHT             = 6
         WIDTH              = 150.4.
/* END WINDOW DEFINITION */
                                                                        */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _INCLUDED-LIB bTableWin 
/* ************************* Included-Libraries *********************** */

{src/adm2/browser.i}

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME




/* ***********  Runtime Attributes and AppBuilder Settings  *********** */

&ANALYZE-SUSPEND _RUN-TIME-ATTRIBUTES
/* SETTINGS FOR WINDOW bTableWin
  NOT-VISIBLE,,RUN-PERSISTENT                                           */
/* SETTINGS FOR FRAME F-Main
   NOT-VISIBLE FRAME-NAME Size-to-Fit                                   */
/* BROWSE-TAB br_table 1 F-Main */
ASSIGN 
       FRAME F-Main:SCROLLABLE       = FALSE
       FRAME F-Main:HIDDEN           = TRUE.

ASSIGN 
       br_table:POPUP-MENU IN FRAME F-Main             = MENU POPUP-MENU-br_table:HANDLE.

/* _RUN-TIME-ATTRIBUTES-END */
&ANALYZE-RESUME


/* Setting information for Queries and Browse Widgets fields            */

&ANALYZE-SUSPEND _QUERY-BLOCK BROWSE br_table
/* Query rebuild information for BROWSE br_table
     _TblList          = "rowObject"
     _Options          = "NO-LOCK INDEXED-REPOSITION"
     _FldNameList[1]   > _<SDO>.rowObject._File-name
"rowObject._File-name" ? ? "character" ? ? ? ? ? ? no "?" no no "25" yes no no "U" "" ""
     _FldNameList[2]   > _<SDO>.rowObject._Owner
"rowObject._Owner" ? ? "character" ? ? ? ? ? ? no "?" no no "13" yes no no "U" "" ""
     _FldNameList[3]   > _<SDO>.rowObject._Field-name
"rowObject._Field-name" ? ? "character" ? ? ? ? ? ? no "?" no no "28" yes no no "U" "" ""
     _FldNameList[4]   > _<SDO>.rowObject.CreateLevelDesc
"rowObject.CreateLevelDesc" ? ? "character" ? ? ? ? ? ? no "?" no no ? yes no no "U" "" ""
     _FldNameList[5]   > _<SDO>.rowObject.UpdateLevelDesc
"rowObject.UpdateLevelDesc" ? ? "character" ? ? ? ? ? ? no "?" no no ? yes no no "U" "" ""
     _FldNameList[6]   > _<SDO>.rowObject.DeleteLevelDesc
"rowObject.DeleteLevelDesc" ? ? "character" ? ? ? ? ? ? no "?" no no ? yes no no "U" "" ""
     _FldNameList[7]   > _<SDO>.rowObject._Audit-identifying-field
"rowObject._Audit-identifying-field" ? ? "integer" ? ? ? ? ? ? no "?" no no "7" yes no no "U" "" ""
     _Query            is NOT OPENED
*/  /* BROWSE br_table */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _QUERY-BLOCK FRAME F-Main
/* Query rebuild information for FRAME F-Main
     _Options          = "NO-LOCK"
     _Query            is NOT OPENED
*/  /* FRAME F-Main */
&ANALYZE-RESUME

 



/* ************************  Control Triggers  ************************ */

&Scoped-define BROWSE-NAME br_table
&Scoped-define SELF-NAME br_table
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL br_table bTableWin
ON CTRL-END OF br_table IN FRAME F-Main /* Overridden Audit Fields */
DO:
  APPLY "END":U TO BROWSE {&BROWSE-NAME}.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL br_table bTableWin
ON CTRL-HOME OF br_table IN FRAME F-Main /* Overridden Audit Fields */
DO:
  APPLY "HOME":U TO BROWSE {&BROWSE-NAME}.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL br_table bTableWin
ON CURSOR-DOWN OF br_table IN FRAME F-Main /* Overridden Audit Fields */
DO:
    {&BROWSE-NAME}:SELECT-NEXT-ROW() NO-ERROR.
    IF NOT ERROR-STATUS:ERROR THEN
        APPLY "value-changed" TO {&BROWSE-NAME}.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL br_table bTableWin
ON CURSOR-UP OF br_table IN FRAME F-Main /* Overridden Audit Fields */
DO:
    {&BROWSE-NAME}:SELECT-PREV-ROW() NO-ERROR.
    IF NOT ERROR-STATUS:ERROR THEN
        APPLY "value-changed" TO {&BROWSE-NAME}.
  
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL br_table bTableWin
ON DEFAULT-ACTION OF br_table IN FRAME F-Main /* Overridden Audit Fields */
DO:
  {src/adm2/brsdefault.i}
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL br_table bTableWin
ON END OF br_table IN FRAME F-Main /* Overridden Audit Fields */
DO:
  {src/adm2/brsend.i}
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL br_table bTableWin
ON HOME OF br_table IN FRAME F-Main /* Overridden Audit Fields */
DO:
  {src/adm2/brshome.i}
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL br_table bTableWin
ON MOUSE-EXTEND-UP OF br_table IN FRAME F-Main /* Overridden Audit Fields */
DO:
    DEFINE VARIABLE hContainerSource AS HANDLE     NO-UNDO.

      /* If user is deselecting the current row and that's the only row selected,
         reselect the row. We have to always keep a row selected, in case they
         delete a record. We are using a multiple-selection browse and ADM2 doesn't
         support multiple-selection browses so we have to do all the job.
      */
        IF {&BROWSE-NAME}:NUM-SELECTED-ROWS IN FRAME {&FRAME-NAME} = 0 THEN
           {&BROWSE-NAME}:SELECT-FOCUSED-ROW() NO-ERROR.
        ELSE IF {&BROWSE-NAME}:NUM-SELECTED-ROWS = 1 AND 
            NOT {&BROWSE-NAME}:FOCUSED-ROW-SELECTED THEN DO:
            /* user deselected a row but there is another row which is
               selected and has no focus - move focus to that row 
            */
            {&BROWSE-NAME}:FETCH-SELECTED-ROW(1).
            {&BROWSE-NAME}:QUERY:REPOSITION-TO-ROWID({&BROWSE-NAME}:QUERY:GET-BUFFER-HANDLE(1):ROWID).
            APPLY "value-changed" TO {&BROWSE-NAME}.

            ASSIGN 
                  hContainerSource = DYNAMIC-FUNCTION('getContainerSource':U IN TARGET-PROCEDURE).

            /* this gets published to the smartviewer */
            PUBLISH 'selectedMultipleRows' FROM hContainerSource (NO).
        END.
        ELSE DO:

              ASSIGN 
                hContainerSource = DYNAMIC-FUNCTION('getContainerSource':U IN TARGET-PROCEDURE).

            /* this gets published to the smartviewer */
            PUBLISH 'selectedMultipleRows' FROM hContainerSource (YES).

        END.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL br_table bTableWin
ON MOUSE-SELECT-CLICK OF br_table IN FRAME F-Main /* Overridden Audit Fields */
DO:
  /* since this is a multiple-selection browse, and we handle the case where
     the user may have tried to deselect all rows with the mouse, we need
     to apply value-changed to the browse when the user selects on a row ,
     just so we are sure we are displaying the same record in the smartviewer
  */
  APPLY "value-changed" TO {&BROWSE-NAME}.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL br_table bTableWin
ON OFF-END OF br_table IN FRAME F-Main /* Overridden Audit Fields */
DO:
  {src/adm2/brsoffnd.i}
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL br_table bTableWin
ON OFF-HOME OF br_table IN FRAME F-Main /* Overridden Audit Fields */
DO:
  {src/adm2/brsoffhm.i}
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL br_table bTableWin
ON ROW-ENTRY OF br_table IN FRAME F-Main /* Overridden Audit Fields */
DO:
  {src/adm2/brsentry.i}
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL br_table bTableWin
ON ROW-LEAVE OF br_table IN FRAME F-Main /* Overridden Audit Fields */
DO:
  {src/adm2/brsleave.i}
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL br_table bTableWin
ON SCROLL-NOTIFY OF br_table IN FRAME F-Main /* Overridden Audit Fields */
DO:
  {src/adm2/brsscrol.i}
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL br_table bTableWin
ON VALUE-CHANGED OF br_table IN FRAME F-Main /* Overridden Audit Fields */
DO:
DEFINE VARIABLE hContainerSource AS HANDLE NO-UNDO.
DEFINE VARIABLE hDataSource      AS HANDLE NO-UNDO.

      ASSIGN 
          hContainerSource = DYNAMIC-FUNCTION('getContainerSource':U IN TARGET-PROCEDURE).

      IF {&BROWSE-NAME}:NUM-SELECTED-ROWS > 1 THEN DO:
          ASSIGN hDataSource = DYNAMIC-FUNCTION('getDataSource').

          /* fetch the first selected row and reposition to it */
          {&BROWSE-NAME}:FETCH-SELECTED-ROW(1).

          {&BROWSE-NAME}:QUERY:REPOSITION-TO-ROWID({&BROWSE-NAME}:QUERY:GET-BUFFER-HANDLE(1):ROWID).

          /* publish this so we display the info from the first row selected 
             in the smartviewer
          */
          PUBLISH 'dataAvailable' FROM hDataSource ("DIFFERENT":U).

          /* this gets published to the smartviewer */
          PUBLISH 'selectedMultipleRows' FROM hContainerSource (YES).

          /* if selecting multiple rows, don't change the record seen in the viewer */
          RETURN.
      END.
      ELSE /* this gets published to the smartviewer */
          PUBLISH 'selectedMultipleRows' FROM hContainerSource (NO).

    
  {src/adm2/brschnge.i}
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME m_Add_Multiple_Fields
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL m_Add_Multiple_Fields bTableWin
ON CHOOSE OF MENU-ITEM m_Add_Multiple_Fields /* Add Multiple Fields */
DO:
  RUN addMultipleFields.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME POPUP-MENU-br_table
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL POPUP-MENU-br_table bTableWin
ON MENU-DROP OF MENU POPUP-MENU-br_table
DO:
    DEFINE VARIABLE hContainerSource AS HANDLE    NO-UNDO.
    DEFINE VARIABLE hDataSource      AS HANDLE    NO-UNDO.
    DEFINE VARIABLE cForeignFields   AS CHARACTER NO-UNDO.
    DEFINE VARIABLE cForeignValues   AS CHARACTER NO-UNDO.
    DEFINE VARIABLE cInfo            AS CHARACTER NO-UNDO.
    DEFINE VARIABLE cField           AS CHARACTER NO-UNDO.
    DEFINE VARIABLE iCount           AS INTEGER   NO-UNDO.
    DEFINE VARIABLE lReadOnly        AS LOGICAL   NO-UNDO.

        ASSIGN hContainerSource  = DYNAMIC-FUNCTION('getContainerSource').

        IF VALID-HANDLE (hContainerSource) THEN DO:

            /* don't allow user to add multiple fields if db is read-only */
            ASSIGN lReadOnly = DYNAMIC-FUNCTION('isCurrentDbReadOnly':U IN hContainerSource) NO-ERROR.

            /* get datasource handle (sdo) and then get the foreign key (which is the policy guid) 
               so we can check if there are any policies defined
            */
            /* get datasource handle (sdo) and then get the foreign key (which is the policy guid) 
               so we can check if there are any policies defined
            */
            ASSIGN hDatasource = DYNAMIC-FUNCTION('getDataSource':U)
                         cForeignFields = DYNAMIC-FUNCTION ('getForeignFields' IN hDataSource)
                         cForeignValues = DYNAMIC-FUNCTION ('getForeignValues' IN hDataSource).

            /* find the position of the field we want in the list of foreign fields and get its value 
               Each ForField pair is db name, RowObject name*/
            DO iCount = 1 TO NUM-ENTRIES(cForeignFields) BY 2:
                ASSIGN cField = ENTRY(iCount + 1, cForeignFields).
                IF cField = "_Audit-policy-guid":U THEN
                   ASSIGN cInfo = ENTRY(INT((iCount + 1) / 2) ,cForeignValues,CHR(1)) NO-ERROR.
            END.

            IF lReadOnly OR cInfo = ? OR cInfo = "" THEN
               ASSIGN MENU-ITEM m_Add_Multiple_Fields:SENSITIVE IN MENU POPUP-MENU-br_table = NO.
            ELSE
               ASSIGN MENU-ITEM m_Add_Multiple_Fields:SENSITIVE IN MENU POPUP-MENU-br_table = YES.
        END.
  
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&UNDEFINE SELF-NAME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK bTableWin 


/* ***************************  Main Block  *************************** */

&IF DEFINED(UIB_IS_RUNNING) <> 0 &THEN          
RUN initializeObject.        
&ENDIF

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* **********************  Internal Procedures  *********************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE addMultipleFields bTableWin 
PROCEDURE addMultipleFields :
/*------------------------------------------------------------------------------
  Purpose:    Open a dialog box where the user can select multiple fields
              to be added. We go through each one of them and add them to
              the sdo's table - we warn the user if a duplicate exists.
               
  Parameters:  <none>
  
  Notes:       
------------------------------------------------------------------------------*/

DEFINE VARIABLE cFieldList     AS CHARACTER NO-UNDO.
DEFINE VARIABLE cTableInfo     AS CHARACTER NO-UNDO.
DEFINE VARIABLE iStart         AS INTEGER   NO-UNDO INIT ?.
DEFINE VARIABLE newRec         AS CHARACTER NO-UNDO.
DEFINE VARIABLE newRecValues   AS CHARACTER NO-UNDO.
DEFINE VARIABLE iCount         AS INTEGER   NO-UNDO.
DEFINE VARIABLE hDataSource    AS HANDLE    NO-UNDO.
DEFINE VARIABLE cMsg           AS CHARACTER NO-UNDO.
DEFINE VARIABLE cForeignFields AS CHARACTER NO-UNDO.
DEFINE VARIABLE cForeignValues AS CHARACTER NO-UNDO.
DEFINE VARIABLE cField         AS CHARACTER NO-UNDO.
DEFINE VARIABLE first-row      AS ROWID     NO-UNDO.
DEFINE VARIABLE last-row       AS ROWID     NO-UNDO.
DEFINE VARIABLE hContainerSource AS HANDLE  NO-UNDO.


    /* get datasource handle (sdo) and then get the foreign keys which are
      file-name and owner so we can pass to the dialog that displays the fields
    */
    ASSIGN hDatasource = DYNAMIC-FUNCTION('getDataSource':U)
           cForeignFields = DYNAMIC-FUNCTION ('getForeignFields' IN hDataSource)
           cForeignValues = DYNAMIC-FUNCTION ('getForeignValues' IN hDataSource).

    /* find the position of the fields we want in the list of foreign fields and
       get their values 
    */
    /* Each ForField pair is db name, RowObject name*/
    DO iCount = 1 TO NUM-ENTRIES(cForeignFields) BY 2:
           ASSIGN cField = ENTRY(iCount + 1, cForeignFields).
           IF cField = "_File-name":U THEN
              ASSIGN cTableInfo = ENTRY(INT((iCount + 1) / 2) ,cForeignValues,CHR(1)) NO-ERROR.
           ELSE IF cField = "_Owner":U THEN
                   ASSIGN cTableInfo = cTableInfo + "," + ENTRY(INT((iCount + 1) / 2),cForeignValues,CHR(1)) NO-ERROR.
    END.

    IF cTableInfo = ? THEN DO:
        MESSAGE "You must select a table before adding new fields." VIEW-AS
            ALERT-BOX INFO.
        RETURN.
    END.

    /* bring up the window so the user can select the fields */
    RUN auditing/ui/_audmultfields.w (INPUT cTableInfo,
                                      INPUT YES, /* multiple selection */
                                      OUTPUT cFieldList).
    
    /* check if user selected any field */
    IF cFieldList <> "" THEN DO:

        /* deselect all rows, if any is selected */
        DO WITH FRAME {&FRAME-NAME}:
           {&BROWSE-NAME}:DESELECT-ROWS() NO-ERROR.
        END.


        /* go through each entry on the list */
        DO iCount = 1 TO NUM-ENTRIES(cFieldList):
            
            /* get new row and assing values to be added to record */
            ASSIGN newRec = ENTRY(1,DYNAMIC-FUNCTION('addRow':U IN hDataSource,INPUT ""),CHR(1))
                   newRecValues = "_Field-Name" + CHR(1) + ENTRY(iCount, cFieldList).

            /* try to save record */
            IF DYNAMIC-FUNCTION('submitRow':U IN hDataSource,
                                 INPUT newRec,
                                 INPUT newRecValues) = FALSE THEN 
            DO:
                /* we failed to save record */
                DYNAMIC-FUNCTION('cancelRow' IN hDataSource).

                /* remove the 'Update canceled' string from the error message */
                ASSIGN cMsg = ENTRY(1, DYNAMIC-FUNCTION('fetchMessages' IN hDataSource), CHR(4))
                       cMsg = REPLACE (cMsg,"Update canceled.","").

                MESSAGE cMsg VIEW-AS ALERT-BOX WARNING.

                /* reset the datamodified property in the sdo so it knows
                   we are done with the update 
                */
                DYNAMIC-FUNCTION('setDataModified' IN hDataSource, INPUT NO).
            END.
            ELSE IF first-row = ? THEN DO:
                {&BROWSE-NAME}:REFRESHABLE = NO. /* avoid flashing */
                first-row = TO-ROWID(ENTRY(1,newRec)).
            END.
            ELSE
                last-row = TO-ROWID(ENTRY(1,newRec)).
        END.

        /* set refreshable attribute back if it was set to no */
        {&BROWSE-NAME}:REFRESHABLE = YES.

        IF first-row <> ? THEN DO:
            /* publish so others know we finished this. This is needed by the APMT
               so it knows a change was made
            */
            PUBLISH "updateState" FROM hDataSource (INPUT 'UpdateComplete':U).

            /* check if only one row was added */
            IF last-row = ? THEN
                {&BROWSE-NAME}:SELECT-FOCUSED-ROW().
            ELSE
                /* select all rows added */
                {&BROWSE-NAME}:SELECT-ALL(first-row,last-row).
        END.

        ASSIGN 
            hContainerSource = DYNAMIC-FUNCTION('getContainerSource':U IN TARGET-PROCEDURE).

        /* let the viewer know if more than one row was selected */
        PUBLISH 'selectedMultipleRows' FROM hContainerSource ({&BROWSE-NAME}:NUM-SELECTED-ROWS > 1).

    END.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE adjustReposition bTableWin 
PROCEDURE adjustReposition :
/*------------------------------------------------------------------------------
  Purpose:     Super Override
  Parameters:  
  Notes:       
------------------------------------------------------------------------------*/

  /* Code placed here will execute PRIOR to standard behavior. */

  RUN SUPER.

  /* Code placed here will execute AFTER standard behavior.    */

  /* if there are records and nothing is selected in the browse, make sure
     we select the first row in the viewport since this is what the user will
     see in the smartviewer. The browse is a multiple-selection browse and
     we don't want to leave no row selected.
  */
  IF {&BROWSE-NAME}:NUM-SELECTED-ROWS IN FRAME {&FRAME-NAME} = 0 THEN
     {&BROWSE-NAME}:SELECT-ROW(1) NO-ERROR.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE beforeCloseQuery bTableWin 
PROCEDURE beforeCloseQuery :
/*------------------------------------------------------------------------------
  Purpose:     Perform some tasks before query is closed.
  Parameters:  
  Notes:       We have to deselect all rows and refresh the
               browse to get it with no rows selected in case query 
               has no records when it's open again.
------------------------------------------------------------------------------*/

    IF {&BROWSE-NAME}:NUM-SELECTED-ROWS IN FRAME {&FRAME-NAME} > 0 THEN DO:
        {&BROWSE-NAME}:DESELECT-ROWS() NO-ERROR.
        {&BROWSE-NAME}:REFRESH() NO-ERROR.
    END.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE createPopupMenu bTableWin 
PROCEDURE createPopupMenu :
/*------------------------------------------------------------------------------
  Purpose:     Super Override
  Parameters:  
  Notes:       
------------------------------------------------------------------------------*/

  /* Code placed here will execute PRIOR to standard behavior. */

 /* don't run super - we don't need any of the menu items and sub-menus that
    adm2 creates for columns size control, etc*/

/*  RUN SUPER.*/

  /* Code placed here will execute AFTER standard behavior.    */

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE disable_UI bTableWin  _DEFAULT-DISABLE
PROCEDURE disable_UI :
/*------------------------------------------------------------------------------
  Purpose:     DISABLE the User Interface
  Parameters:  <none>
  Notes:       Here we clean-up the user-interface by deleting
               dynamic widgets we have created and/or hide 
               frames.  This procedure is usually called when
               we are ready to "clean-up" after running.
------------------------------------------------------------------------------*/
  /* Hide all frames. */
  HIDE FRAME F-Main.
  IF THIS-PROCEDURE:PERSISTENT THEN DELETE PROCEDURE THIS-PROCEDURE.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE initializeObject bTableWin 
PROCEDURE initializeObject :
/*------------------------------------------------------------------------------
  Purpose:     Super Override
  Parameters:  
  Notes:       
------------------------------------------------------------------------------*/

DEFINE VARIABLE hDataSource AS HANDLE NO-UNDO.

  /* Code placed here will execute PRIOR to standard behavior. */

  RUN SUPER.

  /* Code placed here will execute AFTER standard behavior.    */

  ASSIGN hDataSource = DYNAMIC-FUNCTION ('getDataSource').

  /* subscribe to this event to handle updates to multiple rows selected
     in the browse
  */
  SUBSCRIBE  "updatedFieldPolicy" IN hDataSource.

  SUBSCRIBE  "beforeCloseQuery" IN hDataSource.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE queryPosition bTableWin 
PROCEDURE queryPosition :
/*------------------------------------------------------------------------------
  Purpose:     Super Override
  Parameters:  
  Notes:       
------------------------------------------------------------------------------*/

  DEFINE INPUT PARAMETER pcState AS CHARACTER NO-UNDO.
  DEFINE VARIABLE hContainerSource AS HANDLE  NO-UNDO.

  /* Code placed here will execute PRIOR to standard behavior. */

  RUN SUPER( INPUT pcState).

  /* Code placed here will execute AFTER standard behavior.    */

  /* if there are records and nothing is selected in the browse, make sure
     we select the first row in the viewport since this is what the user will
     see in the smartviewer. The browse is a multiple-selection browse and
     we don't want to leave no row selected.
  */
  IF pcState = "OnlyRecord":U OR pcstate = "FirstRecord":U THEN DO:
      IF {&BROWSE-NAME}:NUM-SELECTED-ROWS IN FRAME {&FRAME-NAME} = 0 THEN
         {&BROWSE-NAME}:SELECT-ROW(1) NO-ERROR.

      ASSIGN 
          hContainerSource = DYNAMIC-FUNCTION('getContainerSource':U IN TARGET-PROCEDURE).

      /* this gets published to the smartviewer */
      PUBLISH 'selectedMultipleRows' FROM hContainerSource (NO).

  END.
  ELSE {&BROWSE-NAME}:SELECT-FOCUSED-ROW() NO-ERROR.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE refreshBrowse bTableWin 
PROCEDURE refreshBrowse :
/*------------------------------------------------------------------------------
  Purpose:     Super Override
  Parameters:  
  Notes:       
------------------------------------------------------------------------------*/

  /* Code placed here will execute PRIOR to standard behavior. */
  
  RUN SUPER.

  /* Code placed here will execute AFTER standard behavior.    */

  /* if there are records and nothing is selected in the browse, make sure
     we select the first row in the viewport since this is what the user will
     see in the smartviewer. The browse is a multiple-selection browse and
     we don't want to leave no row selected.
  */
  IF {&BROWSE-NAME}:NUM-SELECTED-ROWS IN FRAME {&FRAME-NAME} = 0 THEN
     {&BROWSE-NAME}:SELECT-ROW(1) NO-ERROR.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE updatedFieldPolicy bTableWin 
PROCEDURE updatedFieldPolicy :
/*------------------------------------------------------------------------------
  Purpose:     Published when a single record is updated 
               (we don't do it for new or copied records).
               We update each record selected in the browse with the values passed.
               The user can select multiple records in the browse, update
               any of the audit levels in the viewer and the viewer will publish
               this event when the user saves the record.
  
  Parameters:  INPUT pcValues - a list of field name and value separated by chr(1)
                                which we pass to updateRow
  Notes:       
------------------------------------------------------------------------------*/
DEFINE INPUT PARAMETER pcValues AS CHARACTER NO-UNDO.

    DEFINE VARIABLE iCount AS INTEGER NO-UNDO.

    DEFINE VARIABLE hQuery       AS HANDLE  NO-UNDO.
    DEFINE VARIABLE hBuffer      AS HANDLE  NO-UNDO.
    DEFINE VARIABLE hDataSource  AS HANDLE  NO-UNDO.

    /* only do it if more than one row is selected */
    IF {&BROWSE-NAME}:NUM-SELECTED-ROWS IN FRAME {&FRAME-NAME} < 2 THEN
        RETURN.

    /* let's get the handles we need */
    ASSIGN hDataSource = DYNAMIC-FUNCTION('getDataSource':U)
           hQuery      = DYNAMIC-FUNCTION('getDataHandle':U IN hDataSource)
           hBuffer     = hQuery:GET-BUFFER-HANDLE(1) NO-ERROR.
    
    DO WITH FRAME {&FRAME-NAME}:
        /* go through each selected row in the browse and update the record */
        DO iCount = 1 TO {&BROWSE-NAME}:NUM-SELECTED-ROWS:
            {&BROWSE-NAME}:FETCH-SELECTED-ROW(iCount).
             DYNAMIC-FUNCTION("updateRow":U IN hDataSource, ?, pcValues).
        END.

        {&BROWSE-NAME}:REFRESH().
    END.


END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

/* ************************  Function Implementations ***************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION hasMultipleSelected bTableWin 
FUNCTION hasMultipleSelected RETURNS LOGICAL
  ( /* parameter-definitions */ ) :
/*------------------------------------------------------------------------------
  Purpose:  Returns if there are multiple lines selected in the browse
    Notes:  
------------------------------------------------------------------------------*/
RETURN ( {&BROWSE-NAME}:NUM-SELECTED-ROWS IN FRAME {&FRAME-NAME} > 1).
    
END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

