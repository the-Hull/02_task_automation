# push results back into repo

# set up repo and add remote
repo <- git2r::repository(".")
repo
# repo_url <- "https://github.com/the-hull/02_task_automation.git"
#
# git2r::remote_add(repo, name = "dummy", url = repo_url)
#
#
#
# git2r::config(repo,
#               user.email = "aghu@aghu.com",
#               user.name = "Hurliver")
#
#
# travis_build <- Sys.getenv("TRAVIS_BUILD_NUMBER")
# commit_message <- paste("Update data and trigger archive: Travis Build",
#                         travis_build)
# cred <- Sys.getenv("GITHUB_TOKEN")
#
#
#
#
# git2r::push(repo,
#             name = "deploy",
#             refspec = "refs/heads/master",
#             credentials = cred)

