/*
 * Non-Degree Granting Education License -- for use at non-degree
 * granting, nonprofit, educational organizations only. Not for
 * government, commercial, or other organizational use.
 *
 * mean.h
 *
 * Code generation for function 'mean'
 *
 */

#ifndef MEAN_H
#define MEAN_H

/* Include files */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mwmathutil.h"
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include "covrt.h"
#include "rtwtypes.h"
#include "reflectivity_calculation_types.h"

/* Function Declarations */
extern real_T mean(const emlrtStack *sp, const emxArray_real_T *x);

#ifdef __WATCOMC__

#pragma aux mean value [8087];

#endif
#endif

/* End of code generation (mean.h) */
