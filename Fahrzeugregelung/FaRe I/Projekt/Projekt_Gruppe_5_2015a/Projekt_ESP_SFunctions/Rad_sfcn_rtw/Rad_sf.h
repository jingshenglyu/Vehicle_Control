/*
 * Rad_sf.h
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

#ifndef RTW_HEADER_Rad_sf_h_
#define RTW_HEADER_Rad_sf_h_
#include <math.h>
#include <string.h>
#include <stddef.h>
#ifndef Rad_sf_COMMON_INCLUDES_
# define Rad_sf_COMMON_INCLUDES_
#include <stdlib.h>
#define S_FUNCTION_NAME                Rad_sf
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
#endif                                 /* Rad_sf_COMMON_INCLUDES_ */

#include "Rad_sf_types.h"

/* Shared type includes */
#include "multiword_types.h"
#include "rtGetNaN.h"
#include "rt_nonfinite.h"
#include "rt_defines.h"
#include "rtGetInf.h"

/* Block signals (auto storage) */
typedef struct {
  real_T Radtrgheit;                   /* '<S2>/1//Radträgheit' */
  real_T Radtrgheit1;                  /* '<S2>/1//Radträgheit1' */
} B_Rad_T;

/* Continuous states (auto storage) */
typedef struct {
  real_T Integrator_CSTATE;            /* '<S2>/Integrator' */
  real_T Integrator1_CSTATE;           /* '<S2>/Integrator1' */
} X_Rad_T;

/* State derivatives (auto storage) */
typedef struct {
  real_T Integrator_CSTATE;            /* '<S2>/Integrator' */
  real_T Integrator1_CSTATE;           /* '<S2>/Integrator1' */
} XDot_Rad_T;

/* State disabled  */
typedef struct {
  boolean_T Integrator_CSTATE;         /* '<S2>/Integrator' */
  boolean_T Integrator1_CSTATE;        /* '<S2>/Integrator1' */
} XDis_Rad_T;

/* Constant parameters (auto storage) */
typedef struct {
  /* Pooled Parameter (Expression: [0,0.0001, 0.001, 0.01, 0.1, 1, 10 ])
   * Referenced by:
   *   '<S12>/Lookup Table1'
   *   '<S12>/Lookup Table4'
   */
  real_T pooled8[7];

  /* Pooled Parameter (Expression: ([1e-6, 0.2e-5, 0.25e-4, 0.1e-3, 0.1e-2, 1e-1, 1]))
   * Referenced by:
   *   '<S12>/Lookup Table1'
   *   '<S12>/Lookup Table4'
   */
  real_T pooled9[7];
} ConstP_Rad_T;

/* External inputs (root inport signals with auto storage) */
typedef struct {
  real_T *M_rad;                       /* '<Root>/M_rad' */
  real_T *M_brems_v;                   /* '<Root>/M_brems_v' */
  real_T *M_brems_h;                   /* '<Root>/M_brems_h' */
  real_T *delta_v;                     /* '<Root>/delta_v' */
  real_T *Fxv;                         /* '<Root>/Fxv' */
  real_T *Fxh;                         /* '<Root>/Fxh' */
  real_T *Fyv;                         /* '<Root>/Fyv' */
  real_T *Fyh;                         /* '<Root>/Fyh' */
  real_T *delta_v_h;                   /* '<Root>/delta_vb' */
  real_T *pos_x;                       /* '<Root>/pos_x' */
  real_T *pos_y;                       /* '<Root>/pos_y' */
  real_T *psi;                         /* '<Root>/psi' */
  real_T *beta;                        /* '<Root>/beta' */
  real_T *v;                           /* '<Root>/v' */
  real_T *v_p;                         /* '<Root>/v_p' */
  real_T *F_Luft;                      /* '<Root>/F_Luft' */
  real_T *psi_p;                       /* '<Root>/psi_p' */
  real_T *a_y;                         /* '<Root>/a_y' */
  real_T *M_z;                         /* '<Root>/M_z' */
  real_T *a_x;                         /* '<Root>/a_x' */
  real_T *Fzv;                         /* '<Root>/Fzv' */
  real_T *Fzh;                         /* '<Root>/Fzh' */
  real_T *rad_mue_vl;                  /* '<Root>/rad_mue_vl' */
  real_T *rad_mue_hl;                  /* '<Root>/rad_mue_hl' */
} ExternalUPtrs_Rad_T;

/* External outputs (root outports fed by signals with auto storage) */
typedef struct {
  real_T *Fxvb;                        /* '<Root>/Fxvb' */
  real_T *Fyvb;                        /* '<Root>/Fyvb' */
  real_T *Fxhb;                        /* '<Root>/Fxhb' */
  real_T *Fyhb;                        /* '<Root>/Fyhb' */
  real_T *delta_va;                    /* '<Root>/delta_va' */
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
} ExtY_Rad_T;

/* Constant parameters (auto storage) */
extern const ConstP_Rad_T Rad_ConstP;

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
 * hilite_system('ESP_ESM/Rad')    - opens subsystem ESP_ESM/Rad
 * hilite_system('ESP_ESM/Rad/Kp') - opens and selects block Kp
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'ESP_ESM'
 * '<S1>'   : 'ESP_ESM/Rad'
 * '<S2>'   : 'ESP_ESM/Rad/Drallsatz der Räder'
 * '<S3>'   : 'ESP_ESM/Rad/Geschwindigkeiten der Räder im Radbefestigungspunkt'
 * '<S4>'   : 'ESP_ESM/Rad/Pacejka'
 * '<S5>'   : 'ESP_ESM/Rad/Reifenrückstellmoment1'
 * '<S6>'   : 'ESP_ESM/Rad/Drallsatz der Räder/Compare To Constant'
 * '<S7>'   : 'ESP_ESM/Rad/Drallsatz der Räder/Compare To Constant1'
 * '<S8>'   : 'ESP_ESM/Rad/Geschwindigkeiten der Räder im Radbefestigungspunkt/Berechnung der Radgeschwindigkeiten im Radbefestigungspunkt'
 * '<S9>'   : 'ESP_ESM/Rad/Pacejka/Berechnung Schlupf hinten'
 * '<S10>'  : 'ESP_ESM/Rad/Pacejka/Berechnung Schlupf vorne'
 * '<S11>'  : 'ESP_ESM/Rad/Pacejka/Berechnung der Radkräfte'
 * '<S12>'  : 'ESP_ESM/Rad/Pacejka/Stand-Still Scaling'
 * '<S13>'  : 'ESP_ESM/Rad/Reifenrückstellmoment1/Reifennachlauf durch Latschverformung'
 */
#endif                                 /* RTW_HEADER_Rad_sf_h_ */
