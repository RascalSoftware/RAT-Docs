//
//  Non-Degree Granting Education License -- for use at non-degree
//  granting, nonprofit, educational organizations only. Not for
//  government, commercial, or other organizational use.
//
//  standardTF_layers_core.cpp
//
//  Code generation for function 'standardTF_layers_core'
//


// Include files
#include "standardTF_layers_core.h"
#include "callReflectivity.h"
#include "chiSquared.h"
#include "groupLayers_Mod.h"
#include "makeSLDProfileXY.h"
#include "mwmathutil.h"
#include "reflectivity_calculation.h"
#include "reflectivity_calculation_data.h"
#include "reflectivity_calculation_mexutil.h"
#include "resampleLayers.h"
#include "rt_nonfinite.h"
#include "shiftdata.h"
#include "standardTF_custlay_single.h"
#include "sum.h"

// Function Definitions
void b_standardTF_layers_core(const emlrtStack *sp, const coder::array<real_T,
  2U> &contrastLayers, real_T rough, const coder::array<char_T, 2U> &geometry,
  real_T nba, real_T nbs, real_T resample, real_T calcSld, real_T sf, real_T
  qshift, real_T dataPresent, const coder::array<real_T, 2U> &data, const real_T
  dataLimits[2], const real_T simLimits[2], const real_T repeatLayers[2], real_T
  background, real_T resol, real_T backsType, real_T params, coder::array<real_T,
  2U> &sldProfile, coder::array<real_T, 2U> &reflect, coder::array<real_T, 2U>
  &Simul, coder::array<real_T, 2U> &shifted_dat, coder::array<real_T, 2U>
  &layerSld, real_T *chiSq, real_T *ssubs)
{
  coder::array<real_T, 2U> b_sldProfile;
  int32_T loop_ub;
  int32_T i;
  coder::array<real_T, 1U> b_shifted_dat;
  emlrtStack st;
  emlrtStack b_st;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  emlrtHeapReferenceStackEnterFcnR2012b(sp);

  //  function [sldProfile,reflect,Simul,shifted_dat,layerSld,chiSquared,ssubs] = ... 
  //      standardTF_stanlay_core(contrastLayers, rough, ...
  //      geometry, nba, nbs, resample, calcSld, sf, qshift,...
  //      dataPresent, data, dataLimits, simLimits, repeatLayers,...
  //      background,resol,backsType,params,paralellPoints)
  //
  //    This is the main reflectivity calculation for Layers models in the
  //    standard target function. The function first arranges the
  //    roughness' in the correct order according
  //    to geometry. Then, if required it calculates the SLD profile and if
  //    requested resamples this into a number of zero-roughness layers
  //    (roughness resampling). It the applies any scalefactors and qz shifts
  //    the data requires. This is done before calculating the reflectivity to
  //    ensure that the reflectivity is calculated over the same range in qz as
  //    the shifted datapoints. The main reflectivity calculation is then
  //    called, including the resolution function. The calculation outputs two
  //    profiles - 'reflect' which is the same range as the points, and
  //    'Simulation' which can be a different range to allow extrapolation.
  //    The background correction is the applied, and finally chi-squared is
  //    calculated.
  //
  //  Inputs:
  //    contrastLayers  :
  //    rough           :
  //    geometry        :
  //    nba             :
  //    nbs             :
  //    resample        :
  //    calcSld         :
  //    sf              :
  //    qshift          :
  //    dataPresent     :
  //    data            :
  //    dataLimits      :
  //    simLimits       :
  //    repeatLayers    :
  //    background      :
  //    resol           :
  //    backsType       :
  //    params          :
  //    paralellPoints  :
  //
  //  Outputs:
  //
  //
  //
  //  ------------------------------------------------------------------------
  //
  //        (c) Arwel Hughes  -   12/1/21
  //
  //        Last Modified: 12/1/21 by Arwel Hughes.
  //
  //  ------------------------------------------------------------------------
  //  Bulid up the layers matrix for this contrast
  st.site = &m_emlrtRSI;
  groupLayers_Mod(&st, contrastLayers, rough, geometry, nba, nbs, layerSld,
                  ssubs);

  //  Make the SLD profiles.
  //  If resampling is needed, then enforce the calcSLD flag, so as to catch
  //  the error af trying to resample a non-existent profile.
  if ((resample == 1.0) && (calcSld == 0.0)) {
    calcSld = 1.0;
  }

  //  If cal SLD flag is set, then calculate the SLD profile
  if (calcSld == 1.0) {
    real_T b_repeatLayers;
    st.site = &n_emlrtRSI;
    if (repeatLayers[0] == 0.0) {
      b_repeatLayers = 1.0;
    } else {
      b_repeatLayers = repeatLayers[1];
    }

    b_st.site = &hb_emlrtRSI;
    makeSLDProfileXY(&b_st, nba, nbs, *ssubs, layerSld, static_cast<real_T>
                     (layerSld.size(0)), b_repeatLayers, b_sldProfile);
    sldProfile.set_size((&sg_emlrtRTEI), sp, b_sldProfile.size(0), 2);
    loop_ub = b_sldProfile.size(0) * b_sldProfile.size(1);
    for (i = 0; i < loop_ub; i++) {
      sldProfile[i] = b_sldProfile[i];
    }
  } else {
    sldProfile.set_size((&rg_emlrtRTEI), sp, 1, 3);
    sldProfile[0] = 0.0;
    sldProfile[1] = 0.0;
    sldProfile[2] = 0.0;
  }

  //  If required, then resample the SLD
  if (resample == 1.0) {
    st.site = &o_emlrtRSI;
    resampleLayers(&st, sldProfile, layerSld);
  }

  //  Apply scale factors and q shifts to the data
  shifted_dat.set_size((&tg_emlrtRTEI), sp, data.size(0), data.size(1));
  loop_ub = data.size(0) * data.size(1);
  for (i = 0; i < loop_ub; i++) {
    shifted_dat[i] = data[i];
  }

  st.site = &p_emlrtRSI;
  shiftdata(&st, sf, qshift, dataPresent, shifted_dat, dataLimits);

  //  Calculate the reflectivity
  st.site = &q_emlrtRSI;
  b_callReflectivity(&st, nba, nbs, simLimits, repeatLayers, shifted_dat,
                     layerSld, *ssubs, resol, reflect, Simul);

  //  Apply background correction, either to the simulation or the data
  st.site = &r_emlrtRSI;
  if (backsType != static_cast<int32_T>(muDoubleScalarFloor(backsType))) {
    emlrtIntegerCheckR2012b(backsType, &rb_emlrtDCI, &st);
  }

  switch (static_cast<int32_T>(backsType)) {
   case 1:
    // Add background to the simulation
    loop_ub = reflect.size(0) * reflect.size(1);
    reflect.set_size((&ug_emlrtRTEI), (&st), reflect.size(0), 2);
    for (i = 0; i < loop_ub; i++) {
      reflect[i] = reflect[i] + background;
    }

    loop_ub = Simul.size(0) * Simul.size(1);
    Simul.set_size((&vg_emlrtRTEI), (&st), Simul.size(0), 2);
    for (i = 0; i < loop_ub; i++) {
      Simul[i] = Simul[i] + background;
    }
    break;

   case 2:
    //          %Subtract the background from the data..
    if (2 > shifted_dat.size(1)) {
      emlrtDynamicBoundsCheckR2012b(2, 1, shifted_dat.size(1), &re_emlrtBCI, &st);
    }

    if (2 > shifted_dat.size(1)) {
      emlrtDynamicBoundsCheckR2012b(2, 1, shifted_dat.size(1), &qe_emlrtBCI, &st);
    }

    emlrtSubAssignSizeCheckR2012b(shifted_dat.size(), 1, shifted_dat.size(), 1,
      &emlrtECI, &st);
    loop_ub = shifted_dat.size(0) - 1;
    b_shifted_dat.set_size((&wg_emlrtRTEI), (&st), shifted_dat.size(0));
    for (i = 0; i <= loop_ub; i++) {
      b_shifted_dat[i] = shifted_dat[i + shifted_dat.size(0)] - background;
    }

    loop_ub = b_shifted_dat.size(0);
    for (i = 0; i < loop_ub; i++) {
      shifted_dat[i + shifted_dat.size(0)] = b_shifted_dat[i];
    }

    // shifted_dat(:,3) = shifted_dat(:,3) - backg;
    break;
  }

  //  Calculate chi squared.
  st.site = &s_emlrtRSI;
  *chiSq = chiSquared(&st, shifted_dat, reflect, params);
  emlrtHeapReferenceStackLeaveFcnR2012b(sp);
}

