# ricmd helper functions

isPkgLoaded <- function(pkg) {
    pkgs <- .packages()
    res <- any(pkgs==pkg)
    return(res)
}

