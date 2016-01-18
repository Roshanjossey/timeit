class EntriesController < ApplicationController

  def index
    @entries = Entry.all
    @new_entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if !@entry.valid?
      flash[:error] = @entry.errors.full_messages.join("<br>").html_safe
    else
      flash[:success] = "Entry added successfully"   
      @entry.save!
    end
    redirect_to :action => 'index'
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    flash[:notice] = "Entry removed"
    redirect_to :action => 'index'
  end

  def update
    @entry = Entry.find(params[:id])
    @entry.update_attributes params_for_update
  end

  private
  
  def entry_params
    params.require(:entry).permit(:date, :project, :duration, :billable, :description, :user)
  end
  def params_for_update
    params.require(:entry).permit(:date, :project, :duration, :billable, :description)
  end
end
