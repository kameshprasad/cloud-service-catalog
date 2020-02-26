require "net/http"

class AwsCloudfrontPricingSyncJob < ApplicationJob
  queue_as :default

  def perform(*args)
    service = Service.find_by(code: 'AmazonCloudFront')
    url = service.pricing_url
    data = JSON.parse(Net::HTTP.get(URI.parse(url)))
    data['products'].each do |key, prod_api|
      product = service.products.find_by(sku: prod_api['sku'])
      unless product.present?
        product = service.products.create(sku: prod_api['sku'], 
                                          location: prod_api['attributes']['location'],
                                          location_type: prod_api['attributes']['locationType'])
      end
      price_api = data['terms']['OnDemand'][product.sku].flatten[1]
      pricing = product.pricings.create(offer_term: price_api.dig('offerTermCode'),
                                        effective_date: price_api.dig('effectiveDate'),
                                        synced_date: DateTime.now)
      price_api.dig('priceDimensions').each do |price_dim_api|
        pricing.pricing_dimensions.create(rate_code: price_dim_api[1]['rateCode'],
                                          description: price_dim_api[1].dig('description'),
                                          begin_range: price_dim_api[1].dig('beginRange'),
                                          end_range: price_dim_api[1].dig('endRange'),
                                          unit: price_dim_api[1].dig('unit'),
                                          price_per_unit: price_dim_api[1].dig('pricePerUnit')['USD'])
      end
    end

    puts data
  end
end
