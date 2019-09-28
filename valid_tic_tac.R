#naughts and crosses validation through linear algebra
#git push attempt halls
mat_horizontal <- matrix(data=c(1,0,0,1,0,0,1,0,0),nrow=3,ncol=3)
mat_horizontal

mat_vertical <- matrix(data=c(1,1,1,0,0,0,0,0,0),nrow=3,ncol=3)
mat_vertical

mat_cross <- matrix(data=c(1,0,0,0,1,0,0,0,1),nrow=3,ncol=3)
mat_cross

help(sapply)
sapply(mat_horizontal,FUN=function(x) {return(x +1)})

print(check_horizontal(mat_horizontal))
