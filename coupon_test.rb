ENV['BUNDLE_GEMFILE'] ||= File.expand_path('./Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

require 'pp'
require 'recurly'

Recurly.subdomain = "roosterteeth"

# Required (this is your "Private API Key" which can be found under "API Credentials" in the admin panel
Recurly.api_key = ENV["RECURLY_API_KEY"]

bulk_coupon = Recurly::Coupon.find("cs1y")
pp bulk_coupon
generated_coupons = bulk_coupon.generate(1).to_a
pp generated_coupons

generated_coupons2 = bulk_coupon.generate(2).to_a
pp generated_coupons2


unique_codes = bulk_coupon.generate(1)
puts "generate 1"
unique_codes.each do |c|
  puts c.coupon_code
end

unique_codes2 = bulk_coupon.generate(2)
puts "generate 2"
unique_codes2.each do |c|
  puts c.coupon_code
end

# output
# #<Recurly::Coupon applies_for_months: nil, applies_to_all_plans: false, applies_to_non_plan_charges: false, coupon_code: "cs1y", coupon_type: "bulk", created_at: #<DateTime: 2019-02-27T18:22:36+00:00 ((2458542j,66156s,0n),+0s,2299161j)>, description: nil, discount_in_cents: #<Recurly::Money USD: 18_00>, discount_percent: nil, discount_type: "dollars", duration: "single_use", free_trial_amount: nil, free_trial_unit: nil, id: 2688748148869044566, invoice_description: nil, max_redemptions: nil, max_redemptions_per_account: 1, name: "Cancel/Save 1 Year Coupon $17.99 @ Mar 2019 ", plan_codes: ["1year"], redeem_by_date: nil, redemption_resource: "subscription", single_use: true, state: "redeemable", temporal_amount: nil, temporal_unit: nil, unique_template_code: nil, updated_at: #<DateTime: 2019-04-18T18:13:51+00:00 ((2458592j,65631s,0n),+0s,2299161j)>>
# []
# [#<Recurly::Coupon applies_for_months: nil, applies_to_all_plans: false, applies_to_non_plan_charges: false, coupon_code: "cs1y-bvrksm2xyz", coupon_type: "unique_code", created_at: #<DateTime: 2019-04-19T21:39:42+00:00 ((2458593j,77982s,0n),+0s,2299161j)>, description: nil, discount_in_cents: #<Recurly::Money USD: 18_00>, discount_percent: nil, discount_type: "dollars", duration: "single_use", free_trial_amount: nil, free_trial_unit: nil, id: 2725810916695702618, invoice_description: nil, max_redemptions: nil, max_redemptions_per_account: 1, name: "Cancel/Save 1 Year Coupon $17.99 @ Mar 2019 ", plan_codes: ["1year"], redeem_by_date: nil, redemption_resource: "subscription", single_use: true, state: "redeemable", temporal_amount: nil, temporal_unit: nil, unique_template_code: nil, updated_at: #<DateTime: 2019-04-19T21:39:42+00:00 ((2458593j,77982s,0n),+0s,2299161j)>>]
# generate 1
# generate 2
# cs1y-or3ggsx5gt