**FREE
//%METADATA                                                                          *
// %TEXT SQL UDF Dates                                                               *
//%EMETADATA                                                                         *

// Status Data Structure
//
Dcl-Ds *n PSDS;
// Program Name
  stPgmName       Char(10)        Pos(1);
// Exception Error Message Text
  stExcText       Char(80)        Pos(91);
End-Ds;

Dcl-Pr isotodat extpgm('DAT001');
// input
  dat8            Packed(8:0);
// result
  date            Date;
// Null Indicator Parameters
  dat8_ind        Int(5);
  date_ind        Int(5);
// SQL Function Parameters
// SQL State  -  Input/Output
  SQL_State       Char(5);
// Function Name    Schema.Def name - Input only
  Function_Name   Char(139);
// Function Specific Name - Input Only
  Specific_Name   Char(128);
// Message Text - Input/Output
  Msg_Text        VarChar(70);
End-Pr;

Dcl-Pi isotodat;
  dat8            Packed(8:0);
  date            Date;
  dat8_ind        Int(5);
  date_ind        Int(5);
  SQL_State       Char(5);
  Function_Name   Char(139);
  Specific_Name   Char(128);
  Msg_Text        VarChar(70);
End-Pi;
// Clear NULL column indicator and SQL State
date_ind=*zero ;
SQL_State='00000';
 // If valid date return *on
test(de) *iso dat8;
if %error;
  date_ind = -1;
else;
  date = %date(dat8:*iso);
endif;
return;

begsr *PSSR;
  // Return error code in SQL State (38xxx)
  // Set SQL Message Text to first 70 characters of SDS exception text

  SQL_State='38I02';
  Msg_Text=%trimr(stExcText);
  return;
endsr;