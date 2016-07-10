## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        invs<-NULL
        set<-function(y){
                x<<-y #assign value y to x whose environment is differernt from current enviornment
                invs<<-NULL
        }
get<-function()x
setinvs<-function(inverse) invs<-solve
getinvs<-function() invs
list (set=set, get=get, setinvs=setinvs, getinvs=getinvs)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        invs<-x$getinvs() # is it already calculated? 
        if(!is.null(invs)){
                message("getting cached data")
                return(invs) #if it has been calculated already, the computation could be skipped 
        }
        mat.data<-x$get() #calculate the inverse 
        invs=solve(mat.data,...)
        x$setinvs(invs)
        return(invs)
}
