# hide local changes and pull updates to 
# the git repo in the script's folder
(
  cd "$(dirname "$0")"
  git stash
  # git pull origin master
  # don't force which branch, assume local default 
  git pull origin
# no need to pushd popd as () runs as a sub-shell
)
