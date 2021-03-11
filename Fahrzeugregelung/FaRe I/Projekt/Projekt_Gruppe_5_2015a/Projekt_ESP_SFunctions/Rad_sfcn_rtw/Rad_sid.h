/*
 * Rad_sid.h
 *
 * Code generation for model "Rad_sf".
 *
 * Model version              : 1.14
 * Simulink Coder version : 8.8 (R2015a) 09-Feb-2015
 * C source code generated on : Mon Jan 16 11:02:57 2017
 *
 * Target selection: rtwsfcn.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: 32-bit Generic
 * Emulation hardware selection:
 *    Differs from embedded hardware (MATLAB Host)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 *
 * SOURCES: Rad_sf.c
 */

/* statically allocated instance data for model: Rad */
{
  {
    /* Local SimStruct for the generated S-Function */
    static LocalS slS;
    LocalS *lS = &slS;
    ssSetUserData(rts, lS);

    /* block I/O */
    {
      static B_Rad_T sfcnB;
      void *b = (real_T *) &sfcnB;
      ssSetLocalBlockIO(rts, b);
      (void) memset(b, 0,
                    sizeof(B_Rad_T));
    }

    /* model checksums */
    ssSetChecksumVal(rts, 0, 2708766691U);
    ssSetChecksumVal(rts, 1, 2213406571U);
    ssSetChecksumVal(rts, 2, 354658254U);
    ssSetChecksumVal(rts, 3, 2395692631U);
  }
}
