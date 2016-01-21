require "rails_helper"

RSpec.describe UsersController,type: :controller do

  describe "#monthly_summary" do
    let(:user) { create :user }
    let(:project) { create :project }
    let(:entry) { create :entry, project: project, user: user }
    let(:make_request) do
      get :monthly_summary, user_id: user.id, month: Date.current.month, year: Date.current.year
    end

    it "sets @user, @month and @year" do
      make_request
      expect(assigns(:user).id).to eq user.id
      expect(assigns(:month)).to eq Date.current.month
      expect(assigns(:year)).to eq Date.current.year
    end

    it "sets @billable_projects and @non_billable_projects" do
      billable_projects = { project.name => entry.duration }
      non_billable_projects = {}
      make_request
      expect(assigns(:billable_projects)).to eq billable_projects
      expect(assigns(:non_billable_projects)).to eq non_billable_projects
    end

    it "renders monthly_summary " do
      make_request
      expect(response).to render_template :monthly_summary
    end

  end

end