void standardTF_layers_core(const emlrtStack *sp, const coder::array<real_T, 2U>
  &contrastLayers, real_T rough, const coder::array<char_T, 2U> &geometry,
  real_T nba, real_T nbs, real_T resample, real_T calcSld, real_T sf, real_T
  qshift, real_T dataPresent, const coder::array<real_T, 2U> &data, const real_T
  dataLimits[2], const real_T simLimits[2], const real_T repeatLayers[2], real_T
  background, real_T resol, real_T backsType, real_T params, coder::array<real_T,
  2U> &sldProfile, coder::array<real_T, 2U> &reflect, coder::array<real_T, 2U>
  &Simul, coder::array<real_T, 2U> &shifted_dat, coder::array<real_T, 2U>
  &layerSld, real_T *chiSq, real_T *ssubs)
{
  coder::array<real_T, 2U> b_sldProfile;
  int32_T loop_ub;
  int32_T i;
  coder::array<real_T, 1U> b_shifted_dat;
  emlrtStack st;
  emlrtStack b_st;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  emlrtHeapReferenceStackEnterFcnR2012b(sp);

  //  function [sldProfile,reflect,Simul,shifted_dat,layerSld,chiSquared,ssubs] = ... 
  //      standardTF_stanlay_core(contrastLayers, rough, ...
  //      geometry, nba, nbs, resample, calcSld, sf, qshift,...
  //      dataPresent, data, dataLimits, simLimits, repeatLayers,...
  //      background,resol,backsType,params,paralellPoints)
  //
  //    This is the main reflectivity calculation for Layers models in the
  //    standard target function. The function first arranges the
  //    roughness' in the correct order according
  //    to geometry. Then, if required it calculates the SLD profile and if
  //    requested resamples this into a number of zero-roughness layers
  //    (roughness resampling). It the applies any scalefactors and qz shifts
  //    the data requires. This is done before calculating the reflectivity to
  //    ensure that the reflectivity is calculated over the same range in qz as
  //    the shifted datapoints. The main reflectivity calculation is then
  //    called, including the resolution function. The calculation outputs two
  //    profiles - 'reflect' which is the same range as the points, and
  //    'Simulation' which can be a different range to allow extrapolation.
  //    The background correction is the applied, and finally chi-squared is
  //    calculated.
  //
  //  Inputs:
  //    contrastLayers  :
  //    rough           :
  //    geometry        :
  //    nba             :
  //    nbs             :
  //    resample        :
  //    calcSld         :
  //    sf              :
  //    qshift          :
  //    dataPresent     :
  //    data            :
  //    dataLimits      :
  //    simLimits       :
  //    repeatLayers    :
  //    background      :
  //    resol           :
  //    backsType       :
  //    params          :
  //    paralellPoints  :
  //
  //  Outputs:
  //
  //
  //
  //  ------------------------------------------------------------------------
  //
  //        (c) Arwel Hughes  -   12/1/21
  //
  //        Last Modified: 12/1/21 by Arwel Hughes.
  //
  //  ------------------------------------------------------------------------
  //  Bulid up the layers matrix for this contrast
  st.site = &m_emlrtRSI;
  groupLayers_Mod(&st, contrastLayers, rough, geometry, nba, nbs, layerSld,
                  ssubs);

  //  Make the SLD profiles.
  //  If resampling is needed, then enforce the calcSLD flag, so as to catch
  //  the error af trying to resample a non-existent profile.
  if ((resample == 1.0) && (calcSld == 0.0)) {
    calcSld = 1.0;
  }

  //  If cal SLD flag is set, then calculate the SLD profile
  if (calcSld == 1.0) {
    real_T b_repeatLayers;
    st.site = &n_emlrtRSI;
    if (repeatLayers[0] == 0.0) {
      b_repeatLayers = 1.0;
    } else {
      b_repeatLayers = repeatLayers[1];
    }

    b_st.site = &hb_emlrtRSI;
    makeSLDProfileXY(&b_st, nba, nbs, *ssubs, layerSld, static_cast<real_T>
                     (layerSld.size(0)), b_repeatLayers, b_sldProfile);
    sldProfile.set_size((&sg_emlrtRTEI), sp, b_sldProfile.size(0), 2);
    loop_ub = b_sldProfile.size(0) * b_sldProfile.size(1);
    for (i = 0; i < loop_ub; i++) {
      sldProfile[i] = b_sldProfile[i];
    }
  } else {
    sldProfile.set_size((&rg_emlrtRTEI), sp, 1, 3);
    sldProfile[0] = 0.0;
    sldProfile[1] = 0.0;
    sldProfile[2] = 0.0;
  }

  //  If required, then resample the SLD
  if (resample == 1.0) {
    st.site = &o_emlrtRSI;
    resampleLayers(&st, sldProfile, layerSld);
  }

  //  Apply scale factors and q shifts to the data
  shifted_dat.set_size((&tg_emlrtRTEI), sp, data.size(0), data.size(1));
  loop_ub = data.size(0) * data.size(1);
  for (i = 0; i < loop_ub; i++) {
    shifted_dat[i] = data[i];
  }

  st.site = &p_emlrtRSI;
  shiftdata(&st, sf, qshift, dataPresent, shifted_dat, dataLimits);

  //  Calculate the reflectivity
  st.site = &q_emlrtRSI;
  callReflectivity(&st, nba, nbs, simLimits, repeatLayers, shifted_dat, layerSld,
                   *ssubs, resol, reflect, Simul);

  //  Apply background correction, either to the simulation or the data
  st.site = &r_emlrtRSI;
  if (backsType != static_cast<int32_T>(muDoubleScalarFloor(backsType))) {
    emlrtIntegerCheckR2012b(backsType, &rb_emlrtDCI, &st);
  }

  switch (static_cast<int32_T>(backsType)) {
   case 1:
    // Add background to the simulation
    loop_ub = reflect.size(0) * reflect.size(1);
    reflect.set_size((&ug_emlrtRTEI), (&st), reflect.size(0), 2);
    for (i = 0; i < loop_ub; i++) {
      reflect[i] = reflect[i] + background;
    }

    loop_ub = Simul.size(0) * Simul.size(1);
    Simul.set_size((&vg_emlrtRTEI), (&st), Simul.size(0), 2);
    for (i = 0; i < loop_ub; i++) {
      Simul[i] = Simul[i] + background;
    }
    break;

   case 2:
    //          %Subtract the background from the data..
    if (2 > shifted_dat.size(1)) {
      emlrtDynamicBoundsCheckR2012b(2, 1, shifted_dat.size(1), &re_emlrtBCI, &st);
    }

    if (2 > shifted_dat.size(1)) {
      emlrtDynamicBoundsCheckR2012b(2, 1, shifted_dat.size(1), &qe_emlrtBCI, &st);
    }

    emlrtSubAssignSizeCheckR2012b(shifted_dat.size(), 1, shifted_dat.size(), 1,
      &emlrtECI, &st);
    loop_ub = shifted_dat.size(0) - 1;
    b_shifted_dat.set_size((&wg_emlrtRTEI), (&st), shifted_dat.size(0));
    for (i = 0; i <= loop_ub; i++) {
      b_shifted_dat[i] = shifted_dat[i + shifted_dat.size(0)] - background;
    }

    loop_ub = b_shifted_dat.size(0);
    for (i = 0; i < loop_ub; i++) {
      shifted_dat[i + shifted_dat.size(0)] = b_shifted_dat[i];
    }

    // shifted_dat(:,3) = shifted_dat(:,3) - backg;
    break;
  }

  //  Calculate chi squared.
  st.site = &s_emlrtRSI;
  *chiSq = chiSquared(&st, shifted_dat, reflect, params);
  emlrtHeapReferenceStackLeaveFcnR2012b(sp);
}

// End of code generation (standardTF_layers_core.cpp)