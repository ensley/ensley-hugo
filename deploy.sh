#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
# hugo -t hugo-future-imperfect # if using a theme, replace by `hugo -t <yourtheme>`

RScript -e 'Sys.setenv(RSTUDIO_PANDOC="/Applications/RStudio.app/Contents/MacOS/pandoc")' -e 'blogdown::build_site()'


# Go To Public folder
cd public
# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back
cd ..

# # add other changes to entire project
# git add -A

# # commit
# msg="commit to hugo repo `date`"
# if [ $# -eq 1 ]
# 	then msg="$1"
# fi
# git commit -m "$msg"

# # push source
# git push origin master