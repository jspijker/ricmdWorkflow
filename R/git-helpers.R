# Git Helper functions

isValidRepo <- function() {
    # check if 
    # 1) script directory is part of an git repo
    # 2) repo has a remote
}

isDataIgnored <- function() {
    # check if file in datadir() directory is ignored, see git
    # check-ignore

}

getGitMeta <- function() {
    # get git information and transform it into avu tripples

    x <-list(
                root=git2r::workdir(),
                repo=basename(git2r::workdir()),
                status=git2r::status(),
                modified=ifelse(length(git2r::status()$unstaged)>0,TRUE,FALSE),
                sha=git2r::sha(git2r::last_commit()),
                branch=git2r::repository_head(git2r::repository())$name,
                remote=git2r::remote_url()[1]
                ) 
    return(x)
}
