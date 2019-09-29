#naughts and crosses validation through linear algebra

mat_horizontal <- matrix(data=c(1,1,1,0,0,0,0,0,0),nrow=3,ncol=3,byrow=TRUE)
mat_vertical <- matrix(data=c(1,1,1,0,0,0,0,0,0),nrow=3,ncol=3)
mat_cross <- matrix(data=c(1,0,0,0,1,0,0,0,1),nrow=3,ncol=3)
mat_cross_min <- matrix(data=c(0,0,1,0,1,0,1,0,0),nrow=3,ncol=3)

#apply lambda function to each row in matrix
apply(mat_horizontal, FUN=function(x) {
  if (length(union(c(1),x)) == 1 && (x[1][1] != 0))
    return(TRUE)
  return(FALSE)
  },MARGIN=c(0,1))

#transpose the matrix to check for vertical wins
#sometimes, this won't work for wins in column 2 or 3
apply(t(mat_vertical), FUN=function(x) {
  if (length(union(c(1),x)) == 1 && (x[1][1] != 0))
    return(TRUE)
  return(FALSE)
},MARGIN=c(0,1))

#check for both possible diagonal wins
check_diagonal <- function(game_matrix){
  if(length(union(c(1),c(game_matrix[1,1],game_matrix[2,2],game_matrix[3,3]))) == 1){
    return(TRUE)
  }
  if(length(union(c(1),c(game_matrix[3,1],game_matrix[2,2],game_matrix[1,3]))) == 1){
    return(TRUE)
  }
  return(FALSE)
}

check_diagonal(mat_cross)
check_diagonal(mat_cross_min)
