% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/buildsteps_templates.R
\name{cr_buildstep_docker}
\alias{cr_buildstep_docker}
\title{Create a build step to build and push a docker image}
\usage{
cr_buildstep_docker(
  image,
  tag = c("latest", "$BUILD_ID"),
  location = ".",
  projectId = cr_project_get(),
  dockerfile = "Dockerfile",
  kaniko_cache = FALSE,
  ...
)
}
\arguments{
\item{image}{The image tag that will be pushed, starting with gcr.io or created by combining with \code{projectId} if not starting with gcr.io}

\item{tag}{The tag or tags to be attached to the pushed image - can use \code{Build} macros}

\item{location}{Where the Dockerfile to build is in relation to \code{dir}}

\item{projectId}{The projectId}

\item{dockerfile}{Specify the name of the Dockerfile found at \code{location}}

\item{kaniko_cache}{If TRUE will use kaniko cache for Docker builds.}

\item{...}{Further arguments passed in to \link{cr_buildstep}}
}
\description{
Create a build step to build and push a docker image
}
\details{
Setting \code{kaniko_cache = TRUE} will enable caching of the layers of the Dockerfile, which will speed up subsequent builds of that Dockerfile.  See \href{https://cloud.google.com/cloud-build/docs/kaniko-cache}{Using Kaniko cache}
}
\examples{
cr_project_set("my-project")
cr_bucket_set("my-bucket")

cr_buildstep_docker("gcr.io/my-project/my-image")
cr_buildstep_docker("my-image")
cr_buildstep_docker("my-image", tag = "$BRANCH_NAME")

# setting up a build to trigger off a Git source:
my_image <- "gcr.io/my-project/my-image"
my_repo <- RepoSource("github_markedmondson1234_googlecloudrunner",
                      branchName="master")
\dontrun{
docker_yaml <- cr_build_yaml(steps = cr_buildstep_docker(my_image))
built_docker <- cr_build(docker_yaml, source = my_repo)

# make a build trigger so it builds on each push to master
cr_buildtrigger("build-docker", trigger = my_repo, build = built_docker)
}

# add a cache to your docker build to speed up repeat builds
cr_buildstep_docker("my-image", kaniko_cache = 6L)
}
\seealso{
Other Cloud Buildsteps: 
\code{\link{cr_buildstep_bash}()},
\code{\link{cr_buildstep_decrypt}()},
\code{\link{cr_buildstep_df}()},
\code{\link{cr_buildstep_edit}()},
\code{\link{cr_buildstep_extract}()},
\code{\link{cr_buildstep_gitsetup}()},
\code{\link{cr_buildstep_mailgun}()},
\code{\link{cr_buildstep_nginx_setup}()},
\code{\link{cr_buildstep_pkgdown}()},
\code{\link{cr_buildstep_run}()},
\code{\link{cr_buildstep_r}()},
\code{\link{cr_buildstep_secret}()},
\code{\link{cr_buildstep_slack}()},
\code{\link{cr_buildstep}()}
}
\concept{Cloud Buildsteps}
