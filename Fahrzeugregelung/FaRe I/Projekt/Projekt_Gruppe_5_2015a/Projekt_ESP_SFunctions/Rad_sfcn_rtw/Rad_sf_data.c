/*
 * Rad_sf_data.c
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

#include "Rad_sf.h"
#include "Rad_sf_private.h"

/* Constant parameters (auto storage) */
const ConstP_Rad_T Rad_ConstP = {
  /* Pooled Parameter (Expression: [0,0.0001, 0.001, 0.01, 0.1, 1, 10 ])
   * Referenced by:
   *   '<S12>/Lookup Table1'
   *   '<S12>/Lookup Table4'
   */
  { 0.0, 0.0001, 0.001, 0.01, 0.1, 1.0, 10.0 },

  /* Pooled Parameter (Expression: ([1e-6, 0.2e-5, 0.25e-4, 0.1e-3, 0.1e-2, 1e-1, 1]))
   * Referenced by:
   *   '<S12>/Lookup Table1'
   *   '<S12>/Lookup Table4'
   */
  { 1.0E-6, 2.0E-6, 2.5E-5, 0.0001, 0.001, 0.1, 1.0 }
};
