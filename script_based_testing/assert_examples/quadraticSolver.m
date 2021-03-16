function x = quadraticSolver(C)

    validateattributes(C,{'numeric'},{'size',[1 3]})

    a = C(1);
    b = C(2);
    c = C(3);

    x(1) = (-b+sqrt(b^2-4*a*c))/(2*a);
    x(2) = (-b-sqrt(b^2-4*a*c))/(2*a);
    assert(isnumeric(x),'quadraticSolver:nonnumericRoots',...
        'Computed roots are not numeric')

    y1 = a*x(1)^2+b*x(1)+c;
    y2 = a*x(2)^2+b*x(2)+c;
    assert(y1 == 0,'quadraticSolver:root1Error','Error in first root')
    assert(isequal(y2,0),'quadraticSolver:root2Error','Error in second root')

end
