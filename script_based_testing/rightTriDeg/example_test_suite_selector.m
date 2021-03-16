import matlab.unittest.selectors.HasName
import matlab.unittest.constraints.ContainsSubstring
import matlab.unittest.TestSuite.fromFile

f = 'rightTriTolTest.m';
selector = HasName(ContainsSubstring('Triangle'));

% fromFile, name-value pair
% suite1 = TestSuite.fromFile(f,'Name','*Triangle*')
suite1 = fromFile(f,'Name','*Triangle*')

% fromFile, selector
% suite = TestSuite.fromFile(f,selector)
suite2 = fromFile(f,selector)

% selectIf, name-value pair
% fullSuite = TestSuite.fromFile(f);
fullSuite = fromFile(f);
suite3 = selectIf(fullSuite,'Name','*Triangle*')

% selectIf, selector
% fullSuite = TestSuite.fromFile(f);
suite4 = selectIf(fullSuite,selector)
