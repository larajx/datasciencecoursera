## Put comments here that give an overall description of what your
## functions do

## This function creates a special "matrix" object that 
## can cache its inverse.

# This function creates a special “matrix” object that can cache its inverse.  Use makeVector, but convert the calculation from mean to inverse.

makeCacheMatrix <- function(m = matrix()) {
        o <- NULL
        set <- function(y){
                m <<- y
                o <<- NULL
        }
        get <- function()m
        setInverse <- function(inverse) o <<- inverse
        getInverse <- function() o 
        list(set = set, get = get, 
             setInverse = setInverse, 
             getInverse = getInverse)
}



##  This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already 
## been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(m, ...) {
        o <- m$getInverse()
        if(!is.null(o)){
                message("getting cached data")
                return(o)
        }
        the_matrix <- m$get()
        o <- solve(the_matrix,...)
        m$setInverse(o)
        o
}

my_tempdir <- tempdir()
afedR::afedR_get_book_files(path_to_copy = my_tempdir)



                            