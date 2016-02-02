require 'rails_helper'

RSpec.describe EntriesController, type: :controller do

  describe "#index" do
    it "renders index page" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "DELETE destroy" do
    before :each do
      @entry = FactoryGirl.create(:entry)
    end

    it "deletes entry" do
      expect{ delete :destroy, id: @entry }.to change(Entry,:count).by(-1)
    end
  end

  describe "PUT update" do

    let(:valid_attributes) { FactoryGirl.build(:entry).attributes.symbolize_keys }

    describe "with valid params" do
      let(:new_attributes) { FactoryGirl.build(:entry, duration: 1 ).attributes.symbolize_keys }

      it "updates the requested entry", focus: true do
        entry = Entry.create! valid_attributes
        put :update, {:id => entry.to_param, :entry => new_attributes}
        entry.reload
        expect(assigns(:entry).attributes.symbolize_keys[:duration]).to eq(new_attributes[:duration])
      end
    end

    describe "#new" do
      it "renders index page" do
        get :new
        expect(response).to render_template :new
      end
    end
  end
end
