#' Initialises the workflow
#'
#' Each workflow must be intialised before it can be used. This
#' function performs some checks and sets the project meta data
#'
#' @param script name of current script
#' @param workdir name of working directory which contains script
#'
#' @return nothing
#'
#' This functions performs checks to assure that the packages git2r,
#' ricmd, and data file are loaded. It also checks if the script
#' exists and is part of a git repository. If any of the checks fails,
#' the function returns an error.
#'
#' After the checks this function creates the project meta data. This
#' meta data is used when storing data objects into iRODS.
#'
#'
#'
#' @export

ri_workflowInit <- function(script,workdir=getwd()) {

    if (!isPkgLoaded("git2r")) {
        stop("Package git2r is not loaded, please load it first")
    }

    if (!isPkgLoaded("ricmd")) {
        stop("Package ricmd is not loaded, please load it first")
    }

    if (!isPkgLoaded("datafile")) {
        stop("Package datafile is not loaded, please load it first")
    }

    if(!is.character(script)) {
        stop("ri_workflowInit: scripts is not character")
    }

    if(!is.character(workdir)) {
        stop("ri_workflowInit: workdir is not character")
    }

    thisfile <- file.path(workdir,script)
    if(!file.exists(thisfile)) {
        stop(paste("file",thisfile, "not found"))
    }
    
    if(!ricmd:::testSession()) {
        stop("no ricmd session found, did you start a session?")
    }


    setProjectAvu(script,workdir,thisfile)
    setWorkflowAvu()
   
    

}
