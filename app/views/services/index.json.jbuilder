json.array! @pricings do |pricing|
  pricing.pricing_dimensions.each do |pricing_dimension|
    json.description pricing_dimension.description
    json.beginRange pricing_dimension.begin_range
    json.endRange pricing_dimension.end_range
    json.unit pricing_dimension.unit
    json.pricePerUnit pricing_dimension.price_per_unit
    json.effectiveDate pricing.effective_date
  end  
end