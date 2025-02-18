/*************************************************************/
/* Copyright (c) 2007 by Progress Software Corporation       */
/*                                                           */
/* All rights reserved.  No part of this program or document */
/* may be  reproduced in  any form  or by  any means without */
/* permission in writing from PROGRESS Software Corporation. */
/*************************************************************/
/**************************************************************************
    Procedure:  _runtimewidgetid.p

    Purpose:    Checks to see if the AppBuilder is running and if it is
                it launches adecomm/_assign-wid.w (Runtime Widget-ID
                Assignment Tool).

    Parameters: None

    Notes  :
**************************************************************************/

DEFINE VARIABLE level          AS INTEGER NO-UNDO INITIAL 1. 
DEFINE VARIABLE ab_is_running  AS LOGICAL NO-UNDO INITIAL NO.

REPEAT WHILE PROGRAM-NAME(level) <> ?.
  IF PROGRAM-NAME(level) = "adeuib/_uibmain.p" THEN ab_is_running = TRUE.
  ASSIGN level = level + 1.
END.
IF NOT ab_is_running THEN DO:
  MESSAGE "The AppBuilder is not running. You must start the AppBuilder before running the Runtime Widget ID Assignment Tool." VIEW-AS ALERT-BOX ERROR.
  RETURN.
END.
ELSE
  RUN adecomm/_assign-wid.w PERSISTENT.

RETURN.
