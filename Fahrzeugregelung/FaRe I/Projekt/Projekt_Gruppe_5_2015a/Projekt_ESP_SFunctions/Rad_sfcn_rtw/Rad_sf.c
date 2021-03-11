/*
 * Rad_sf.c
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
 */

#include <math.h>
#include "Rad_sf.h"
#include "Rad_sf_private.h"
#include "simstruc.h"
#include "fixedpoint.h"
#if defined(RT_MALLOC) || defined(MATLAB_MEX_FILE)

extern void *Rad_malloc(SimStruct *S);

#endif

#ifndef __RTW_UTFREE__
#if defined (MATLAB_MEX_FILE)

extern void * utMalloc(size_t);
extern void utFree(void *);

#endif
#endif                                 /* #ifndef __RTW_UTFREE__ */

/* Forward declaration for local functions */
static real_T Rad_rt_atan2d_snf(real_T u0, real_T u1);

#if defined(MATLAB_MEX_FILE)
#include "rt_nonfinite.c"
#endif

static const char_T *RT_MEMORY_ALLOCATION_ERROR =
  "memory allocation error in generated S-Function";

/* Lookup Binary Search Utility Rad_sf_BINARYSEARCH_real_T */
void Rad_sf_BINARYSEARCH_real_T(uint32_T *piLeft, uint32_T *piRght, real_T u,
  const real_T *pData, uint32_T iHi)
{
  /* Find the location of current input value in the data table. */
  *piLeft = 0U;
  *piRght = iHi;
  if (u <= pData[0] ) {
    /* Less than or equal to the smallest point in the table. */
    *piRght = 0U;
  } else if (u >= pData[iHi] ) {
    /* Greater than or equal to the largest point in the table. */
    *piLeft = iHi;
  } else {
    uint32_T i;

    /* Do a binary search. */
    while (( *piRght - *piLeft ) > 1U ) {
      /* Get the average of the left and right indices using to Floor rounding. */
      i = (*piLeft + *piRght) >> 1;

      /* Move either the right index or the left index so that */
      /*  LeftDataPoint <= CurrentValue < RightDataPoint */
      if (u < pData[i] ) {
        *piRght = i;
      } else {
        *piLeft = i;
      }
    }
  }
}

/* Lookup Utility Rad_sf_LookUp_real_T_real_T */
void Rad_sf_LookUp_real_T_real_T(real_T *pY, const real_T *pYData, real_T u,
  const real_T *pUData, uint32_T iHi)
{
  uint32_T iLeft;
  uint32_T iRght;
  Rad_sf_BINARYSEARCH_real_T( &(iLeft), &(iRght), u, pUData, iHi);

  {
    real_T lambda;
    if (pUData[iRght] > pUData[iLeft] ) {
      real_T num;
      real_T den;
      den = pUData[iRght];
      den -= pUData[iLeft];
      num = u;
      num -= pUData[iLeft];
      lambda = num / den;
    } else {
      lambda = 0.0;
    }

    {
      real_T yLeftCast;
      real_T yRghtCast;
      yLeftCast = pYData[iLeft];
      yRghtCast = pYData[iRght];
      yLeftCast += lambda * ( yRghtCast - yLeftCast );
      (*pY) = yLeftCast;
    }
  }
}

static real_T Rad_rt_atan2d_snf(real_T u0, real_T u1)
{
  real_T y;
  int32_T u0_0;
  int32_T u1_0;
  if (rtIsNaN(u0) || rtIsNaN(u1)) {
    y = (rtNaN);
  } else if (rtIsInf(u0) && rtIsInf(u1)) {
    if (u0 > 0.0) {
      u0_0 = 1;
    } else {
      u0_0 = -1;
    }

    if (u1 > 0.0) {
      u1_0 = 1;
    } else {
      u1_0 = -1;
    }

    y = atan2(u0_0, u1_0);
  } else if (u1 == 0.0) {
    if (u0 > 0.0) {
      y = RT_PI / 2.0;
    } else if (u0 < 0.0) {
      y = -(RT_PI / 2.0);
    } else {
      y = 0.0;
    }
  } else {
    y = atan2(u0, u1);
  }

  return y;
}

/* Initial conditions for root system: '<Root>' */
#define MDL_INITIALIZE_CONDITIONS

static void mdlInitializeConditions(SimStruct *S)
{
  X_Rad_T *_rtX;
  _rtX = ((X_Rad_T *) ssGetContStates(S));

  /* InitializeConditions for Integrator: '<S2>/Integrator' */
  _rtX->Integrator_CSTATE = 4.4802867383512543;

  /* InitializeConditions for Integrator: '<S2>/Integrator1' */
  _rtX->Integrator1_CSTATE = 4.4802867383512543;
}

/* Start for root system: '<Root>' */
#define MDL_START

static void mdlStart(SimStruct *S)
{
  /* instance underlying S-Function data */
#if defined(RT_MALLOC) || defined(MATLAB_MEX_FILE)
#  if defined(MATLAB_MEX_FILE)

  /* non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* Check for invalid switching between solver types */
  if (ssIsVariableStepSolver(S)) {
    ssSetErrorStatus(S, "This Simulink Coder generated "
                     "S-Function cannot be used in a simulation with "
                     "a solver type of variable-step "
                     "because this S-Function was created from a model with "
                     "solver type of fixed-step and it has continuous time blocks. "
                     "See the Solver page of the simulation parameters dialog.");
    return;
  }

  if (fabs(ssGetFixedStepSize(S) - 0.001) > mxGetEps()*100*0.001) {
    ssSetErrorStatus(S, "This Simulink Coder generated "
                     "S-Function cannot be used in a simulation with "
                     "the current fixed step size "
                     "because this S-Function was created from a model with "
                     "a fixed step size of 0.001 and had both "
                     "continuous blocks and discrete blocks running at this rate. "
                     "See the Solver page of the simulation parameters dialog.");
    return;
  }

#  endif

  Rad_malloc(S);
  if (ssGetErrorStatus(S) != (NULL) ) {
    return;
  }

#endif

  {
  }
}

