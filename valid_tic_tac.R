#naughts and crosses validation through linear algebra
#git push attempt halls
#mat_horizontal <- matrix(data=c(1,0,0,1,0,0,1,0,0),nrow=3,ncol=3)
#mat_horizontal

mat_horizontal <- matrix(data=c(1,1,1,0,0,0,0,0,0),nrow=3,ncol=3,byrow=TRUE)
mat_horizontal

mat_vertical <- matrix(data=c(1,1,1,0,0,0,0,0,0),nrow=3,ncol=3)
mat_vertical

mat_cross <- matrix(data=c(1,0,0,0,1,0,0,0,1),nrow=3,ncol=3)
mat_cross

c(mat_horizontal)
c(t(mat_vertical))
c(mat_cross)

#apply lambda function to each row in matrix
apply(mat_horizontal, FUN=function(x) {
  if (length(union(c(1),x)) == 1 && (x[1][1] != 0))
    return(TRUE)
  return(FALSE)
  },MARGIN=c(0,1))

#transpose the matrix to check for vertical wins
apply(t(mat_vertical), FUN=function(x) {
  print(x)
  if (length(union(c(1),x)) == 1 && (x[1][1] != 0))
    return(TRUE)
  return(FALSE)
},MARGIN=c(0,1))

