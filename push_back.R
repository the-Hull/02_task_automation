# push results back into repo
# - Rscript push_back.R

# set up repo and add remote
repo <- git2r::repository(".")
# repo
repo_url <- "https://github.com/the-Hull/02_task_automation.git"
#
git2r::remote_add(repo, name = "taskauto", url = repo_url)
#
#
#
git2r::config(repo,
              user.email = "aghu@aghu.com",
              user.name = "travishull")

#
# travis_build <- Sys.getenv("TRAVIS_BUILD_NUMBER")
commit_message <- paste("Update reports: Travis Build")
# cred <- Sys.getenv("GH_TOKEN")
cred <- git2r::cred_token("GH_TOKEN")

#
#
#
#
git2r::checkout(repo, branch = "master")
git2r::add(repo, "*")
git2r::commit(repo, message = commit_message)



git2r::push(repo,
            name = "taskauto",
            refspec = "refs/heads/master",
            credentials = cred)

# Mt St Helens
# Grand Teton Mountain
# El Capitan Yosemite
# git remote add origin-rhydro https://${GH_TOKEN}@github.com/the-Hull/02_task_automation.git
# git push origin-rhydro
