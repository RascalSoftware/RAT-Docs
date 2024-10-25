% maybe rename to lipid problem
function generateOutputs
    apiDir = 'API';
    if isfolder(apiDir)
        rmdir(apiDir, 's');
    end
    
    mkdir(apiDir);
    websave(fullfile(apiDir, 'Linux.zip'), 'https://github.com/RascalSoftware/RAT/releases/download/nightly/Linux.zip');
    unzip(fullfile(apiDir, 'Linux.zip'), apiDir);
    cd(apiDir);
    addPaths;
    cd('..')

    
    root = getappdata(0, 'root');
    
    outputDir = 'source/_outputs/matlab';        
    if isfolder(outputDir)
        rmdir(outputDir, 's');
    end
    mkdir(outputDir);
    
    controls = controlsClass();
    writeOutput(evalc('disp(controls)'), 'controlDefaults.txt', outputDir);
   
    controls.procedure = 'simplex';
    writeOutput(evalc('disp(controls)'), 'controlSimplexDefaults.txt', outputDir);

    controls.procedure = 'DE';
    writeOutput(evalc('disp(controls)'), 'controlDEDefaults.txt', outputDir);

    controls.procedure = 'simplex';
    controls.updatePlotFreq = 35;
    writeOutput(evalc('disp(controls)'), 'controlSimplexPlotFreq.txt', outputDir);

%% Tutorial Chapter2 code snippets
    problem = projectClass('my project');
    writeOutput(evalc('disp(problem)'), 'tutorialProblem.txt', outputDir);

    writeOutput(evalc('problem.parameters.displayTable()'), 'tutorialDefaultParameters.txt', outputDir);

    problem.addParameter('My new param', 1, 2, 3);
    problem.addParameter('My other new param',10,20,30,false);
    pGroup = {{'Layer thick', 10, 20, 30, true};
              {'Layer SLD', 1e-6, 3e-6 5e-6, true};
              {'Layer rough', 5, 7, 10, true}};
    problem.addParameterGroup(pGroup);
    writeOutput(evalc('problem.parameters.displayTable()'), 'tutorialMoreParameters.txt', outputDir);

    problem.setParameterName('My new param', 'My changed param');
    problem.setParameterLimits(2,0.96,3.62);
    problem.setParameterValue(4,20.22);
    problem.setParameterFit('Layer rough',false);
    writeOutput(evalc('problem.parameters.displayTable()'), 'tutorialSetParameters.txt', outputDir);

    problem.setParameter(4,'name','thick','min',5,'max',33,'fit',false);
    writeOutput(evalc('problem.parameters.displayTable()'), 'tutorialSetParameters2.txt', outputDir);

    problem.removeParameter(4);
    writeOutput(evalc('problem.parameters.displayTable()'), 'tutorialRemoveParameters.txt', outputDir);
    
    % Hack to generate the exception message not sure if there is a better way 
    exception = [];
    evalc('try, problem.removeParameter(1); catch E, exception = E; end');
    display = getReport(exception);
    display = strsplit(display, {'Error in'});
    writeOutput(display{1}, 'tutorialRemoveProtectedParameters.txt', outputDir, isError=true);


    % Layers Example
    problem = projectClass('Layers Example');
    params = {{'Layer Thickness', 10, 20, 30, false};
            {'H SLD', -6e-6, -4e-6, -1e-6, false};
            {'D SLD', 5e-6, 7e-6, 9e-6, true};
            {'Layer rough', 3, 5, 7, true};
            {'Layer hydr', 0, 10, 20, true}};
    problem.addParameterGroup(params);
    H_layer = {'H Layer','Layer Thickness','H SLD','Layer rough','Layer hydr','bulk out'};
    D_layer = {'D Layer','Layer Thickness','D SLD','Layer rough','Layer hydr','bulk out'};
    problem.addLayerGroup({H_layer, D_layer});
    writeOutput(evalc('problem.layers.displayTable()'), 'tutorialLayers1.txt', outputDir);

    
    Dry_Layer = {'Dry Layer', 'Layer Thickness', 'D SLD', 'Layer rough'};
    problem.addLayer(Dry_Layer);
    writeOutput(evalc('problem.layers.displayTable()'), 'tutorialLayers2.txt', outputDir);

    problem.setLayerValue(1, 2, 3);
    writeOutput(evalc('problem.layers.displayTable()'), 'tutorialSetLayers.txt', outputDir);


    % Bulk Phase
    problem.addBulkIn('Silicon',2.0e-6,2.07e-6,2.1e-6,false);
    problem.addBulkOut('H2O',-0.6e-6,-0.56e-6,-0.5e-6,false);
    writeOutput(evalc('problem.bulkIn.displayTable();problem.bulkOut.displayTable()'), 'tutorialBulkPhase.txt', outputDir);

    % Backgrounds
    writeOutput(evalc('problem.background.displayBackgroundsObject()'), 'tutorialDefaultBackground.txt', outputDir);
    
    problem.addBackgroundParam('My New BackPar',1e-8,1e-7,1e-6,true);
    problem.addBackground('My New Background','constant','My New BackPar');
    writeOutput(evalc('problem.background.displayBackgroundsObject()'), 'tutorialConstantBackground.txt', outputDir);

