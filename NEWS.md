# googleCloudRunner 0.2.0.9000

* Move the setup wizard functions from `googleCloudRunner` to `googleAuthR` so they are available for all packages.
* Check for Cloud Scheduler Service Agent is present for scheduler to work (#73)
* `cr_build_upload_gcs()` will now clean up the files it makes when the function exits (#68 - thanks @MLud)
* Support local testing in plumber example (#66 - thanks @samterfa)
* Support multiple tags in Docker builds (#75)
* Fix being able to pass built Cloud Build objects to schedule via `cr_build_schedule_http()` (#47)
* Add progress for Cloud builds via library(progress) (#29)
* Add support for Kaniko cache in `cr_buildstep_docker()` and `cr_deploy_docker()` (#46) -should see much quicker repeat builds

# googleCloudRunner 0.2.0

* Add `port` argument to Cloud Run deployments via `cr_buildstep_run()`
* Add `cr_deploy_pkgdown` and `cr_deploy_packagetests` add subsequent buildsteps to aid R package development.
* Fix `cr_buildstep_r()` so it can run R scripts from a filename when `r_source="runtime"` (#45 - thanks @j450h1 and @axel-analyst)
* Add ability to run R scripts straight from Cloud Storage (#45 - thanks @j450h1 and @axel-analyst) - specify R script location starting with `gs://`
* Let `timeout` be specified within `cr_build_yaml()` (#43 - thanks @dmoimpact)
* Correct print method for build substitutions
* Update `cr_schedule_list()` to only return non-nested data
* Allow specification of Dockerfile name in `cr_buildstep_docker()`
* Easier parsing of env arguments in `cr_buildstep()`
* Entrypoint in `cr_buildstep()` accepts one argument only
* Allow specification of timezone in `cr_schedule()` (#49 - thanks @samterfa)
* Let `cr_deploy_r()` pass through arguments to `cr_buildstep_r()` (#50 - thanks @samterfa)
* Modify `cr_deploy_packagetests()` so it can pass through dot arguments to `cr_build_yaml()` such as `timeout`
* Add `cr_buildstep_secret()` using Secret Manager (#52)
* Update `cr_deploy_pkgdown()` to use Secret Manager (#54)
* Remove unnecessary `projectId` argument from `cr_build_make()` (#57)
* Add `cr_setup()` to help setup a googleCloudRunner environment (#53)

# googleCloudRunner 0.1.1

* Initial release
