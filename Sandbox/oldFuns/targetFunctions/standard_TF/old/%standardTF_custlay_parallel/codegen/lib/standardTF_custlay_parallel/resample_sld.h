/*
 * Non-Degree Granting Education License -- for use at non-degree
 * granting, nonprofit, educational organizations only. Not for
 * government, commercial, or other organizational use.
 *
 * resample_sld.h
 *
 * Code generation for function 'resample_sld'
 *
 */

#ifndef RESAMPLE_SLD_H
#define RESAMPLE_SLD_H

/* Include files */
#include <math.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include "rt_nonfinite.h"
#include "rtwtypes.h"
#include "omp.h"
#include "standardTF_custlay_parallel_types.h"

/* Function Declarations */
extern void resample_sld(const emxArray_real_T *sld, emxArray_real_T *x_new_tot,
  emxArray_real_T *y_new_tot);

#endif

/* End of code generation (resample_sld.h) */