%     problem.addBackground('Data Background 1','data','My Background Data');
%     writeOutput(evalc('problem.background.displayBackgroundsObject()'), 'tutorialDataBackground.txt', outputDir);

    % Resolutions
    problem.addResolutionParam('My Resolution Param',0.02,0.05,0.08,true);
    writeOutput(evalc('problem.resolution.displayResolutionsObject()'), 'tutorialDefaultResolutions.txt', outputDir);

    problem.addResolution('My new resolution','constant','My Resolution Param');
    problem.addResolution('My Data Resolution','data');
    writeOutput(evalc('problem.resolution.displayResolutionsObject()'), 'tutorialResolutions.txt', outputDir);

    % Data
    writeOutput(evalc('problem.data.displayTable()'), 'tutorialDefaultData.txt', outputDir);
    
    myData = readmatrix(fullfile(root, '/examples/normalReflectivity/customXY/c_PLP0016596.dat'));
    problem.addData('My new datafile', myData);
    writeOutput(evalc('problem.data.displayTable()'), 'tutorialDataBlock.txt', outputDir);

    % Full Example
    problem = projectClass('DSPC monolayers');% Define the parameters:
    Parameters = {
        %       Name                min     val     max      fit?
        {'Tails Thickness',         10,     20,      30,     true};
        {'Heads Thickness',          3,     11,      16,     true};
        {'Tails Roughness',          2,     5,       9,      true};
        {'Heads Roughness',          2,     5,       9,      true};
        {'Deuterated Tails SLD',    4e-6,   6e-6,    2e-5,   true};
        {'Hydrogenated Tails SLD', -0.6e-6, -0.4e-6, 0,      true};
        {'Deuterated Heads SLD',    1e-6,   3e-6,    8e-6,   true};
        {'Hydrogenated Heads SLD',  0.1e-6, 1.4e-6,  3e-6,   true};
        {'Heads Hydration',         0,      0.3,     0.5,    true};
        };

    problem.addParameterGroup(Parameters);H_Heads = {'Hydrogenated Heads',...
        'Heads Thickness',...
        'Hydrogenated Heads SLD',...
        'Heads Roughness',...
        'Heads Hydration',...
        'bulk out' };

    D_Heads = {'Deuterated Heads',...
            'Heads Thickness',...
            'Deuterated Heads SLD',...
            'Heads Roughness',...
            'Heads Hydration',...
            'bulk out' };
    
    D_Tails = {'Deuterated Tails',...
            'Tails Thickness',...
            'Deuterated Tails SLD',...
            'Tails Roughness'};
    
    H_Tails = {'Hydrogenated Tails',...
            'Tails Thickness',...
            'Hydrogenated Tails SLD',...
            'Tails Roughness'};
    
    problem.addLayerGroup({H_Heads; D_Heads; H_Tails; D_Tails});
    problem.setBackgroundParamName(1, 'Backs Value ACMW'); % Use existing backsPar
    problem.setBackgroundParamValue(1, 5.5e-6);
    problem.addBackgroundParam('Backs Value D2O', 1e-8, 2.8e-6, 1e-5);
    problem.addBackground('Background D2O', 'constant', 'Backs Value D2O');
    problem.setBackground(1, 'name', 'Background ACMW', 'value1', 'Backs Value ACMW');
    problem.addBulkOut('SLD ACMW', -1e-6, 0.0, 1e-6, true);
    
    dataPath = '/examples/miscellaneous/convertRasCAL1Project/';
    d13ACM = readmatrix(fullfile(root, dataPath, 'd13acmw20.dat'));
    d70d2O = readmatrix(fullfile(root, dataPath, 'd70d2o20.dat'));
    problem.addData('H-tail / D-head / ACMW', d13ACM);
    problem.addData('D-tail / H-head / D2O', d70d2O);

    problem.addContrast('name', 'D-tail/H-Head/D2O',...
                    'background', 'Background D2O',...
                    'resolution', 'Resolution 1',...
                    'scalefactor', 'Scalefactor 1',...
                    'BulkOut', 'SLD D2O',...
                    'BulkIn', 'SLD Air',...
                    'data', 'D-tail / H-head / D2O');

    problem.addContrast('name', 'H-tail/D-Head/ACMW',...
                        'background', 'Background ACMW',...
                        'resolution', 'Resolution 1',...
                        'scalefactor', 'Scalefactor 1',...
                        'BulkOut', 'SLD ACMW',...
                        'BulkIn', 'SLD Air',...
                        'data', 'H-tail / D-head / ACMW');
    problem.setContrastModel(1, {'Deuterated Tails','Hydrogenated Heads'});
    problem.setContrastModel(2, {'Hydrogenated Tails','Deuterated Heads'});
    problem.setBackgroundParam(1,'fit', true);
    problem.setBackgroundParam(2,'fit', true);
    problem.setScalefactor(1,'fit', true);
    problem.setBulkOut(1,'fit', true);
    writeOutput(evalc('disp(problem)'), 'tutorialFullProblem.txt', outputDir);
    
    controls = controlsClass();
    writeOutput(evalc('RAT(problem,controls);'), 'tutorialFullRun1.txt', outputDir);

    controls.procedure = 'simplex';
    controls.parallel = 'contrasts';
    controls.display = 'final';
    writeOutput(evalc('disp(controls);RAT(problem,controls);'), 'tutorialFullRun2.txt', outputDir);
    
    [~, ~, results] = evalc('RAT(problem, controls);');
    writeOutput(evalc('disp(results)'), 'tutorialFullRunResult.txt', outputDir);

    writeOutput(evalc('problem.parameters.displayTable()'), 'IntroParameters.txt', outputDir);
    writeOutput(evalc('problem.layers.displayTable()'), 'IntroLayers.txt', outputDir);
    writeOutput(evalc('problem.data.displayTable()'), 'IntroData.txt', outputDir);
    writeOutput(evalc('problem.contrasts.displayContrastsObject()'), 'IntroContrasts.txt', outputDir);
