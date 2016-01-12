require 'rails_helper'

RSpec.describe EntriesController, type: :controller do

  describe "#index" do
    it "renders index page" do
      get :index
      expect(response).to render_template :index
    end
  end
end
