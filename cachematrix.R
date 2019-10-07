## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL ##set new value for matrix
  set <- function(y) { ##define new function
    x <<- y ##value of vatrix in environment
    m <<- NULL ##return value to null if there is new matrix
  }
  get <- function() x ##define the get function
  setinverse <- function(inverse) m <<- inverse ##assigns value of inv in parent environment
  getinverse <- function() m ##gets the value of inv where called
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse() ##get inverse data for m value
  if(!is.null(m)) { ##if function for m is not null
    message("getting cached data") ##label if there is value in m
    return(m) ##get m value 
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
