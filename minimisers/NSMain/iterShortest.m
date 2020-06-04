function pars = iterShortest(chain,numberOfParams,values)


%Now try to work out the shortest 95% confidence interval..
numPars =numberOfParams; %((Lazy and bad...))
for par = 1:numPars;
    
    sR = chain(:,par);
    
    options = optimset('MaxIter',1e10,'TolFun',1e-5,'TolX',1e-5,'MaxFunEvals',1e4,'MaxIter',200,'Display','Iter');
    
    minVal_low = min(sR);
    maxVal_low = mean(sR);
    stVal_low = minVal_low;%(maxVal_low - minVal_low)/2 + minVal_low;
    
    minVal_hi = mean(sR);
    maxVal_hi = max(sR);
    stVal_hi = maxVal_hi;%(maxVal_hi - minVal_hi)/2 + minVal_hi;
    
    params.args = [];
    params.LB = [minVal_low minVal_hi];
    params.UB = [maxVal_low maxVal_hi];
    params.data = sort(sR);
    
    x0 = [stVal_low stVal_hi];
    x0u = x0;
    for i = 1:2
        x0u(i) = 2*(x0(i) - params.LB(i))/(params.UB(i)-params.LB(i)) - 1;
        x0u(i) = asin(max(-1,min(1,x0u(i))));
    end
    
    [xu,fval,exitflag,output] = fminsearch(@intrafun,x0u,options,params);
    
    
    answer = xtransform(xu,params);
    
    vals{par} = sprintf(' %0.5g (%0.5g, %0.5g)',values(par,1),answer(1),answer(2));
    means(par) = mean(sR);
    low_ranges(par) = answer(1);
    hi_ranges(par) = answer(2);
end

disp(vals');
pars.LB = low_ranges;
pars.UB = hi_ranges;

end





function xtrans = xtransform(x,params);
% converts unconstrained variables into their original domains

xtrans = x;
for i = 1:length(x)
      xtrans(i) = (sin(x(i))+1)/2;
      xtrans(i) = xtrans(i)*(params.UB(i) - params.LB(i)) + params.LB(i);
end

end


function val = intrafun(x,params)

% transform
xtrans = xtransform(x,params);

lowPoint = xtrans(1);
hiPoint = xtrans(2);
set = params.data;

minIndex = find(set <= lowPoint);
minIndex = minIndex(end);

maxIndex = find(set >= hiPoint);
maxIndex = maxIndex(1);

subset = set(minIndex:maxIndex);

proportion = sqrt((length(subset)-(0.95*length(set)))^2);

distance = hiPoint-lowPoint;

%Normalise proportion and distance.
maxDistance = max(set) - min(set);
distance = distance / maxDistance;

proportion = proportion / (0.95*length(set));

val = proportion + distance;

% figure(50); clf; hist(set,30); hold on;
% x = [lowPoint hiPoint];
% y = [0.1 0.1];
% plot(x,y,'ro');
% drawnow
% hold off




end
