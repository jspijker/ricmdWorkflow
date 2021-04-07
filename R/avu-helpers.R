# setGitAvu <- function(){
# 
#     gitinfo <-list(
#                 root=git2r::workdir(),
#                 repo=basename(git2r::workdir()),
#                 status=git2r::status(),
#                 modified=ifelse(length(git2r::status()$unstaged)>0,TRUE,FALSE),
#                 sha=git2r::sha(git2r::last_commit()),
#                 branch=git2r::repository_head(git2r::repository())$name,
#                 remote=git2r::remote_url()[1]
#                 ) 
#     l <- list()
#     l <- ricmd:::avuAddLst(l,attribute="repo",value=gitinfo$repo)
#     l <- ricmd:::avuAddLst(l,attribute="gitmodified",value=gitinfo$modified)
#     l <- ricmd:::avuAddLst(l,attribute="sha",value=gitinfo$sha)
#     l <- ricmd:::avuAddLst(l,attribute="remote",value=gitinfo$remote)
#     l <- ricmd:::avuAddLst(l,attribute="branch",value=gitinfo$branch)
# 
# 
#     assign("gitavu",l,env=.ricmdWorkflow)
#     invisible(l)
# 
# }
# 

setWorkflowAvu <- function() {
    
    l <- get("projectavu",env=.ricmdWorkflow)
    git <- getGitMeta()

    l <- ricmd:::avuAddLst(l,attribute="repo",value=git$repo)
    l <- ricmd:::avuAddLst(l,attribute="gitModified",value=as.character(git$modified))
    l <- ricmd:::avuAddLst(l,attribute="sha",value=git$sha)
    l <- ricmd:::avuAddLst(l,attribute="remote",value=git$remote)
    l <- ricmd:::avuAddLst(l,attribute="branch",value=git$branch)

    l <- ricmd:::avuAddLst(l,attribute="remotefile",
                           value=file.path(l$avu[[l$key$remote]]$value,
                           l$avu[[l$key$workdir]]$value,
                           l$avu[[l$key$script]]$value))
    l <- ricmd:::avuAddLst(l,attribute="scriptid",
                           value=digest::sha1(l$avu[[l$key$remotefile]]$value))



    assign("workflowavu",l,env=.ricmdWorkflow)
}

setProjectAvu <- function(script,workdir,thisfile) {

    projectAvu <- list()
    projectAvu <- ricmd:::avuAddLst(projectAvu,attribute="script",value=script)
    projectAvu <- ricmd:::avuAddLst(projectAvu,attribute="workdir",value=workdir)
    projectAvu <- ricmd:::avuAddLst(projectAvu,attribute="user",value=Sys.info()[["user"]])
    projectAvu <- ricmd:::avuAddLst(projectAvu,attribute="thisfile",value=thisfile)
    assign("projectavu",projectAvu,env=.ricmdWorkflow)
 
}


