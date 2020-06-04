/*
 * Non-Degree Granting Education License -- for use at non-degree
 * granting, nonprofit, educational organizations only. Not for
 * government, commercial, or other organizational use.
 *
 * standardTF_custlay_single_initialize.c
 *
 * Code generation for function 'standardTF_custlay_single_initialize'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "standardTF_custlay_single.h"
#include "standardTF_custlay_single_initialize.h"
#include "standardTF_custlay_single_data.h"

/* Function Definitions */
void standardTF_custlay_single_initialize(void)
{
  rt_InitInfAndNaN(8U);
  omp_init_nest_lock(&emlrtNestLockGlobal);
}

/* End of code generation (standardTF_custlay_single_initialize.c) */
