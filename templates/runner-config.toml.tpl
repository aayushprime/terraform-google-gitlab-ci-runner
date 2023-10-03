concurrent = ${runners_concurrent}
check_interval = 0
listen_address = "127.0.0.1:9252"

[session_server]
  session_timeout = 1800

[[runners]]
  name = "gcp-shell"
  url = "${gitlab_url}"
  token = "__TOKEN_BE_REPLACED1__"
  executor = "shell"
  [runners.custom_build_dir]
  [runners.cache]
    [runners.cache.s3]
    [runners.cache.gcs]
    [runners.cache.azure]

[[runners]]
  name = "gcp-docker"
  url = "${gitlab_url}"
  token = "__TOKEN_BE_REPLACED2__"
  executor = "docker"
  [runners.custom_build_dir]
  [runners.cache]
    [runners.cache.s3]
    [runners.cache.gcs]
    [runners.cache.azure]
  [runners.docker]
    tls_verify = false
    image = "python:3.6"
    privileged = false
    disable_entrypoint_overwrite = false
    oom_kill_disable = false
    disable_cache = false
    volumes = ["/cache"]
    shm_size = 0
[[runners]]
  name = "gitlab-runner-frontend"
  limit = 1
  request_concurrency = 1 
  url = "${gitlab_url}"
  token = "__TOKEN_BE_REPLACED3__"
  executor = "shell" 
  [runners.custom_build_dir] 
  [runners.cache] 
        [runners.cache.s3]
        [runners.cache.gcs]
        [runners.cache.azure]

${runners_machine_autoscaling}
  %{~ endif ~}
