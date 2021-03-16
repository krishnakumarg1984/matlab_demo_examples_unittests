function angles = rightTri(sides)

A = atand(sides(1)/sides(2));
B = atand(sides(2)/sides(1));
hypotenuse = sides(1)/sin(A);
C = asind(hypotenuse*sin(A)/sides(1));

angles = [A B C];

end