/* Outputs for root system: '<Root>' */
static void mdlOutputs(SimStruct *S, int_T tid)
{
  /* local block i/o variables */
  real_T rtb_MinMax;
  real_T rtb_LookupTable4;
  real_T rtb_MinMax1;
  real_T rtb_LookupTable1;
  real_T vboden;
  int32_T flag1;
  int32_T flag2;
  real_T flag3;
  real_T flag4;
  real_T flag6;
  int32_T flag8;
  real_T flag6_0;
  real_T rtb_Integrator;
  real_T rtb_Integrator1;
  real_T rtb_rad_vx_v;
  real_T rtb_omega_v;
  real_T rtb_omega_h;
  real_T rtb_rad_vx_h;
  real_T rtb_Fyv_rad;
  real_T rtb_Fyh_rad;
  int32_T rtb_sx_flag;
  real_T rtb_sy_rad;
  real_T rtb_sy_rad_j;
  real_T rtb_s_abs;
  real_T rtb_s_abs_k;
  real_T rtb_rad_vx_v_idx_1;
  real_T v_rad_idx_0;
  B_Rad_T *_rtB;
  X_Rad_T *_rtX;
  _rtX = ((X_Rad_T *) ssGetContStates(S));
  _rtB = ((B_Rad_T *) ssGetLocalBlockIO(S));
  if (ssIsContinuousTask(S, tid)) {
    /* Integrator: '<S2>/Integrator' */
    rtb_Integrator = _rtX->Integrator_CSTATE;

    /* Saturate: '<S2>/Saturation1' incorporates:
     *  Integrator: '<S2>/Integrator'
     */
    if (_rtX->Integrator_CSTATE <= 1.0E-5) {
      rtb_omega_v = 1.0E-5;
    } else {
      rtb_omega_v = _rtX->Integrator_CSTATE;
    }

    /* End of Saturate: '<S2>/Saturation1' */

    /* MATLAB Function: '<S3>/Berechnung der Radgeschwindigkeiten im Radbefestigungspunkt' incorporates:
     *  Inport: '<Root>/beta'
     *  Inport: '<Root>/v'
     */
    /* MATLAB Function 'Rad/Geschwindigkeiten der Räder im Radbefestigungspunkt/Berechnung der Radgeschwindigkeiten im Radbefestigungspunkt': '<S8>:1' */
    /* '<S8>:1:3' */
    /* '<S8>:1:4' */
    /* '<S8>:1:5' */
    /*  */
    /*  Berechnung der Geschwindigkeiten im Radbefestigungspunkt */
    /* '<S8>:1:10' */
    rtb_rad_vx_v = *((const real_T **)ssGetInputPortSignalPtrs(S, 13))[0] * cos(*
      ((const real_T **)ssGetInputPortSignalPtrs(S, 12))[0]);

    /* '<S8>:1:11' */
    /* '<S8>:1:12' */
    rtb_rad_vx_h = *((const real_T **)ssGetInputPortSignalPtrs(S, 13))[0] * cos(*
      ((const real_T **)ssGetInputPortSignalPtrs(S, 12))[0]);

    /* MATLAB Function: '<S4>/Berechnung Schlupf vorne' incorporates:
     *  Constant: '<S4>/rad_r'
     *  Inport: '<Root>/beta'
     *  Inport: '<Root>/delta_vb'
     *  Inport: '<Root>/psi_p'
     *  Inport: '<Root>/v'
     *  MATLAB Function: '<S3>/Berechnung der Radgeschwindigkeiten im Radbefestigungspunkt'
     */
    /* '<S8>:1:13' */
    /* MATLAB Function 'Rad/Pacejka/Berechnung Schlupf vorne': '<S10>:1' */
    /*  vboden: Geschwindigkeit des Rades am Boden. */
    /*    Es wird berechnet aus omega*r_dyn */
    /*  vrad: Geschwindigkeit des Rades in der Aufhängung */
    /*    Sie wird aus der Fahrzeuggeschwindigkeit berechnet */
    /*  Es wird der Schlupf berechnet. Wenn das Fahrzeug fährt gilt: */
    /*  Schlupf > 0 : Rad dreht durch */
    /*  Grenzwert: 1 (Fahrzeug steht) */
    /*  Schlupf < 0: Rad rutscht */
    /*  Grenzwert: -1 (Rad steht) */
    /*   */
    /*  Wenn Fahrzeug steht: */
    /*  Schlupf = 0.99: Rad dreht vorwaerts */
    /*  Schlupf = -0.99: Rad dreht rueckwaerts */
    /* Umrechnung in Rad-KOS: */
    /* '<S10>:1:20' */
    vboden = rtb_omega_v * 0.31;

    /* '<S10>:1:21' */
    rtb_rad_vx_v_idx_1 = 1.6 * *((const real_T **)ssGetInputPortSignalPtrs(S, 16))
      [0] + *((const real_T **)ssGetInputPortSignalPtrs(S, 13))[0] * sin(*((
      const real_T **)ssGetInputPortSignalPtrs(S, 12))[0]);
    v_rad_idx_0 = cos(*((const real_T **)ssGetInputPortSignalPtrs(S, 8))[0]) *
      rtb_rad_vx_v + sin(*((const real_T **)ssGetInputPortSignalPtrs(S, 8))[0]) *
      rtb_rad_vx_v_idx_1;

    /* '<S10>:1:22' */
    /* '<S10>:1:23' */
    /* '<S10>:1:25' */
    flag1 = 0;

    /* '<S10>:1:26' */
    flag2 = 0;

    /* '<S10>:1:32' */
    flag8 = 0;

    /*  Überprüfen ob Fahrzeug rückwärts fährt */
    if ((v_rad_idx_0 < 0.0) && (vboden <= 0.0)) {
      /* '<S10>:1:36' */
      /* '<S10>:1:37' */
      flag8 = 1;

      /* '<S10>:1:38' */
      vboden = fabs(vboden);

      /* '<S10>:1:39' */
      v_rad_idx_0 = fabs(v_rad_idx_0);
    }

    /* if (vrad < 0) && (vboden < 0) */
    /* vrad = abs(vrad); */
    /*  Überprüfung ob Fahrzeug fährt */
    if (1.0E-6 < v_rad_idx_0) {
      /* '<S10>:1:45' */
      /*  flag1=0 */
      /* '<S10>:1:46' */
      flag1 = 1;
    }

    /* if vrad < 1e-6 */
    /*  Überprüfung ob Fahrzeug rutscht */
    if (v_rad_idx_0 >= vboden) {
      /* '<S10>:1:50' */
      /*  flag2=1; */
      /* '<S10>:1:51' */
      flag2 = 1;
    }

    /* vrad >= vboden */
    /*  Nulldivison verhindern */
    if ((v_rad_idx_0 == 0.0) >= 1) {
      /* '<S10>:1:55' */
      /* '<S10>:1:56' */
      flag3 = 1.0E-6;

      /* flag3=1e-6; */
    } else {
      /* '<S10>:1:58' */
      flag3 = v_rad_idx_0;
    }

    /* if (vrad == 0) >= 1 */
    /*  Nulldivision verhindern */
    if ((vboden == 0.0) >= 1) {
      /* '<S10>:1:62' */
      /* flag4=1e-6; */
      /* '<S10>:1:63' */
      flag4 = 1.0E-6;
    } else {
      /* '<S10>:1:65' */
      flag4 = vboden;
    }

    /* if (vboden == 0) >= 1 */
    /*  Differenzgeschwindigkeiten bilden */
    if (flag2 >= 1) {
      /* '<S10>:1:69' */
      /* '<S10>:1:70' */
      flag3 = (vboden - v_rad_idx_0) / flag3;
      if (!(flag3 >= -0.99)) {
        flag3 = -0.99;
      }

      /* flag5=0 */
    } else {
      /* '<S10>:1:72' */
      flag3 = (vboden - v_rad_idx_0) / flag4;
      if (!(flag3 <= 0.99)) {
        flag3 = 0.99;
      }
    }

    /* if flag2 >= 1 */
    /*  Überprüfung ob Rad dreht oder stillsteht */
    if ((vboden != 0.0) >= 1) {
      /* '<S10>:1:76' */
      /*  flag6=0 */
      /* '<S10>:1:77' */
      if (vboden < 0.0) {
        vboden = -1.0;
      } else if (vboden > 0.0) {
        vboden = 1.0;
      } else {
        if (vboden == 0.0) {
          vboden = 0.0;
        }
      }

      flag6 = vboden * 0.99;
    } else {
      /* '<S10>:1:79' */
      flag6 = 0.0;
    }

    /* if (vboden ~= 0) >= 1 */
    /*  Überprüfung ob Fahrzeug steht oder fährt */
    /*  und Berechnung des Schlupfes */
    if (flag1 >= 1) {
      /* '<S10>:1:84' */
      /* flag7=0 */
      /* '<S10>:1:85' */
      flag6 = flag3;
    } else {
      /* '<S10>:1:87' */
    }

    /* if flag1 >= 1 */
    /* '<S10>:1:90' */
    /*  Überprüfen ob Fahrzeug rückwärts fährt */
    if (flag8 == 1) {
      /* '<S10>:1:93' */
      /* '<S10>:1:94' */
      flag6 = -flag6;
    }

    /* if vboden < 0 */
    /*  Seitenschlupf: */
    /* '<S10>:1:98' */
    rtb_sy_rad = Rad_rt_atan2d_snf(sin(*((const real_T **)
      ssGetInputPortSignalPtrs(S, 8))[0]) * rtb_rad_vx_v + -cos(*((const real_T **)
      ssGetInputPortSignalPtrs(S, 8))[0]) * rtb_rad_vx_v_idx_1, v_rad_idx_0);

    /*  sin(alpha) =-delta+atan(vy/v_x) */
    /*  Flag für Regelsysteme: */
    if (flag6 >= 0.0) {
      /* '<S10>:1:102' */
      /* '<S10>:1:103' */
      rtb_sx_flag = 1;
    } else {
      /* '<S10>:1:105' */
      rtb_sx_flag = 0;
    }

    /*  Betrag des Schlupfes: */
    /* '<S10>:1:109' */
    rtb_s_abs = sqrt(flag6 * flag6 + rtb_sy_rad * rtb_sy_rad);

    /* Integrator: '<S2>/Integrator1' */
    rtb_Integrator1 = _rtX->Integrator1_CSTATE;

    /* Saturate: '<S2>/Saturation' incorporates:
     *  Integrator: '<S2>/Integrator1'
     */
    if (_rtX->Integrator1_CSTATE <= 1.0E-5) {
      rtb_omega_h = 1.0E-5;
    } else {
      rtb_omega_h = _rtX->Integrator1_CSTATE;
    }

    /* End of Saturate: '<S2>/Saturation' */

    /* MATLAB Function: '<S4>/Berechnung Schlupf hinten' incorporates:
     *  Constant: '<S4>/rad_r'
     *  Inport: '<Root>/beta'
     *  Inport: '<Root>/psi_p'
     *  Inport: '<Root>/v'
     *  MATLAB Function: '<S3>/Berechnung der Radgeschwindigkeiten im Radbefestigungspunkt'
     */
    /* MATLAB Function 'Rad/Pacejka/Berechnung Schlupf hinten': '<S9>:1' */
    /*  vboden: Geschwindigkeit des Rades am Boden. */
    /*    Es wird berechnet aus omega*r_dyn */
    /*  vrad: Geschwindigkeit des Rades in der Aufhängung */
    /*    Sie wird aus der Fahrzeuggeschwindigkeit berechnet */
    /*  Es wird der Schlupf berechnet. Wenn das Fahrzeug fährt gilt: */
    /*  Schlupf > 0 : Rad dreht durch */
    /*  Grenzwert: 1 (Fahrzeug steht) */
    /*  Schlupf < 0: Rad rutscht */
    /*  Grenzwert: -1 (Rad steht) */
    /*   */
    /*  Wenn Fahrzeug steht: */
    /*  Schlupf = 0.99: Rad dreht vorwaerts */
    /*  Schlupf = -0.99: Rad dreht rueckwaerts */
    /* Umrechnung in Rad-KOS: */
    /* '<S9>:1:20' */
    vboden = rtb_omega_h * 0.31;

    /* '<S9>:1:21' */
    rtb_rad_vx_v_idx_1 = *((const real_T **)ssGetInputPortSignalPtrs(S, 13))[0] *
      sin(*((const real_T **)ssGetInputPortSignalPtrs(S, 12))[0]) - 1.158 * *((
      const real_T **)ssGetInputPortSignalPtrs(S, 16))[0];
    v_rad_idx_0 = 0.0 * rtb_rad_vx_v_idx_1 + rtb_rad_vx_h;

    /* '<S9>:1:22' */
    /* '<S9>:1:23' */
    /* '<S9>:1:25' */
    flag1 = 0;

    /* '<S9>:1:26' */
    flag2 = 0;

    /* '<S9>:1:32' */
    flag8 = 0;

    /*  Überprüfen ob Fahrzeug rückwärts fährt */
    if ((v_rad_idx_0 < 0.0) && (vboden <= 0.0)) {
      /* '<S9>:1:36' */
      /* '<S9>:1:37' */
      flag8 = 1;

      /* '<S9>:1:38' */
      vboden = fabs(vboden);

      /* '<S9>:1:39' */
      v_rad_idx_0 = fabs(v_rad_idx_0);
    }

    /* if (vrad < 0) && (vboden < 0) */
    /* vrad = abs(vrad); */
    /*  Überprüfung ob Fahrzeug fährt */
    if (1.0E-6 < v_rad_idx_0) {
      /* '<S9>:1:45' */
      /*  flag1=0 */
      /* '<S9>:1:46' */
      flag1 = 1;
    }

    /* if vrad < 1e-6 */
    /*  Überprüfung ob Fahrzeug rutscht */
    if (v_rad_idx_0 >= vboden) {
      /* '<S9>:1:50' */
      /*  flag2=1; */
      /* '<S9>:1:51' */
      flag2 = 1;
    }

    /* vrad >= vboden */
    /*  Nulldivison verhindern */
    if ((v_rad_idx_0 == 0.0) >= 1) {
      /* '<S9>:1:55' */
      /* '<S9>:1:56' */
      flag3 = 1.0E-6;

      /* flag3=1e-6; */
    } else {
      /* '<S9>:1:58' */
      flag3 = v_rad_idx_0;
    }

    /* if (vrad == 0) >= 1 */
    /*  Nulldivision verhindern */
    if ((vboden == 0.0) >= 1) {
      /* '<S9>:1:62' */
      /* flag4=1e-6; */
      /* '<S9>:1:63' */
      flag4 = 1.0E-6;
    } else {
      /* '<S9>:1:65' */
      flag4 = vboden;
    }

    /* if (vboden == 0) >= 1 */
    /*  Differenzgeschwindigkeiten bilden */
    if (flag2 >= 1) {
      /* '<S9>:1:69' */
      /* '<S9>:1:70' */
      flag3 = (vboden - v_rad_idx_0) / flag3;
      if (!(flag3 >= -0.99)) {
        flag3 = -0.99;
      }

      /* flag5=0 */
    } else {
      /* '<S9>:1:72' */
      flag3 = (vboden - v_rad_idx_0) / flag4;
      if (!(flag3 <= 0.99)) {
        flag3 = 0.99;
      }
    }

    /* if flag2 >= 1 */
    /*  Überprüfung ob Rad dreht oder stillsteht */
    if ((vboden != 0.0) >= 1) {
      /* '<S9>:1:76' */
      /*  flag6=0 */
      /* '<S9>:1:77' */
      if (vboden < 0.0) {
        vboden = -1.0;
      } else if (vboden > 0.0) {
        vboden = 1.0;
      } else {
        if (vboden == 0.0) {
          vboden = 0.0;
        }
      }

      flag6_0 = vboden * 0.99;
    } else {
      /* '<S9>:1:79' */
      flag6_0 = 0.0;
    }

    /* if (vboden ~= 0) >= 1 */
    /*  Überprüfung ob Fahrzeug steht oder fährt */
    /*  und Berechnung des Schlupfes */
    if (flag1 >= 1) {
      /* '<S9>:1:84' */
      /* flag7=0 */
      /* '<S9>:1:85' */
      flag6_0 = flag3;
    } else {
      /* '<S9>:1:87' */
    }

    /* if flag1 >= 1 */
    /* '<S9>:1:90' */
    /*  Überprüfen ob Fahrzeug rückwärts fährt */
    if (flag8 == 1) {
      /* '<S9>:1:93' */
      /* '<S9>:1:94' */
      flag6_0 = -flag6_0;
    }

    /* if vboden < 0 */
    /*  % Seitenschlupf: */
    /*  if (vrad ~= 0 || vrad_y ~= 0) */
    /*      sy_rad = vrad_y/sqrt(vrad^2+vrad_y^2); % sin(alpha) = vy/|v| */
    /*  else */
    /*      sy_rad = 0; */
    /*  end */
    /*  Seitenschlupf: */
    /* '<S9>:1:105' */
    rtb_sy_rad_j = Rad_rt_atan2d_snf(0.0 * rtb_rad_vx_h + -rtb_rad_vx_v_idx_1,
      v_rad_idx_0);

    /*  sin(alpha) =-delta+atan(vy/v_x) */
    /*  Flag für Regelsysteme: */
    if (flag6_0 >= 0.0) {
      /* '<S9>:1:108' */
      /* '<S9>:1:109' */
      flag1 = 1;
    } else {
      /* '<S9>:1:111' */
      flag1 = 0;
    }

    /*  Betrag des Schlupfes: */
    /* '<S9>:1:116' */
    rtb_s_abs_k = sqrt(flag6_0 * flag6_0 + rtb_sy_rad_j * rtb_sy_rad_j);

    /* Abs: '<S12>/Abs4' */
    rtb_rad_vx_v_idx_1 = fabs(rtb_rad_vx_v);

    /* Product: '<S12>/Product' incorporates:
     *  Abs: '<S12>/Abs'
     *  Constant: '<S4>/rad_r'
     */
    rtb_Fyv_rad = fabs(rtb_omega_v) * 0.31;

    /* MinMax: '<S12>/MinMax' */
    if ((rtb_rad_vx_v_idx_1 >= rtb_Fyv_rad) || rtIsNaN(rtb_Fyv_rad)) {
      rtb_MinMax = rtb_rad_vx_v_idx_1;
    } else {
      rtb_MinMax = rtb_Fyv_rad;
    }

    /* End of MinMax: '<S12>/MinMax' */

    /* Lookup: '<S12>/Lookup Table4'
     * About '<S12>/Lookup Table4':
     * Input0  Data Type:  Floating Point real_T
     * Output0 Data Type:  Floating Point real_T
     * Lookup Method: Linear_Endpoint
     *
     * XData parameter uses the same data type and scaling as Input0
     * YData parameter uses the same data type and scaling as Output0
     */
    Rad_sf_LookUp_real_T_real_T( &(rtb_LookupTable4), Rad_ConstP.pooled9,
      rtb_MinMax, Rad_ConstP.pooled8, 6U);

    /* Abs: '<S12>/Abs5' */
    rtb_rad_vx_v_idx_1 = fabs(rtb_omega_h);

    /* Product: '<S12>/Product1' incorporates:
     *  Abs: '<S12>/Abs1'
     *  Constant: '<S4>/rad_r'
     */
    rtb_Fyv_rad = fabs(rtb_rad_vx_h) * 0.31;

    /* MinMax: '<S12>/MinMax1' */
    if ((rtb_rad_vx_v_idx_1 >= rtb_Fyv_rad) || rtIsNaN(rtb_Fyv_rad)) {
      rtb_MinMax1 = rtb_rad_vx_v_idx_1;
    } else {
      rtb_MinMax1 = rtb_Fyv_rad;
    }

    /* End of MinMax: '<S12>/MinMax1' */

    /* Lookup: '<S12>/Lookup Table1'
     * About '<S12>/Lookup Table1':
     * Input0  Data Type:  Floating Point real_T
     * Output0 Data Type:  Floating Point real_T
     * Lookup Method: Linear_Endpoint
     *
     * XData parameter uses the same data type and scaling as Input0
     * YData parameter uses the same data type and scaling as Output0
     */
    Rad_sf_LookUp_real_T_real_T( &(rtb_LookupTable1), Rad_ConstP.pooled9,
      rtb_MinMax1, Rad_ConstP.pooled8, 6U);

    /* MATLAB Function: '<S4>/Berechnung der Radkräfte' incorporates:
     *  Inport: '<Root>/Fzh'
     *  Inport: '<Root>/Fzv'
     *  Inport: '<Root>/rad_mue_hl'
     *  Inport: '<Root>/rad_mue_vl'
     *  MATLAB Function: '<S4>/Berechnung Schlupf hinten'
     *  MATLAB Function: '<S4>/Berechnung Schlupf vorne'
     */
    flag3 = rtb_s_abs;
    flag4 = rtb_s_abs_k;

    /* MATLAB Function 'Rad/Pacejka/Berechnung der Radkräfte': '<S11>:1' */
    /*  Berechnungen der Rakräfte nach simple Pacejka, Datensatz ist isotrop */
    /*  Fall ausschließen, dass s_v und s_h Null werden */
    if (rtb_s_abs == 0.0) {
      /* '<S11>:1:6' */
      /* '<S11>:1:7' */
      flag3 = 1.0E-6;
    }

    if (rtb_s_abs_k == 0.0) {
      /* '<S11>:1:9' */
      /* '<S11>:1:10' */
      flag4 = 1.0E-6;
    }

    /*  Stand-Still Scaling: */
    /* '<S11>:1:15' */
    vboden = 12.0 * rtb_LookupTable4;

    /* '<S11>:1:16' */
    v_rad_idx_0 = 12.0 * rtb_LookupTable1;

    /*  Maximale Radkraft */
    /* '<S11>:1:19' */
    rtb_rad_vx_v = ((7000.0 - *((const real_T **)ssGetInputPortSignalPtrs(S, 20))
                     [0]) * 0.1 / 7000.0 + 1.0) * (*((const real_T **)
      ssGetInputPortSignalPtrs(S, 22))[0] * *((const real_T **)
      ssGetInputPortSignalPtrs(S, 20))[0]);

    /*  Berechnung der Radkräfte */
    /* '<S11>:1:22' */
    /* '<S11>:1:23' */
    rtb_Fyv_rad = sin(atan(vboden * flag3 / *((const real_T **)
      ssGetInputPortSignalPtrs(S, 22))[0]) * 1.65) * rtb_rad_vx_v * rtb_sy_rad /
      flag3;

    /*  % Transformation der Radkräfte in das Radkoordinatensystem */
    /*  Fxv_rad = cos(delta_v)*Fxv+sin(delta_v)*Fyv; */
    /*  Fyv_rad = -sin(delta_v)*Fxv+cos(delta_v)*Fyv; */
    /*  Maximale Radkraft */
    /* '<S11>:1:31' */
    rtb_rad_vx_h = ((7000.0 - *((const real_T **)ssGetInputPortSignalPtrs(S, 21))
                     [0]) * 0.1 / 7000.0 + 1.0) * (*((const real_T **)
      ssGetInputPortSignalPtrs(S, 23))[0] * *((const real_T **)
      ssGetInputPortSignalPtrs(S, 21))[0]);

    /*  Berechnung der Radkräfte */
    /* '<S11>:1:34' */
    /* '<S11>:1:35' */
    rtb_Fyh_rad = sin(atan(v_rad_idx_0 * flag4 / *((const real_T **)
      ssGetInputPortSignalPtrs(S, 23))[0]) * 1.65) * rtb_rad_vx_h * rtb_sy_rad_j
      / flag4;

    /* Outport: '<Root>/Fxvb' incorporates:
     *  Inport: '<Root>/rad_mue_vl'
     *  MATLAB Function: '<S4>/Berechnung Schlupf vorne'
     *  MATLAB Function: '<S4>/Berechnung der Radkräfte'
     */
    /*  % Transformation der Radkräfte in das Radkoordinatensystem */
    /*  Fxh_rad = cos(delta_h)*Fxh+sin(delta_h)*Fyh; */
    /*  Fyh_rad = -sin(delta_h)*Fxh+cos(delta_h)*Fyh; */
    ((real_T *)ssGetOutputPortSignal(S, 0))[0] = sin(atan(vboden * flag3 / *((
      const real_T **)ssGetInputPortSignalPtrs(S, 22))[0]) * 1.65) *
      rtb_rad_vx_v * flag6 / flag3;

    /* Outport: '<Root>/Fyvb' */
    ((real_T *)ssGetOutputPortSignal(S, 1))[0] = rtb_Fyv_rad;

    /* Outport: '<Root>/Fxhb' incorporates:
     *  Inport: '<Root>/rad_mue_hl'
     *  MATLAB Function: '<S4>/Berechnung Schlupf hinten'
     *  MATLAB Function: '<S4>/Berechnung der Radkräfte'
     */
    ((real_T *)ssGetOutputPortSignal(S, 2))[0] = sin(atan(v_rad_idx_0 * flag4 / *
      ((const real_T **)ssGetInputPortSignalPtrs(S, 23))[0]) * 1.65) *
      rtb_rad_vx_h * flag6_0 / flag4;

    /* Outport: '<Root>/Fyhb' */
    ((real_T *)ssGetOutputPortSignal(S, 3))[0] = rtb_Fyh_rad;
  }

  if (ssIsSampleHit(S, 1, tid)) {
    /* Outport: '<Root>/delta_va' incorporates:
     *  Inport: '<Root>/delta_v'
     */
    ((real_T *)ssGetOutputPortSignal(S, 4))[0] = *((const real_T **)
      ssGetInputPortSignalPtrs(S, 3))[0];
  }

  if (ssIsContinuousTask(S, tid)) {
    /* Outport: '<Root>/scaling_fkt_v' */
    ((real_T *)ssGetOutputPortSignal(S, 5))[0] = rtb_LookupTable4;

    /* Outport: '<Root>/scaling_fkt_h' */
    ((real_T *)ssGetOutputPortSignal(S, 6))[0] = rtb_LookupTable1;

    /* Outport: '<Root>/sx_v' */
    ((real_T *)ssGetOutputPortSignal(S, 7))[0] = flag6;

    /* Outport: '<Root>/sx_h' */
    ((real_T *)ssGetOutputPortSignal(S, 8))[0] = flag6_0;

    /* Outport: '<Root>/omega_h' */
    ((real_T *)ssGetOutputPortSignal(S, 9))[0] = rtb_omega_h;

    /* Outport: '<Root>/omega_v' */
    ((real_T *)ssGetOutputPortSignal(S, 10))[0] = rtb_omega_v;

    /* Outport: '<Root>/sx_flag_v' */
    ((real_T *)ssGetOutputPortSignal(S, 11))[0] = rtb_sx_flag;

    /* Outport: '<Root>/sx_flag_h' */
    ((real_T *)ssGetOutputPortSignal(S, 12))[0] = flag1;

    /* Outport: '<Root>/sy_v' */
    ((real_T *)ssGetOutputPortSignal(S, 13))[0] = rtb_sy_rad;

    /* Outport: '<Root>/sy_h' */
    ((real_T *)ssGetOutputPortSignal(S, 14))[0] = rtb_sy_rad_j;

    /* MATLAB Function: '<S5>/Reifennachlauf durch Latschverformung' */
    /* MATLAB Function 'Rad/Reifenrückstellmoment1/Reifennachlauf durch Latschverformung': '<S13>:1' */
    /*  Berechnet den Reifennachlauf nach Dissertation von Judi Hsu.  */
    /*  (ESTIMATION AND CONTROL OF LATERAL TIRE FORCES USING STEERING TORQUE) */
    /*  Es gibt einen auf 1 normierten Nachlauf. Dieser sinkt abhängig von Mü */
    /*  und alpha linear ab bis auf Null und bleibt dann konstant Null. */
    /*  ACHTUNG: WURDE IN SA VON Krebs ÜBERARBEITET (in meCarSim) */
    /*  Mü wird hier noch mit 1 angnommen! ... (1*0.354) ... */
    /* '<S13>:1:11' */
    /* '<S13>:1:12' */
    /* '<S13>:1:13' */
    /* '<S13>:1:14' */
    rtb_rad_vx_v_idx_1 = -rtb_sy_rad / 0.354 + 1.0;
    if (rtb_rad_vx_v_idx_1 < 0.0) {
      rtb_rad_vx_v_idx_1 = -1.0;
    } else if (rtb_rad_vx_v_idx_1 > 0.0) {
      rtb_rad_vx_v_idx_1 = 1.0;
    } else {
      if (rtb_rad_vx_v_idx_1 == 0.0) {
        rtb_rad_vx_v_idx_1 = 0.0;
      }
    }

    /* Sum: '<S5>/Sum' incorporates:
     *  Constant: '<S5>/Constant'
     *  MATLAB Function: '<S5>/Reifennachlauf durch Latschverformung'
     */
    flag4 = (-rtb_sy_rad / 0.354 + 1.0) * (rtb_rad_vx_v_idx_1 + 1.0) * 0.5 *
      0.03 + 0.02798;

    /* MATLAB Function: '<S5>/Reifennachlauf durch Latschverformung' */
    rtb_rad_vx_v_idx_1 = -rtb_sy_rad_j / 0.354 + 1.0;
    if (rtb_rad_vx_v_idx_1 < 0.0) {
      rtb_rad_vx_v_idx_1 = -1.0;
    } else if (rtb_rad_vx_v_idx_1 > 0.0) {
      rtb_rad_vx_v_idx_1 = 1.0;
    } else {
      if (rtb_rad_vx_v_idx_1 == 0.0) {
        rtb_rad_vx_v_idx_1 = 0.0;
      }
    }

    /* Sum: '<S5>/Sum2' incorporates:
     *  MATLAB Function: '<S5>/Reifennachlauf durch Latschverformung'
     */
    flag3 = (-rtb_sy_rad_j / 0.354 + 1.0) * (rtb_rad_vx_v_idx_1 + 1.0) * 0.5 *
      0.03;

    /* Outport: '<Root>/rad_n_ges_v' */
    ((real_T *)ssGetOutputPortSignal(S, 15))[0] = flag4;

    /* Outport: '<Root>/rad_M_z_v' incorporates:
     *  Gain: '<S5>/Latschlänge + Konstr. Nachlauf1'
     *  Product: '<S5>/Product'
     */
    ((real_T *)ssGetOutputPortSignal(S, 16))[0] = -(flag4 * rtb_Fyv_rad);

    /* Outport: '<Root>/rad_n_ges_h' */
    ((real_T *)ssGetOutputPortSignal(S, 17))[0] = flag3;

    /* Outport: '<Root>/rad_M_z_h' incorporates:
     *  Gain: '<S5>/Latschlänge + Konstr. Nachlauf5'
     *  Product: '<S5>/Product2'
     */
    ((real_T *)ssGetOutputPortSignal(S, 18))[0] = -(flag3 * rtb_Fyh_rad);

    /* Outport: '<Root>/s_abs_v' */
    ((real_T *)ssGetOutputPortSignal(S, 19))[0] = rtb_s_abs;

    /* Outport: '<Root>/s_abs_h' */
    ((real_T *)ssGetOutputPortSignal(S, 20))[0] = rtb_s_abs_k;

    /* Gain: '<S2>/1//Radträgheit' incorporates:
     *  Constant: '<S2>/Constant'
     *  Constant: '<S6>/Constant'
     *  Gain: '<S2>/Radradius'
     *  Inport: '<Root>/Fxv'
     *  Inport: '<Root>/M_brems_v'
     *  Product: '<S2>/Product'
     *  RelationalOperator: '<S6>/Compare'
     *  Sum: '<S2>/Sum'
     */
    _rtB->Radtrgheit = ((0.0 - 0.31 * *((const real_T **)
      ssGetInputPortSignalPtrs(S, 4))[0]) - (real_T)(rtb_Integrator > 0.0) * *((
      const real_T **)ssGetInputPortSignalPtrs(S, 1))[0]) * 0.4464883689779881;

    /* Gain: '<S2>/1//Radträgheit1' incorporates:
     *  Constant: '<S7>/Constant'
     *  Gain: '<S2>/Radradius2'
     *  Inport: '<Root>/Fxh'
     *  Inport: '<Root>/M_brems_h'
     *  Inport: '<Root>/M_rad'
     *  Product: '<S2>/Product1'
     *  RelationalOperator: '<S7>/Compare'
     *  Sum: '<S2>/Sum5'
     */
    _rtB->Radtrgheit1 = ((*((const real_T **)ssGetInputPortSignalPtrs(S, 0))[0]
                          - 0.31 * *((const real_T **)ssGetInputPortSignalPtrs(S,
      5))[0]) - (real_T)(rtb_Integrator1 > 0.0) * *((const real_T **)
      ssGetInputPortSignalPtrs(S, 2))[0]) * 0.4464883689779881;
  }

  UNUSED_PARAMETER(tid);
}

