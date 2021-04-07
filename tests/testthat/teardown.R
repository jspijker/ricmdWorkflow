cat("running teardown ...")

irods <- import("irods.session")
env <- path.expand('~/.irods/irods_environment.json')
session <- irods$iRODSSession(irods_env_file=env)
session$collections$remove(testColl)
rm(session)

# unlink test repository, we define it again, just in case this
# variable was changed during tests.
testRepodir <- file.path(tempdir(),'repo')
unlink(testRepodir,recursive=TRUE)
# 
cat("Done!\n")
