# set up repo and add remote
repo <- git2r::repository(".")

# repo
repo_url <- "https://github.com/the-Hull/02_task_automation.git"

git2r::remote_add(repo, name = "taskauto", url = repo_url)

git2r::config(repo,
              user.email = "aghu@aghu.com",
              user.name = "travishull")

commit_message <- paste("Update reports: Travis Build")
cred <- git2r::cred_token("GH_TOKEN")


git2r::checkout(repo, branch = "master")

last_commit_author <- git2r::commits(repo = repo)[[1]]$author[[1]]


if (last_commit_author != "travishull"){

    git2r::checkout(repo, branch = "master")
    git2r::add(repo, "*")
    git2r::commit(repo, message = commit_message)




    # - "./.push_results.sh"

    git2r::push(repo,
                name = "taskauto",
                refspec = "refs/heads/master",
                credentials = cred)

    # Mt St Helens
    # Grand Teton Mountain
    # El Capitan Yosemite

}
