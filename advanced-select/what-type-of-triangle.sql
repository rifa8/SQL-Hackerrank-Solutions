-- DB2, MySQL, Oracle, MS SQL Server
select
    case
        when A = B and A = C and B = C then 'Equilateral' 
        when (A = B or A = C or B = C) and (A + B > C and A + C > B and B + C > A) then 'Isosceles'
        when (A != B and A != C and B != C) and (A + B > C and A + C > B and B + C > A) then 'Scalene'
        else 'Not A Triangle'
    end triangle
from triangles;
