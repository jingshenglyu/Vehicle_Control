/*
 * c_alpha_sf.h
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

#ifndef RTW_HEADER_c_alpha_sf_h_
#define RTW_HEADER_c_alpha_sf_h_
#include <math.h>
#include <string.h>
#include <stddef.h>
#ifndef c_alpha_sf_COMMON_INCLUDES_
# define c_alpha_sf_COMMON_INCLUDES_
#include <stdlib.h>
#define S_FUNCTION_NAME                c_alpha_sf
#define S_FUNCTION_LEVEL               2
#define RTW_GENERATED_S_FUNCTION
#include "rtwtypes.h"
#include "simstruc.h"
#include "fixedpoint.h"
#if !defined(MATLAB_MEX_FILE)
#include "rt_matrx.h"
#endif

#if !defined(RTW_SFUNCTION_DEFINES)
#define RTW_SFUNCTION_DEFINES

typedef struct {
  void *blockIO;
  void *defaultParam;
  void *nonContDerivSig;
} LocalS;

#define ssSetLocalBlockIO(S, io)       ((LocalS *)ssGetUserData(S))->blockIO = ((void *)(io))
#define ssGetLocalBlockIO(S)           ((LocalS *)ssGetUserData(S))->blockIO
#define ssSetLocalDefaultParam(S, paramVector) ((LocalS *)ssGetUserData(S))->defaultParam = (paramVector)
#define ssGetLocalDefaultParam(S)      ((LocalS *)ssGetUserData(S))->defaultParam
#define ssSetLocalNonContDerivSig(S, pSig) ((LocalS *)ssGetUserData(S))->nonContDerivSig = (pSig)
#define ssGetLocalNonContDerivSig(S)   ((LocalS *)ssGetUserData(S))->nonContDerivSig
#endif
#endif                                 /* c_alpha_sf_COMMON_INCLUDES_ */

#include "c_alpha_sf_types.h"

/* Shared type includes */
#include "multiword_types.h"
#include "rtGetNaN.h"
#include "rtGetInf.h"
#include "rt_nonfinite.h"
#include "rt_defines.h"

/* External inputs (root inport signals with auto storage) */
typedef struct {
  real_T *rad_mue_vl;                  /* '<Root>/mue_v' */
  real_T *rad_mue_hl;                  /* '<Root>/mue_h' */
  real_T *Fxv;                         /* '<Root>/Fxv' */
  real_T *Fyv;                         /* '<Root>/Fyv' */
  real_T *Fxh;                         /* '<Root>/Fxh' */
  real_T *Fyh;                         /* '<Root>/Fyh' */
  real_T *delta_v;                     /* '<Root>/delta_v' */
  real_T *scaling_fkt_v;               /* '<Root>/scaling_fkt_v' */
  real_T *scaling_fkt_h;               /* '<Root>/scaling_fkt_h' */
  real_T *sx_v;                        /* '<Root>/sx_v' */
  real_T *sx_h;                        /* '<Root>/sx_h' */
  real_T *omega_h;                     /* '<Root>/omega_h' */
  real_T *omega_v;                     /* '<Root>/omega_v' */
  real_T *sx_flag_v;                   /* '<Root>/sx_flag_v' */
  real_T *sx_flag_h;                   /* '<Root>/sx_flag_h' */
  real_T *sy_v;                        /* '<Root>/sy_v' */
  real_T *sy_h;                        /* '<Root>/sy_h' */
  real_T *rad_n_ges_v;                 /* '<Root>/rad_n_ges_v' */
  real_T *rad_M_z_v;                   /* '<Root>/rad_M_z_v' */
  real_T *rad_n_ges_h;                 /* '<Root>/rad_n_ges_h' */
  real_T *rad_M_z_h;                   /* '<Root>/rad_M_z_h' */
  real_T *s_abs_v;                     /* '<Root>/s_abs_v' */
  real_T *s_abs_h;                     /* '<Root>/s_abs_h' */
  real_T *Fzv;                         /* '<Root>/Fzv' */
  real_T *Fzh;                         /* '<Root>/Fzh' */
} ExternalUPtrs_c_alpha_T;

/* External outputs (root outports fed by signals with auto storage) */
typedef struct {
  real_T *c_alpha_v;                   /* '<Root>/c_alpha_v' */
  real_T *c_alpha_h;                   /* '<Root>/c_alpha_h' */
} ExtY_c_alpha_T;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Note that this particular code originates from a subsystem build,
 * and has its own system numbers different from the parent model.
 * Refer to the system hierarchy for this subsystem below, and use the
 * MATLAB hilite_system command to trace the generated code back
 * to the parent model.  For example,
 *
 * hilite_system('ESP_ESM/Regelsysteme/ESP/c_alpha')    - opens subsystem ESP_ESM/Regelsysteme/ESP/c_alpha
 * hilite_system('ESP_ESM/Regelsysteme/ESP/c_alpha/Kp') - opens and selects block Kp
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'ESP_ESM/Regelsysteme/ESP'
 * '<S1>'   : 'ESP_ESM/Regelsysteme/ESP/c_alpha'
 * '<S2>'   : 'ESP_ESM/Regelsysteme/ESP/c_alpha/ c_alpha'
 */
#endif                                 /* RTW_HEADER_c_alpha_sf_h_ */
