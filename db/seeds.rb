# Add first Vendor - Amazon Web Service
vendor = Vendor.find_or_create_by(name: 'Amazon Web Service', code: 'AWS')

# Default service with data available - Amazon CloudFront
vendor.services.find_or_create_by(
  name: 'Amazon CloudFront',
  code: 'AmazonCloudFront',
  pricing_url: 'https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonCloudFront/current/index.json'
)

