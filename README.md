# Simple CloudRun Build and Deploy Shell Script
This is a shell script to build a container image and deploy it to CloudRun.
---
This is my personal script, which I used to run from the GCP Cloud shell to build and deploy container images.
It is a quick and dirty script you can use to deploy code.
It will build and deploy the service and tag you specify.
Give it appropriate executable permissions and store it in your shell path.


Prerequisites :
1. A cloud-run service has already been created with some sample container images.
2. The script should be run from the directory where you stored the Dockerfile or code.


Usage :
1. Move into the directory where the code you want to deploy is.
2. Run the command as shown below, passing the first argument as the service name and tag name, separated by a colon.
`deploy cloud-run-service:tag-here`
