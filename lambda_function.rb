require 'json'
require 'aws-sdk-dynamodb'

DYNAMO = Aws::DynamoDB::Client.new(region: ENV['region'])

def lambda_handler(event:, context:)
    
    dynamodb_table = ENV['table']
    
    item = {
        image: event["repository"]["name"],
        timestamp: Time.new.to_s,
    }

    params = {
        table_name: dynamodb_table,
        item: item
    }
    
    begin
      result = DYNAMO.put_item(params)
      puts "Added Docker image build: #{item[:timestamp]} - #{item[:image]}"
    rescue  Aws::DynamoDB::Errors::ServiceError => error
      puts 'Unable to add Docker image build:'
      puts error.message
    end
    { statusCode: 200, body: JSON.generate('consider it done') }
end
