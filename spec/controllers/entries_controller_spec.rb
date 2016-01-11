require 'rails_helper'

RSpec.describe EntriesController, type: :controller do

  describe "#new" do
    it "renders new entry form" do
      get :new
      expect(response).to render_template :new
    end
  end
end