/* Update for root system: '<Root>' */
#define MDL_UPDATE

static void mdlUpdate(SimStruct *S, int_T tid)
{
  UNUSED_PARAMETER(tid);
}

/* Derivatives for root system: '<Root>' */
#define MDL_DERIVATIVES

static void mdlDerivatives(SimStruct *S)
{
  B_Rad_T *_rtB;
  XDot_Rad_T *_rtXdot;
  _rtXdot = ((XDot_Rad_T *) ssGetdX(S));
  _rtB = ((B_Rad_T *) ssGetLocalBlockIO(S));

  /* Derivatives for Integrator: '<S2>/Integrator' */
  _rtXdot->Integrator_CSTATE = _rtB->Radtrgheit;

  /* Derivatives for Integrator: '<S2>/Integrator1' */
  _rtXdot->Integrator1_CSTATE = _rtB->Radtrgheit1;
}

/* Termination for root system: '<Root>' */
static void mdlTerminate(SimStruct *S)
{

#if defined(RT_MALLOC) || defined(MATLAB_MEX_FILE)

  if (ssGetUserData(S) != (NULL) ) {
    rt_FREE(ssGetLocalBlockIO(S));
  }

  rt_FREE(ssGetUserData(S));

#endif

}

#if defined(RT_MALLOC) || defined(MATLAB_MEX_FILE)
#  include "Rad_mid.h"
#endif

