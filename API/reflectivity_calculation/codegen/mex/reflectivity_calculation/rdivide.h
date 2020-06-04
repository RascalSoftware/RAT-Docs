/*
 * Non-Degree Granting Education License -- for use at non-degree
 * granting, nonprofit, educational organizations only. Not for
 * government, commercial, or other organizational use.
 *
 * rdivide.h
 *
 * Code generation for function 'rdivide'
 *
 */

#ifndef RDIVIDE_H
#define RDIVIDE_H

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
extern void rdivide(const emlrtStack *sp, const emxArray_real_T *x, real_T y,
                    emxArray_real_T *z);

#endif

/* End of code generation (rdivide.h) */
