echo "Running the deploy script..."
aws cloudformation create-stack --region ${AWS_REGION} --stack-name ${STACK_NAME} --template-body file://.aws/nonprod/template.yml --parameters ParameterKey=BucketName,ParameterValue=${BUCKET_NAME} ParameterKey=BranchName,ParameterValue=${BRANCH_NAME}
aws cloudformation wait stack-create-complete --stack-name ${STACK_NAME} --region ${AWS_REGION}
aws s3 cp --recursive --acl=public-read /app/dist/ s3://${BUCKET_NAME} --region ${AWS_REGION}
