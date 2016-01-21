class UsersController < ApplicationController

  def monthly_summary
    @month =  (params[:date][:month] || Date.current.month).to_i
    @year = (params[:date][:year] || Date.current.year).to_i
    @user = User.find params[:user_id]
    monthly_entries = @user.entries.by_month(@month).by_year(@year)
    billable_entries = monthly_entries.where('billable = ?', true)
    non_billable_entries = monthly_entries.where('billable = ?', false)
    @billable_projects = total_project_duration billable_entries
    @non_billable_projects = total_project_duration non_billable_entries
  end

  private

  def total_project_duration time_entries
    project_duration = Hash.new
    time_entries.group(:project_id).sum(:duration).each do | project_id, duration |
      project_duration[Project.find(project_id).name] = duration
    end
    project_duration
  end
end
