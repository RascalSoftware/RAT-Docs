/*
 * Non-Degree Granting Education License -- for use at non-degree
 * granting, nonprofit, educational organizations only. Not for
 * government, commercial, or other organizational use.
 *
 * callReflectivity.h
 *
 * Code generation for function 'callReflectivity'
 *
 */

#pragma once

/* Include files */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mex.h"
#include "emlrt.h"
#include "rtwtypes.h"
#include "omp.h"
#include "reflectivity_calculation_types.h"

/* Function Declarations */
void b_callReflectivity(const emlrtStack *sp, real_T nbairs, real_T nbsubs,
  const real_T simLimits[2], const real_T repeatLayers[2], const emxArray_real_T
  *this_data, const emxArray_real_T *layers, real_T ssubs, real_T res,
  emxArray_real_T *reflectivity, emxArray_real_T *Simulation);
void callReflectivity(const emlrtStack *sp, real_T nbairs, real_T nbsubs, const
                      real_T simLimits[2], const real_T repeatLayers[2], const
                      emxArray_real_T *this_data, const emxArray_real_T *layers,
                      real_T ssubs, real_T res, emxArray_real_T *reflectivity,
                      emxArray_real_T *Simulation);

/* End of code generation (callReflectivity.h) */
