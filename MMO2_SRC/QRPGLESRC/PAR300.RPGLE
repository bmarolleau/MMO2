**FREE
//%METADATA                                                                          *
// %TEXT Parameters functions                                                        *
//%EMETADATA                                                                         *
Ctl-Opt nomain;

Dcl-F PARAMETER  Keyed usropn;

/COPY ../QPROTOSRC/PARAMETER.RPGLE

Dcl-Pr chainPARAMETER;
  P_PACODE        Char(10)        value;
  P_PASUBCODE     Char(10)        value;
End-Pr;

Dcl-S K_PACODE        LIKE(PACODE);
Dcl-S K_PASUBCODE     LIKE(PASUBCODE);

//=============================================
Dcl-Proc GetPARM1 export;
  Dcl-Pi GetPARM1 Char(10);
    P_PACODE        Char(10)        value;
    P_PASUBCODE     Char(10)        value;
  End-Pi;
  chainPARAMETER(P_PACODE
        :P_PASUBCODE);

  return PARM1;
End-Proc GetPARM1;
//=============================================
Dcl-Proc GetPARM2 export;
  Dcl-Pi GetPARM2 Char(100);
    P_PACODE        Char(10)        value;
    P_PASUBCODE     Char(10)        value;
  End-Pi;
  chainPARAMETER(P_PACODE
        :P_PASUBCODE);

  return PARM2;
End-Proc GetPARM2;
//=============================================
Dcl-Proc GetPARM3 export;
  Dcl-Pi GetPARM3 Char(2);
    P_PACODE        Char(10)        value;
    P_PASUBCODE     Char(10)        value;
  End-Pi;
  chainPARAMETER(P_PACODE
        :P_PASUBCODE);

  return PARM3;
End-Proc GetPARM3;
//=============================================
Dcl-Proc GetPARM4 export;
  Dcl-Pi GetPARM4 Packed(1:0);
    P_PACODE        Char(10)        value;
    P_PASUBCODE     Char(10)        value;
  End-Pi;
  chainPARAMETER(P_PACODE
        :P_PASUBCODE);

  return PARM4;
End-Proc GetPARM4;
//=============================================
Dcl-Proc GetPARM5 export;
  Dcl-Pi GetPARM5 Packed(3:0);
    P_PACODE        Char(10)        value;
    P_PASUBCODE     Char(10)        value;
  End-Pi;
  chainPARAMETER(P_PACODE
        :P_PASUBCODE);

  return PARM5;
End-Proc GetPARM5;

Dcl-Proc chainPARAMETER;
  Dcl-Pi chainPARAMETER;
    P_PACODE        Char(10)        value;
    P_PASUBCODE     Char(10)        value;
  End-Pi;
 if not %open(PARAMETER);
   open PARAMETER;
 endif;
  if P_PACODE <> PACODE
    or P_PASUBCODE <> PASUBCODE;
    K_PACODE =  P_PACODE;
    K_PASUBCODE =  P_PASUBCODE;
    clear *all FPARAM;
    chain (K_PACODE : K_PASUBCODE) PARAMETER;
  endif;
End-Proc chainPARAMETER;

Dcl-Proc closePARAMETER;
  Dcl-Pi closePARAMETER End-Pi;
 if %open(PARAMETER);
   close PARAMETER;
 endif;
End-Proc closePARAMETER;