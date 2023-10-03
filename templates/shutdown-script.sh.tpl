#!/bin/bash
logger "Unregistering Gitlab Runner "
rm /etc/gitlab-runner/token
cat /etc/gitlab-runner/token* | xargs -L 1 -I{} curl -sS --request DELETE "${runners_gitlab_url}/api/v4/runners" --form "token={}" 2>&1 | logger &