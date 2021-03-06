require "rails_helper"

RSpec.describe "routes for time entries" do
  it { expect(get('/entries/new')).to route_to("entries#new") }
  it { expect(post(batch_time_entries_path)).to route_to("entries#batch_create") }
end
