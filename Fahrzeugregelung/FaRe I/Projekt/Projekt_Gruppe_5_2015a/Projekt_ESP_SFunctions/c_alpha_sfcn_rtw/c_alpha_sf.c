/*
 * c_alpha_sf.c
 *
 * Code generation for model "c_alpha_sf".
 *
 * Model version              : 1.14
 * Simulink Coder version : 8.8 (R2015a) 09-Feb-2015
 * C source code generated on : Mon Jan 16 11:02:07 2017
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
#include "c_alpha_sf.h"
#include "c_alpha_sf_private.h"
#include "simstruc.h"
#include "fixedpoint.h"
#if defined(RT_MALLOC) || defined(MATLAB_MEX_FILE)

extern void *c_alpha_malloc(SimStruct *S);

#endif

#ifndef __RTW_UTFREE__
#if defined (MATLAB_MEX_FILE)

extern void * utMalloc(size_t);
extern void utFree(void *);

#endif
#endif                                 /* #ifndef __RTW_UTFREE__ */

#if defined(MATLAB_MEX_FILE)
#include "rt_nonfinite.c"
#endif

static const char_T *RT_MEMORY_ALLOCATION_ERROR =
  "memory allocation error in generated S-Function";

/* Start for root system: '<Root>' */
#define MDL_START

static void mdlStart(SimStruct *S)
{
  /* instance underlying S-Function data */
#if defined(RT_MALLOC) || defined(MATLAB_MEX_FILE)
#  if defined(MATLAB_MEX_FILE)

  /* non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

#  endif

  c_alpha_malloc(S);
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
  real_T Fmax_v;
  real_T Fmax_h;
  real_T rtb_c_alpha_v;

  /* MATLAB Function: '<S1>/ c_alpha' incorporates:
   *  Constant: '<S1>/Constant'
   *  Inport: '<Root>/Fzh'
   *  Inport: '<Root>/Fzv'
   *  Inport: '<Root>/mue_h'
   *  Inport: '<Root>/mue_v'
   */
  /* MATLAB Function 'c_alpha/ c_alpha': '<S2>:1' */
  /*  Berechnungen der Rakr‰fte nach simple Pacejka, Datensatz ist isotrop */
  /*  Fall ausschlieﬂen, dass s_v und s_h Null werden */
  /*  Stand-Still Scaling: */
  /* '<S2>:1:17' */
  /* '<S2>:1:18' */
  /*  Maximale Radkraft */
  /* '<S2>:1:21' */
  Fmax_v = ((7000.0 - *((const real_T **)ssGetInputPortSignalPtrs(S, 23))[0]) *
            0.1 / 7000.0 + 1.0) * (*((const real_T **)ssGetInputPortSignalPtrs(S,
    0))[0] * *((const real_T **)ssGetInputPortSignalPtrs(S, 23))[0]);

  /*  Berechnung der Radkr‰fte */
  /*  % Transformation der Radkr‰fte in das Radkoordinatensystem */
  /*  Fxv_rad = cos(delta_v)*Fxv+sin(delta_v)*Fyv; */
  /*  Fyv_rad = -sin(delta_v)*Fxv+cos(delta_v)*Fyv; */
  /*  Maximale Radkraft */
  /* '<S2>:1:33' */
  Fmax_h = ((7000.0 - *((const real_T **)ssGetInputPortSignalPtrs(S, 24))[0]) *
            0.1 / 7000.0 + 1.0) * (*((const real_T **)ssGetInputPortSignalPtrs(S,
    1))[0] * *((const real_T **)ssGetInputPortSignalPtrs(S, 24))[0]);

  /*  Berechnung der Radkr‰fte */
  /*  % Transformation der Radkr‰fte in das Radkoordinatensystem */
  /*  Fxh_rad = cos(delta_h)*Fxh+sin(delta_h)*Fyh; */
  /*  Fyh_rad = -sin(delta_h)*Fxh+cos(delta_h)*Fyh; */
  /* Ableitungen der Seitenkraefte nach Seitenschlupf */
  /* '<S2>:1:45' */
  /* '<S2>:1:46' */
  /* '<S2>:1:49' */
  rtb_c_alpha_v = (sin(atan(0.3794733192202055 / *((const real_T **)
    ssGetInputPortSignalPtrs(S, 0))[0]) * 1.65) * Fmax_v / 0.031622776601683791
                   - sin(atan(0.3794733192202055 / *((const real_T **)
    ssGetInputPortSignalPtrs(S, 0))[0]) * 1.65) * (Fmax_v * 1.0E-6) /
                   3.1622776601683795E-5) + Fmax_v * 12.0 * 1.65 * 1.0E-6 * cos
    (atan(0.3794733192202055 / *((const real_T **)ssGetInputPortSignalPtrs(S, 0))
          [0]) * 1.65) / ((0.14400000000000002 / (*((const real_T **)
    ssGetInputPortSignalPtrs(S, 0))[0] * *((const real_T **)
    ssGetInputPortSignalPtrs(S, 0))[0]) + 1.0) * (*((const real_T **)
    ssGetInputPortSignalPtrs(S, 0))[0] * 0.001));

  /* '<S2>:1:50' */
  Fmax_v = (sin(atan(0.3794733192202055 / *((const real_T **)
    ssGetInputPortSignalPtrs(S, 1))[0]) * 1.65) * Fmax_h / 0.031622776601683791
            - sin(atan(0.3794733192202055 / *((const real_T **)
    ssGetInputPortSignalPtrs(S, 1))[0]) * 1.65) * (Fmax_h * 1.0E-6) /
            3.1622776601683795E-5) + Fmax_h * 12.0 * 1.65 * 1.0E-6 * cos(atan
    (0.3794733192202055 / *((const real_T **)ssGetInputPortSignalPtrs(S, 1))[0])
    * 1.65) / ((0.14400000000000002 / (*((const real_T **)
    ssGetInputPortSignalPtrs(S, 1))[0] * *((const real_T **)
    ssGetInputPortSignalPtrs(S, 1))[0]) + 1.0) * (*((const real_T **)
    ssGetInputPortSignalPtrs(S, 1))[0] * 0.001));

  /* Saturate: '<S1>/Saturation' */
  if (rtb_c_alpha_v <= 1000.0) {
    /* Outport: '<Root>/c_alpha_v' */
    ((real_T *)ssGetOutputPortSignal(S, 0))[0] = 1000.0;
  } else {
    /* Outport: '<Root>/c_alpha_v' */
    ((real_T *)ssGetOutputPortSignal(S, 0))[0] = rtb_c_alpha_v;
  }

  /* End of Saturate: '<S1>/Saturation' */

  /* Saturate: '<S1>/Saturation1' */
  if (Fmax_v <= 1000.0) {
    /* Outport: '<Root>/c_alpha_h' */
    ((real_T *)ssGetOutputPortSignal(S, 1))[0] = 1000.0;
  } else {
    /* Outport: '<Root>/c_alpha_h' */
    ((real_T *)ssGetOutputPortSignal(S, 1))[0] = Fmax_v;
  }

  /* End of Saturate: '<S1>/Saturation1' */
  UNUSED_PARAMETER(tid);
}