%% Advanced code snippets
    
    problem.setContrast(1,'resample',true);
    problem.removeContrast(2);
    writeOutput(evalc('problem.contrasts.displayContrastsObject()'), 'advancedResample.txt', outputDir);

    problem.absorption = true;
    writeOutput(evalc('problem.layers.displayTable()'), 'advancedAbsorption.txt', outputDir);
    
%% Custom Models code snippets
    %[~, problem] = evalc('orsoDSPCCustomLayers()');
    writeOutput(evalc('problem.parameters.displayTable()'), 'customLayersProblem.txt', outputDir);
%     
%     controls = controlsClass();
%     controls.parallel = 'contrasts';
%     writeOutput(evalc('RAT(problem,controls);'), 'customlayersrun.txt', outputDir);
%     
%% Saving project
    myResults = struct('problem', problem, 'results', results, 'controls', controls);
    writeOutput(evalc('myResults'), 'savingProject.txt', outputDir);

%% Domains snippets
    problem = domainsExample();
    writeOutput(evalc('problem.layers.displayTable()'), 'calcTypesDomainsLayers.txt', outputDir);
    writeOutput(evalc('problem.domainContrasts.displayContrastsObject()'), 'calcTypesDomainsDomainConstrasts.txt', outputDir); 
    writeOutput(evalc('problem.domainRatio.displayTable()'), 'calcTypesDomainsDomainRatio.txt', outputDir);    
    writeOutput(evalc('problem.contrasts.displayContrastsObject()'), 'calcTypesDomainsConstrasts.txt', outputDir);

    rmPaths;
