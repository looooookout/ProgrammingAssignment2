## Put comments here that give an overall description of what your
## functions do

## This function is about set up enviroments for the CacheSolve function 
## to check cache or getting value 

makeCacheMatrix <- function(x = matrix()) {
    solvematrix <<- NULL        
    set <- function (y)
    {
        x <<- y
        solvematrix <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) solvematrix <<- solve
    getsolve <- function() solvematrix
    list(get = get, setsolve = setsolve, getsolve = getsolve)
}


## This function is about check if the result was already exited 
## If did not, than calculate the result and store it into solvematrix

cacheSolve <- function(x, ...) {

    solvematrix <- x$getsolve()
    if(!is.null(solvematrix))   
    {                           
        print("Cache hit!")
        return(solvematrix)
    }else
    {
        input <- x$get()
        solvematrix <- solve(input)
        x$setsolve(solvematrix)
        solvematrix
    }
}
