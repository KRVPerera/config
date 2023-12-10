#!/bin/sh

#git filter-branch --env-filter '
#OLD_EMAIL="rukshan.viduranga@gmail.com
#CORRECT_NAME="KRVPerera"
#CORRECT_EMAIL="2173530+KRVPerera@users.noreply.github.com"
#if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
#then
#    export GIT_COMMITTER_NAME="$CORRECT_NAME"
#    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
#fi
#if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
#then
#    export GIT_AUTHOR_NAME="$CORRECT_NAME"
#    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
#fi
#' --tag-name-filter cat -- --branches --tags

# https://stackoverflow.com/questions/750172/how-do-i-change-the-author-and-committer-name-email-for-multiple-commits
git filter-branch -f --commit-filter '
        if [ "$GIT_COMMITTER_NAME" = "KRVPerera" ];
        then
                GIT_COMMITTER_NAME="KRVPerera";
                GIT_AUTHOR_NAME="KRVPerera";
                GIT_COMMITTER_EMAIL="2173530+KRVPerera@users.noreply.github.com";
                GIT_AUTHOR_EMAIL="2173530+KRVPerera@users.noreply.github.com";
                git commit-tree "$@";
        else
                git commit-tree "$@";
        fi' HEAD
