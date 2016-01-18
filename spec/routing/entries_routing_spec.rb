require "rails_helper"

RSpec.describe "routes for time entries" do
  it { expect(get('/entries/new')).to route_to("entries#new") }
end
