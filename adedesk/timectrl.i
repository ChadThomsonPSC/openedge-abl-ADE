/*********************************************************************
* Copyright (C) 2000 by Progress Software Corporation. All rights    *
* reserved. Prior versions of this work may contain portions         *
* contributed by participants of Possenet.                           *
*                                                                    *
*********************************************************************/
/* 
 * This file controls what exactly is timed in 
 * There are currently several different timers in place.    
 * To drop a timer "mpdrop.i" the timer.  To include a timer
 * "mpdo.i" the timer.  (Only drop actually does anything
 * mpdo is just a place-holder and MESSAGE.
 *
 * The first line, mpdotime.i, controls whether _any_
 * timing is done at all.
 *
 */
 
 /* {adeshar/mpdotime.i} */
 
 {adeshar/mpdrop.i &TIMER="DESK_uibstart"}
 {adeshar/mpdrop.i &TIMER="DESK_startup"}
 
