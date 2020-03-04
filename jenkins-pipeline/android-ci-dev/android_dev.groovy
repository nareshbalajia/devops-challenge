app_git_url = ""
app_git_branch = "develop"
lambda_git_url = ""
lambda_git_branch = "master"
job_name = "android-ci-develop-pipeline"
job_path = "${new File(__FILE__).parent}"
jenkinsfile = job_path + "/Jenkinsfile"
artifact_bucket_name = ""


pipelineJob(job_name) {
  description("Jenkins pipeline to build and test Android Audio Application for dev release")
  logRotator(-1,100)
  parameters {
    stringParam("APP_GIT_URL", app_git_url, "GIT URL of repo containing Android app source")
    stringParam("APP_GIT_BRANCH", app_git_branch, "GIT Branch of repo containing Android app source")
    choiceParam("APP_BUILD_FLAVOR", ["dev", "qa", "prod"], "Build flavor for the pipeline")
    stringParam("ARTIFACT_BUCKET", artifact_bucket_name,"The bucket to push reports and artifacts")
    stringParam("LAMBDA_FUNCTIONS_GIT_URL", lambda_git_url,"GIT URL for lambda functions")
    stringParam("LAMBDA_FUNCTIONS_GIT_BRANCH",lambda_git_branch ,"GIT Branch for repo containing lambda functions")
  }
  triggers {
    genericTrigger {
      genericVariables {
        genericVariable {
          key("ref")
          value("\$.ref")
          expressionType("JSONPath")
        }
      }
      token("android-audio-develop")
      printPostContent(true)
      regexpFilterText("\$ref")
      regexpFilterExpression("^(refs/heads/develop)\$")
    }
  }
  definition {
    cps {
      sandbox()
      script(readFileFromWorkspace(jenkinsfile))
    }
  }
}
