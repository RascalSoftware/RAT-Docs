/*
 * Non-Degree Granting Education License -- for use at non-degree
 * granting, nonprofit, educational organizations only. Not for
 * government, commercial, or other organizational use.
 *
 * mpower.h
 *
 * Code generation for function 'mpower'
 *
 */

#ifndef MPOWER_H
#define MPOWER_H

/* Include files */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mwmathutil.h"
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include "rtwtypes.h"
#include "omp.h"
#include "standardTF_custlay_parallel_types.h"

/* Function Declarations */
extern real_T mpower(real_T a);

#ifdef __WATCOMC__

#pragma aux mpower value [8087];

#endif
#endif

/* End of code generation (mpower.h) */
