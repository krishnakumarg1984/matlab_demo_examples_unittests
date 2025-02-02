function tests = axesPropertiesTest  % this is the main function
    tests = functiontests(localfunctions);
end

function f = createFigure
    f = figure;
    ax = axes('Parent', f);
    cylinder(ax,10)
    h = findobj(ax,'Type','surface');
    h.FaceColor = [1 0 0];
end

function setupOnce(testCase)
    % create and change to temporary folder
    testCase.TestData.origPath = pwd;
    testCase.TestData.tmpFolder = ['tmpFolder' datestr(now,30)];
    mkdir(testCase.TestData.tmpFolder)
    cd(testCase.TestData.tmpFolder)

    % create and save a figure
    testCase.TestData.figName = 'tmpFig.fig';
    aFig = createFigure;
    saveas(aFig,testCase.TestData.figName,'fig')
    close(aFig)
end

function teardownOnce(testCase)
    delete(testCase.TestData.figName)
    cd(testCase.TestData.origPath)
    rmdir(testCase.TestData.tmpFolder)
end

function setup(testCase)
    testCase.TestData.Figure = openfig(testCase.TestData.figName);
    testCase.TestData.Axes = findobj(testCase.TestData.Figure,...
        'Type','Axes');
end

function teardown(testCase)
    close(testCase.TestData.Figure)
end


function testDefaultXLim(testCase)
    xlim = testCase.TestData.Axes.XLim;
    verifyLessThanOrEqual(testCase, xlim(1), -10,...
        'Minimum x-limit was not small enough')
    verifyGreaterThanOrEqual(testCase, xlim(2), 10,...
        'Maximum x-limit was not big enough')
end


function surfaceColorTest(testCase)
    h = findobj(testCase.TestData.Axes,'Type','surface');
    co = h.FaceColor;
    verifyEqual(testCase, co, [1 0 0],'FaceColor is incorrect')
end
