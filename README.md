# docker.hub.lambda.webhook
Docker Hub Build Webhook example based on AWS Lambda and DynamoDB

**Steps to deploy the solution:**
1. Create DynamoDB Table with CloudFormation template
2. Create AWS Lambda with Ruby runtime
3. Fill the template IAM policy with appropriate values and attach the policy to newly created AWS Lambda
