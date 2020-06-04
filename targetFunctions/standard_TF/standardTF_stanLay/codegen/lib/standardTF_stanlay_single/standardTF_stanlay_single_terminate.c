/*
 * Non-Degree Granting Education License -- for use at non-degree
 * granting, nonprofit, educational organizations only. Not for
 * government, commercial, or other organizational use.
 *
 * standardTF_stanlay_single_terminate.c
 *
 * Code generation for function 'standardTF_stanlay_single_terminate'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "standardTF_stanlay_single.h"
#include "standardTF_stanlay_single_terminate.h"
#include "standardTF_stanlay_single_data.h"

/* Function Definitions */
void standardTF_stanlay_single_terminate(void)
{
  omp_destroy_nest_lock(&emlrtNestLockGlobal);
}

/* End of code generation (standardTF_stanlay_single_terminate.c) */
