function comparePredIntervals(problem,results,controls)


% Check of MCMCpred and Old method of calculating intervals:

% Output of bayes as it stands has bestPars set to the mean of the
% posteriors, and so these are the best fits calculated. Also, the predlims
% are calculated using mcmcstat's native routine.

% In terms of fit and predlims, 95% interval is in row 3 and row 7. The fit
% is in row 5

q4 = true;


pLims = results.predlims.predlims;
shifted_data = results.shifted_data;
reflectivity = results.reflectivity;
numberOfContrasts = length(shifted_data);

% Plot the results of MCMCPred
figure(10); clf; hold on
set(gca,'YScale','log','XScale','log');

for i = 1:numberOfContrasts
    
    thisRef = reflectivity{i};
    thisData = shifted_data{i};
    
    switch q4
        case false
            if i == 1
                mult = 1;
            else
                mult = 2^(4*i);
            end
        otherwise
            mult = 2^(4*i);
            thisQ4 = thisData(:,1).^4;
    end
        
    % Get the limits
    theseLims = pLims{i}{:};
    
    % Get the ranges..
    thisMin = theseLims(2,:)./mult;
    thisMax = theseLims(8,:)./mult;
    thisBest = theseLims(5,:)./mult;
    
    thisDataX = thisData(:,1);
    thisDataY = thisData(:,2)./mult;
    thisDataErr = thisData(:,3)./mult;
    
    switch q4
        case true
            thisMin = thisMin(:) .* thisQ4;
            thisMax = thisMax(:) .* thisQ4;
            thisBest = thisBest(:) .* thisQ4;
            thisDataY = thisDataY(:) .* thisQ4;
            thisDataErr = thisDataErr(:) .* thisQ4;
    end
    
    errorbar(thisDataX,thisDataY,thisDataErr,'.','MarkerSize',2.5);

    %thisMin
    plot(thisData(:,1),thisMin,'r-');
    plot(thisData(:,1),thisMax,'r-');
    plot(thisData(:,1),thisBest,'k-');
    
end
title('MCMCPred');


% Now do the same with the 'manual' calculation 
%[best, intervals, posteriors] = calcMCMCstatRefErrors(bayesResults,outProblemDef,problemDef_cells,problemDef_limits,controls);

% Calculate the bestFit_max values (rather than means)
chain = results.chain;
[bestFitMax,posteriors] = findPosteriorsMax(chain);

% Calculate the best fits with these
% Need to do the processing from RAT first...
[problemDefProc,problemDef_cells,problemDef_limits,priors,cntrl] = RatParseClassToStructs_new(problem,controls);
checks = cntrl.checks;

[problemDefProc,~] = packparams(problemDefProc,problemDef_cells,problemDef_limits,checks);
cntrl.proc = 'calculate';
cntrl.calcSld = 1;
problemDefProc.fitpars = bestFitMax;
problemDefProc = unpackparams(problemDefProc,cntrl);
[outProblem,result] = reflectivity_calculation_wrapper(problemDefProc,problemDef_cells,problemDef_limits,cntrl);
result = parseResultToStruct(outProblem,result);

bestFit = result.reflectivity;
bestSld = result.sldProfiles;
shifted_data = result.shifted_data;

% Now calculate the intervals the 'old' way...
predInt = 0.95; %95% confidence intervals
intervals_95 = confIntervals(chain,bestFitMax,predInt);


% Now Calculate the intervals on reflectivity and SLD
[refShadedIntervals, sldShadedIntervals, outMessage] = refPredInterval_mod(chain,bestFit,bestSld,intervals_95,...
    problemDefProc, problemDef_cells,problemDef_limits,cntrl,result);

% Plot this out:
figure(50);
clf; hold on

for i = 1:numberOfContrasts

    %subplot(1,2,1);
    thisData = shifted_data{i};
    thisRefs = refShadedIntervals{i};
    
    switch q4
        case false
            if i == 1
                mult = 1;
            else
                mult = 2^(4*i);
            end
        otherwise
            mult = 2^(4*i);
            thisQ4 = thisData(:,1).^4;
    end

    thisDataX = thisData(:,1);
    thisDataY = thisData(:,2) ./ mult;
    thisDataErr = thisData(:,3) ./ mult;

    thisRefX = thisRefs(:,1);
    thisRefY = thisRefs(:,2) ./ mult;
    thisRefMin = thisRefs(:,3) ./ mult;
    thisRefMax = thisRefs(:,4) ./ mult;
    
    switch q4
        case true
            thisRefMin = thisRefMin(:) .* thisQ4;
            thisRefMax = thisRefMax(:) .* thisQ4;
            thisRefY = thisRefY(:) .* thisQ4;
            thisDataY = thisDataY(:) .* thisQ4;
            thisDataErr = thisDataErr(:) .* thisQ4;
    end
    
    errorbar(thisDataX,thisDataY,thisDataErr,'.');
    hold on
    
    plot(thisRefX,thisRefY,'k-');
    hold on
    plot(thisRefX,thisRefMin,'r');
    plot(thisRefX,thisRefMax,'r');
    
    
%     subplot(1,2,2);
%     hold on
%     thisSlds = sldShadedIntervals{n};
%     plot(thisSlds(:,1),thisSlds(:,2));
%     plot(thisSlds(:,1),thisSlds(:,2),'r-')
%     plot(thisSlds(:,1),thisSlds(:,3),'r-');
    
end
    
set(gca,'YScale','log','XScale','log');
title('Manual');

figure(60);
mcmcplot(results.chain,[],results.fitNames,'hist');

end