end

function problem = domainsExample()
    problem = createProject(calcType="domains");
    
    Parameters = {
        %   Name            min         val         max     fit?
        {'L1 thick',         5,         20,         60,     true   };
        {'L1 SLD',           3e-6,      4.1e-6,    5e-6,    false  };
        {'L1 rough'          2,          5,         20,     true   };
        {'L1 Hydr'           10,        20,         30,     true   };
        {'L2 thick',         5,         60,        100,     true   };
        {'L2 SLD',           2.1e-6,    3e-6,      5e-6,    false  };
        {'L2 rough'          2,          5,         20,     true   };
        {'L2 Hydr'           10,        20,         30,     true   };
        {'L3 thick',         5,         200,       300,     true   };
        {'L3 SLD',           3e-6,      7e-6,      8e-6,    false  };
        {'L3 rough'          2,          5,         20,     true   };
        {'L3 Hydr'           10,        20,         30,     true   };
        };
    
    problem.addParameterGroup(Parameters);
    
    Layer1 = {'Layer 1',...         % Name of the layer
        'L1 thick',...              % Layer thickness
        'L1 SLD',...                % Layer SLD
        'L1 Rough',...              % Layer roughness
        'L1 Hydr',...               % hydration (precent)
        'bulk out' }; 
    
    Layer2 = {'Layer 2',...         % Name of the layer
        'L2 thick',...              % Layer thickness
        'L2 SLD',...                % Layer SLD
        'L2 Rough',...              % Layer roughness
        'L2 Hydr',...               % hydration (precent)
        'bulk out' }; 
    
    Layer3 = {'Layer 3',...         % Name of the layer
        'L3 thick',...              % Layer thickness
        'L3 SLD',...                % Layer SLD
        'L3 Rough',...              % Layer roughness
        'L3 Hydr',...               % hydration (precent)
        'bulk out' };
    
    problem.addLayerGroup({Layer1, Layer2, Layer3});
    
    
    problem.addDomainContrast('Domain1');
    problem.addDomainContrast('Domain2');
    
    
    problem.setDomainContrastModel(1,'Layer 1');
    problem.setDomainContrastModel(2,{'Layer 2','Layer 3'});
    
    
    problem.addContrast('name','Domain Test',...
        'background',   'Background 1',...
        'resolution',   'Resolution 1',...
        'scalefactor',  'Scalefactor 1',...
        'resample',     false,...
        'BulkIn',       'SLD Air',...        
        'BulkOut',      'SLD D2O',...        
        'domainRatio',  'Domain Ratio 1',....
        'data',         'Simulation');
    
    problem.setContrastModel(1,{'Domain1','Domain2'});
end

function writeOutput(output, filename, outputDir, options)
    arguments
        output {mustBeTextScalar}
        filename {mustBeTextScalar}
        outputDir {mustBeTextScalar}
        options.isError {mustBeA(options.isError, 'logical')} = false
    end
    fileID = fopen(fullfile(outputDir, filename), 'w');
    if options.isError
        display = prepErrorHtml(output);
    else
        display = prepOutputHtml(output);
    end
    fprintf(fileID, '%s\n', display);
    fclose(fileID);
end

function text = prepOutputHtml(text)
    text = replace(text, '</a>', '</span>');
    text = regexprep(text, '<a[^>]*>', ...
        '<span style="color:DodgerBlue;font-weight:bold;text-decoration:underline">');
    text = ['<pre>', newline, newline, text, '</pre>'];
end

function text = prepErrorHtml(text)
    text = replace(text, '</a>', '</span>');
    text = regexprep(text, '<a[^>]*>', ...
        '<span style="font-weight:bold;text-decoration:underline">');
    text = ['<pre style="color:Red">', newline, text, '</pre>'];
end

