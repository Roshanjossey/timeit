require "rails_helper"

RSpec.describe "routing for users",type: :routing do
  it { expect(get('/users/monthly_summary')).to route_to("users#monthly_summary") }
end
