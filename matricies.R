#A little matrix revision

#determinants give an indication if a system of equations is solvable
#if a determinant is 0, there is no inverse and the equations are not solvable
#else, there probably is a solution
#2 x 2 determinant = ad - bc
#[[a,b],
# [c,d]]

#2 x 2 matrix
mat1 <- matrix(data=c(3,-4,5,7),nrow=2,ncol=2)
mat1 #determinant would be 3*7 - 5*-4 == -41
det(mat1)

#3 x 3 determinant: calculate as below by hand...or use the det function
#a_1*[[b2,c2], - b_1*[[a2,c2], + c_1*[[a2,b2],
#     [b3,c3]]        [a3,c3]]       [a3,b3]]

#3 x 3 matrix
mat2 <- matrix(data=c(2,5,-8,4,7,1,-3,6,9),nrow=3,ncol=3)
mat2
det(mat2) #correct

#solving a system of equations
#x_1 + x_2 + 2x_3 = 2
#2x_1 + x_2 + 3x_3 = 5
#x_1 - 2x_2 + 5x_3 = 11

#Ax = b
A <- matrix(data=c(1,2,1,1,1,-2,2,3,5),nrow=3,ncol=3)
A
b <- matrix(data=c(2,5,11),nrow=3,ncol=1)
b
det(A) #suggests it is solvable
solve(A,b) #argument 1 = coefficients matrix, argument 2 = solution vector
solve(A) #this is the inverse of matrix A
