#!/bin/bash

#create code-build resource
echo creating codebuild resources
aws cloudformation create-stack --stack-name codebuild-resources --template-body file://cloudformation-templates/code-build.yml --capabilities CAPABILITY_IAM --parameters file://cloudformation-templates/parameters.json

#wait for resources to be created
echo waiting for successful creation of stack
aws cloudformation wait stack-create-complete --stack-name codebuild-resources

#create code-deploy resources
echo creating codedeploy resources
aws cloudformation create-stack --stack-name codedeploy-resources --template-body file://cloudformation-templates/code-deploy.yml --capabilities CAPABILITY_IAM --parameters file://cloudformation-templates/parameters.json

#wait for resources to be created
echo waiting for successful creation of stack
aws cloudformation wait stack-create-complete --stack-name codedeploy-resources

echo creating pipeline
#create pipeline
aws cloudformation create-stack --stack-name codepipeline-resources --template-body file://cloudformation-templates/codepipeline.yml --capabilities CAPABILITY_IAM --parameters file://cloudformation-templates/parameters.json

#wait for resources to be created
echo waiting for successful creation of stack
aws cloudformation wait stack-create-complete --stack-name codepipeline-resources

echo getting elastic load balancer URL
aws cloudformation describe-stacks --stack-name codedeploy-resources  --query 'Stacks[0].Outputs[?OutputKey==`URL`].OutputValue'

exit