/* Update for root system: '<Root>' */
#define MDL_UPDATE

static void mdlUpdate(SimStruct *S, int_T tid)
{
  UNUSED_PARAMETER(tid);
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
#  include "c_alpha_mid.h"
#endif

/* Function to initialize sizes. */
static void mdlInitializeSizes(SimStruct *S)
{
  ssSetNumSampleTimes(S, 1);           /* Number of sample times */
  ssSetNumContStates(S, 0);            /* Number of continuous states */
  ssSetNumNonsampledZCs(S, 0);         /* Number of nonsampled ZCs */

  /* Number of output ports */
  if (!ssSetNumOutputPorts(S, 2))
    return;

  /* outport number: 0 */
  if (!ssSetOutputPortVectorDimension(S, 0, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 0, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 0, 0.001);
  ssSetOutputPortOffsetTime(S, 0, 0.0);
  ssSetOutputPortOptimOpts(S, 0, SS_REUSABLE_AND_LOCAL);

  /* outport number: 1 */
  if (!ssSetOutputPortVectorDimension(S, 1, 1))
    return;
  if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
    ssSetOutputPortDataType(S, 1, SS_DOUBLE);
  }

  ssSetOutputPortSampleTime(S, 1, 0.001);
  ssSetOutputPortOffsetTime(S, 1, 0.0);
  ssSetOutputPortOptimOpts(S, 1, SS_REUSABLE_AND_LOCAL);

  /* Number of input ports */
  if (!ssSetNumInputPorts(S, 25))
    return;

  /* inport number: 0 */
  {
    if (!ssSetInputPortVectorDimension(S, 0, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 0, SS_DOUBLE);
    }

    ssSetInputPortDirectFeedThrough(S, 0, 1);
    ssSetInputPortSampleTime(S, 0, 0.001);
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
    ssSetInputPortSampleTime(S, 1, 0.001);
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

    ssSetInputPortSampleTime(S, 2, 0.001);
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

    ssSetInputPortSampleTime(S, 4, 0.001);
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

    ssSetInputPortSampleTime(S, 5, 0.001);
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

    ssSetInputPortSampleTime(S, 8, 0.001);
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

    ssSetInputPortSampleTime(S, 12, 0.001);
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

    ssSetInputPortSampleTime(S, 13, 0.001);
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

    ssSetInputPortSampleTime(S, 16, 0.001);
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

  /* inport number: 24 */
  {
    if (!ssSetInputPortVectorDimension(S, 24, 1))
      return;
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
      ssSetInputPortDataType(S, 24, SS_DOUBLE);
    }

    ssSetInputPortDirectFeedThrough(S, 24, 1);
    ssSetInputPortSampleTime(S, 24, 0.001);
    ssSetInputPortOffsetTime(S, 24, 0.0);
    ssSetInputPortOverWritable(S, 24, 0);
    ssSetInputPortOptimOpts(S, 24, SS_NOT_REUSABLE_AND_GLOBAL);
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
  ssSetSampleTime(S, 0, 0.001);

  /* task offsets */
  ssSetOffsetTime(S, 0, 0.0);
}

#if defined(MATLAB_MEX_FILE)
# include "fixedpoint.c"
# include "simulink.c"
#else
# undef S_FUNCTION_NAME
# define S_FUNCTION_NAME               c_alpha_sf
# include "cg_sfun.h"
#endif                                 /* defined(MATLAB_MEX_FILE) */