/* Function to initialize sizes. */
static void mdlInitializeSizes(SimStruct *S)
{
  ssSetNumSampleTimes(S, 2);           /* Number of sample times */
  ssSetNumContStates(S, 2);            /* Number of continuous states */
  ssSetNumNonsampledZCs(S, 0);         /* Number of nonsampled ZCs */

  /* Number of output ports */
  if (!ssSetNumOutputPorts(S, 21))
    return;

  /* outport number: 0 */
  if (!ssSetOutputPortVectorDimension(S, 0, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 0, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 0, 0.0);
  ssSetOutputPortOffsetTime(S, 0, 0.0);
  ssSetOutputPortOptimOpts(S, 0, SS_REUSABLE_AND_LOCAL);

  /* outport number: 1 */
  if (!ssSetOutputPortVectorDimension(S, 1, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 1, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 1, 0.0);
  ssSetOutputPortOffsetTime(S, 1, 0.0);
  ssSetOutputPortOptimOpts(S, 1, SS_REUSABLE_AND_LOCAL);

  /* outport number: 2 */
  if (!ssSetOutputPortVectorDimension(S, 2, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 2, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 2, 0.0);
  ssSetOutputPortOffsetTime(S, 2, 0.0);
  ssSetOutputPortOptimOpts(S, 2, SS_REUSABLE_AND_LOCAL);

  /* outport number: 3 */
  if (!ssSetOutputPortVectorDimension(S, 3, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 3, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 3, 0.0);
  ssSetOutputPortOffsetTime(S, 3, 0.0);
  ssSetOutputPortOptimOpts(S, 3, SS_REUSABLE_AND_LOCAL);

  /* outport number: 4 */
  if (!ssSetOutputPortVectorDimension(S, 4, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 4, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 4, 0.001);
  ssSetOutputPortOffsetTime(S, 4, 0.0);
  ssSetOutputPortOptimOpts(S, 4, SS_REUSABLE_AND_LOCAL);

  /* outport number: 5 */
  if (!ssSetOutputPortVectorDimension(S, 5, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 5, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 5, 0.0);
  ssSetOutputPortOffsetTime(S, 5, 0.0);
  ssSetOutputPortOptimOpts(S, 5, SS_REUSABLE_AND_LOCAL);

  /* outport number: 6 */
  if (!ssSetOutputPortVectorDimension(S, 6, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 6, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 6, 0.0);
  ssSetOutputPortOffsetTime(S, 6, 0.0);
  ssSetOutputPortOptimOpts(S, 6, SS_REUSABLE_AND_LOCAL);

  /* outport number: 7 */
  if (!ssSetOutputPortVectorDimension(S, 7, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 7, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 7, 0.0);
  ssSetOutputPortOffsetTime(S, 7, 0.0);
  ssSetOutputPortOptimOpts(S, 7, SS_REUSABLE_AND_LOCAL);

  /* outport number: 8 */
  if (!ssSetOutputPortVectorDimension(S, 8, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 8, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 8, 0.0);
  ssSetOutputPortOffsetTime(S, 8, 0.0);
  ssSetOutputPortOptimOpts(S, 8, SS_REUSABLE_AND_LOCAL);

  /* outport number: 9 */
  if (!ssSetOutputPortVectorDimension(S, 9, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 9, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 9, 0.0);
  ssSetOutputPortOffsetTime(S, 9, 0.0);
  ssSetOutputPortOptimOpts(S, 9, SS_REUSABLE_AND_LOCAL);

  /* outport number: 10 */
  if (!ssSetOutputPortVectorDimension(S, 10, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 10, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 10, 0.0);
  ssSetOutputPortOffsetTime(S, 10, 0.0);
  ssSetOutputPortOptimOpts(S, 10, SS_REUSABLE_AND_LOCAL);

  /* outport number: 11 */
  if (!ssSetOutputPortVectorDimension(S, 11, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 11, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 11, 0.0);
  ssSetOutputPortOffsetTime(S, 11, 0.0);
  ssSetOutputPortOptimOpts(S, 11, SS_REUSABLE_AND_LOCAL);

  /* outport number: 12 */
  if (!ssSetOutputPortVectorDimension(S, 12, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 12, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 12, 0.0);
  ssSetOutputPortOffsetTime(S, 12, 0.0);
  ssSetOutputPortOptimOpts(S, 12, SS_REUSABLE_AND_LOCAL);

  /* outport number: 13 */
  if (!ssSetOutputPortVectorDimension(S, 13, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 13, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 13, 0.0);
  ssSetOutputPortOffsetTime(S, 13, 0.0);
  ssSetOutputPortOptimOpts(S, 13, SS_REUSABLE_AND_LOCAL);

  /* outport number: 14 */
  if (!ssSetOutputPortVectorDimension(S, 14, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 14, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 14, 0.0);
  ssSetOutputPortOffsetTime(S, 14, 0.0);
  ssSetOutputPortOptimOpts(S, 14, SS_REUSABLE_AND_LOCAL);

  /* outport number: 15 */
  if (!ssSetOutputPortVectorDimension(S, 15, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 15, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 15, 0.0);
  ssSetOutputPortOffsetTime(S, 15, 0.0);
  ssSetOutputPortOptimOpts(S, 15, SS_REUSABLE_AND_LOCAL);

  /* outport number: 16 */
  if (!ssSetOutputPortVectorDimension(S, 16, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 16, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 16, 0.0);
  ssSetOutputPortOffsetTime(S, 16, 0.0);
  ssSetOutputPortOptimOpts(S, 16, SS_REUSABLE_AND_LOCAL);

  /* outport number: 17 */
  if (!ssSetOutputPortVectorDimension(S, 17, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 17, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 17, 0.0);
  ssSetOutputPortOffsetTime(S, 17, 0.0);
  ssSetOutputPortOptimOpts(S, 17, SS_REUSABLE_AND_LOCAL);

  /* outport number: 18 */
  if (!ssSetOutputPortVectorDimension(S, 18, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 18, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 18, 0.0);
  ssSetOutputPortOffsetTime(S, 18, 0.0);
  ssSetOutputPortOptimOpts(S, 18, SS_REUSABLE_AND_LOCAL);

  /* outport number: 19 */
  if (!ssSetOutputPortVectorDimension(S, 19, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 19, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 19, 0.0);
  ssSetOutputPortOffsetTime(S, 19, 0.0);
  ssSetOutputPortOptimOpts(S, 19, SS_REUSABLE_AND_LOCAL);

  /* outport number: 20 */
  if (!ssSetOutputPortVectorDimension(S, 20, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 20, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 20, 0.0);
  ssSetOutputPortOffsetTime(S, 20, 0.0);
  ssSetOutputPortOptimOpts(S, 20, SS_REUSABLE_AND_LOCAL);

  /* Number of input ports */
  if (!ssSetNumInputPorts(S, 24))
    return;

  /* inport number: 0 */
  {
    if (!ssSetInputPortVectorDimension(S, 0, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 0, SS_DOUBLE);
    }

    ssSetInputPortDirectFeedThrough(S, 0, 1);
    ssSetInputPortSampleTime(S, 0, 0.0);
    ssSetInputPortOffsetTime(S, 0, 0.0);
    ssSetInputPortOverWritable(S, 0, 0);
    ssSetInputPortOptimOpts(S, 0, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 1 */
  {
    if (!ssSetInputPortVectorDimension(S, 1, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 1, SS_DOUBLE);
    }

    ssSetInputPortDirectFeedThrough(S, 1, 1);
    ssSetInputPortSampleTime(S, 1, 0.0);
    ssSetInputPortOffsetTime(S, 1, 0.0);
    ssSetInputPortOverWritable(S, 1, 0);
    ssSetInputPortOptimOpts(S, 1, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 2 */
  {
    if (!ssSetInputPortVectorDimension(S, 2, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 2, SS_DOUBLE);
    }

    ssSetInputPortDirectFeedThrough(S, 2, 1);
    ssSetInputPortSampleTime(S, 2, 0.0);
    ssSetInputPortOffsetTime(S, 2, 0.0);
    ssSetInputPortOverWritable(S, 2, 0);
    ssSetInputPortOptimOpts(S, 2, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 3 */
  {
    if (!ssSetInputPortVectorDimension(S, 3, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 3, SS_DOUBLE);
    }

    ssSetInputPortDirectFeedThrough(S, 3, 1);
    ssSetInputPortSampleTime(S, 3, 0.001);
    ssSetInputPortOffsetTime(S, 3, 0.0);
    ssSetInputPortOverWritable(S, 3, 0);
    ssSetInputPortOptimOpts(S, 3, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 4 */
  {
    if (!ssSetInputPortVectorDimension(S, 4, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 4, SS_DOUBLE);
    }

    ssSetInputPortDirectFeedThrough(S, 4, 1);
    ssSetInputPortSampleTime(S, 4, 0.0);
    ssSetInputPortOffsetTime(S, 4, 0.0);
    ssSetInputPortOverWritable(S, 4, 0);
    ssSetInputPortOptimOpts(S, 4, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 5 */
  {
    if (!ssSetInputPortVectorDimension(S, 5, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 5, SS_DOUBLE);
    }

    ssSetInputPortDirectFeedThrough(S, 5, 1);
    ssSetInputPortSampleTime(S, 5, 0.0);
    ssSetInputPortOffsetTime(S, 5, 0.0);
    ssSetInputPortOverWritable(S, 5, 0);
    ssSetInputPortOptimOpts(S, 5, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 6 */
  {
    if (!ssSetInputPortVectorDimension(S, 6, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 6, SS_DOUBLE);
    }

    ssSetInputPortSampleTime(S, 6, 0.001);
    ssSetInputPortOffsetTime(S, 6, 0.0);
    ssSetInputPortOverWritable(S, 6, 0);
    ssSetInputPortOptimOpts(S, 6, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 7 */
  {
    if (!ssSetInputPortVectorDimension(S, 7, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 7, SS_DOUBLE);
    }

    ssSetInputPortSampleTime(S, 7, 0.001);
    ssSetInputPortOffsetTime(S, 7, 0.0);
    ssSetInputPortOverWritable(S, 7, 0);
    ssSetInputPortOptimOpts(S, 7, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 8 */
  {
    if (!ssSetInputPortVectorDimension(S, 8, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 8, SS_DOUBLE);
    }

    ssSetInputPortDirectFeedThrough(S, 8, 1);
    ssSetInputPortSampleTime(S, 8, 0.0);
    ssSetInputPortOffsetTime(S, 8, 0.0);
    ssSetInputPortOverWritable(S, 8, 0);
    ssSetInputPortOptimOpts(S, 8, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 9 */
  {
    if (!ssSetInputPortVectorDimension(S, 9, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 9, SS_DOUBLE);
    }

    ssSetInputPortSampleTime(S, 9, 0.001);
    ssSetInputPortOffsetTime(S, 9, 0.0);
    ssSetInputPortOverWritable(S, 9, 0);
    ssSetInputPortOptimOpts(S, 9, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 10 */
  {
    if (!ssSetInputPortVectorDimension(S, 10, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 10, SS_DOUBLE);
    }

    ssSetInputPortSampleTime(S, 10, 0.001);
    ssSetInputPortOffsetTime(S, 10, 0.0);
    ssSetInputPortOverWritable(S, 10, 0);
    ssSetInputPortOptimOpts(S, 10, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 11 */
  {
    if (!ssSetInputPortVectorDimension(S, 11, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 11, SS_DOUBLE);
    }

    ssSetInputPortSampleTime(S, 11, 0.001);
    ssSetInputPortOffsetTime(S, 11, 0.0);
    ssSetInputPortOverWritable(S, 11, 0);
    ssSetInputPortOptimOpts(S, 11, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 12 */
  {
    if (!ssSetInputPortVectorDimension(S, 12, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 12, SS_DOUBLE);
    }

    ssSetInputPortDirectFeedThrough(S, 12, 1);
    ssSetInputPortSampleTime(S, 12, 0.0);
    ssSetInputPortOffsetTime(S, 12, 0.0);
    ssSetInputPortOverWritable(S, 12, 0);
    ssSetInputPortOptimOpts(S, 12, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 13 */
  {
    if (!ssSetInputPortVectorDimension(S, 13, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 13, SS_DOUBLE);
    }

    ssSetInputPortDirectFeedThrough(S, 13, 1);
    ssSetInputPortSampleTime(S, 13, 0.0);
    ssSetInputPortOffsetTime(S, 13, 0.0);
    ssSetInputPortOverWritable(S, 13, 0);
    ssSetInputPortOptimOpts(S, 13, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 14 */
  {
    if (!ssSetInputPortVectorDimension(S, 14, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 14, SS_DOUBLE);
    }

    ssSetInputPortSampleTime(S, 14, 0.001);
    ssSetInputPortOffsetTime(S, 14, 0.0);
    ssSetInputPortOverWritable(S, 14, 0);
    ssSetInputPortOptimOpts(S, 14, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 15 */
  {
    if (!ssSetInputPortVectorDimension(S, 15, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 15, SS_DOUBLE);
    }

    ssSetInputPortSampleTime(S, 15, 0.001);
    ssSetInputPortOffsetTime(S, 15, 0.0);
    ssSetInputPortOverWritable(S, 15, 0);
    ssSetInputPortOptimOpts(S, 15, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 16 */
  {
    if (!ssSetInputPortVectorDimension(S, 16, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 16, SS_DOUBLE);
    }

    ssSetInputPortDirectFeedThrough(S, 16, 1);
    ssSetInputPortSampleTime(S, 16, 0.0);
    ssSetInputPortOffsetTime(S, 16, 0.0);
    ssSetInputPortOverWritable(S, 16, 0);
    ssSetInputPortOptimOpts(S, 16, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 17 */
  {
    if (!ssSetInputPortVectorDimension(S, 17, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 17, SS_DOUBLE);
    }

    ssSetInputPortSampleTime(S, 17, 0.001);
    ssSetInputPortOffsetTime(S, 17, 0.0);
    ssSetInputPortOverWritable(S, 17, 0);
    ssSetInputPortOptimOpts(S, 17, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 18 */
  {
    if (!ssSetInputPortVectorDimension(S, 18, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 18, SS_DOUBLE);
    }

    ssSetInputPortSampleTime(S, 18, 0.001);
    ssSetInputPortOffsetTime(S, 18, 0.0);
    ssSetInputPortOverWritable(S, 18, 0);
    ssSetInputPortOptimOpts(S, 18, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 19 */
  {
    if (!ssSetInputPortVectorDimension(S, 19, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 19, SS_DOUBLE);
    }

    ssSetInputPortSampleTime(S, 19, 0.001);
    ssSetInputPortOffsetTime(S, 19, 0.0);
    ssSetInputPortOverWritable(S, 19, 0);
    ssSetInputPortOptimOpts(S, 19, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 20 */
  {
    if (!ssSetInputPortVectorDimension(S, 20, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 20, SS_DOUBLE);
    }

    ssSetInputPortDirectFeedThrough(S, 20, 1);
    ssSetInputPortSampleTime(S, 20, 0.001);
    ssSetInputPortOffsetTime(S, 20, 0.0);
    ssSetInputPortOverWritable(S, 20, 0);
    ssSetInputPortOptimOpts(S, 20, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 21 */
  {
    if (!ssSetInputPortVectorDimension(S, 21, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 21, SS_DOUBLE);
    }

    ssSetInputPortDirectFeedThrough(S, 21, 1);
    ssSetInputPortSampleTime(S, 21, 0.001);
    ssSetInputPortOffsetTime(S, 21, 0.0);
    ssSetInputPortOverWritable(S, 21, 0);
    ssSetInputPortOptimOpts(S, 21, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 22 */
  {
    if (!ssSetInputPortVectorDimension(S, 22, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 22, SS_DOUBLE);
    }

    ssSetInputPortDirectFeedThrough(S, 22, 1);
    ssSetInputPortSampleTime(S, 22, 0.001);
    ssSetInputPortOffsetTime(S, 22, 0.0);
    ssSetInputPortOverWritable(S, 22, 0);
    ssSetInputPortOptimOpts(S, 22, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  /* inport number: 23 */
  {
    if (!ssSetInputPortVectorDimension(S, 23, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 23, SS_DOUBLE);
    }

    ssSetInputPortDirectFeedThrough(S, 23, 1);
    ssSetInputPortSampleTime(S, 23, 0.001);
    ssSetInputPortOffsetTime(S, 23, 0.0);
    ssSetInputPortOverWritable(S, 23, 0);
    ssSetInputPortOptimOpts(S, 23, SS_NOT_REUSABLE_AND_GLOBAL);
  }

  ssSetRTWGeneratedSFcn(S, 1);         /* Generated S-function */

  /* Tunable Parameters */
  ssSetNumSFcnParams(S, 0);

  /* Number of expected parameters */
#if defined(MATLAB_MEX_FILE)

  if (ssGetNumSFcnParams(S) == ssGetSFcnParamsCount(S)) {

#if defined(MDL_CHECK_PARAMETERS)

    mdlCheckParameters(S);

#endif                                 /* MDL_CHECK_PARAMETERS */

    if (ssGetErrorStatus(S) != (NULL) ) {
      return;
    }
  } else {
    return;                            /* Parameter mismatch will be reported by Simulink */
  }

#endif                                 /* MATLAB_MEX_FILE */

  /* Options */
  ssSetOptions(S, (SS_OPTION_RUNTIME_EXCEPTION_FREE_CODE |
                   SS_OPTION_PORT_SAMPLE_TIMES_ASSIGNED ));

#if SS_SFCN_FOR_SIM

  {
    ssSupportsMultipleExecInstances(S, true);
    ssHasStateInsideForEachSS(S, false);
  }

#endif

}

/* Function to initialize sample times. */
static void mdlInitializeSampleTimes(SimStruct *S)
{
  /* task periods */
  ssSetSampleTime(S, 0, 0.0);
  ssSetSampleTime(S, 1, 0.001);

  /* task offsets */
  ssSetOffsetTime(S, 0, 0.0);
  ssSetOffsetTime(S, 1, 0.0);
}

#if defined(MATLAB_MEX_FILE)
# include "fixedpoint.c"
# include "simulink.c"
#else
# undef S_FUNCTION_NAME
# define S_FUNCTION_NAME               Rad_sf
# include "cg_sfun.h"
#endif                                 /* defined(MATLAB_MEX_FILE) */
