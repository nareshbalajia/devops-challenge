# Jenkins Pipeline for CI of an Android App

## Pipeline Flow

- Checks out Android app repo and utility repo which houses python scripts for slack upload of Reports
- Builds source code
- Checks if build is successful; if some in-consistent Android emulator issues occur, some build steps will be repeated
- Uploads Build artifacts to AWS S3
- Uploads test reports as a zip file to Slack
- Uploads Jenkins agent workspace as a snapshot to S3
