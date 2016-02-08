class EntriesController < ApplicationController

  def index
    @entries = Entry.all
  end

  def new
    @entries = []
    5.times do
      @entries << Entry.new
    end
  end

  def create
    @entries = []
    @invalid_entries = params["entries"].map do |entry| 
      entry = Entry.new(entry_params entry)
      @entries << entry
      entry.invalid?
    end.any?
    
    unless @invalid_entries
      params["entries"].each do |entry|
        Entry.create(entry_params entry)
      end
    else
      render 'entries/new'
    end
  end
  
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    flash[:notice] = "Entry removed"
    redirect_to :action => 'index'
  end
  
  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update(params_for_update)
      redirect_to entries_path, notice: 'Product was successfully updated.'
    end
  end

  private

  def entry_params x
    x.permit(:user_id, :project_id, :date, :duration, :billable, :description )
    
  end
  
  def params_for_update
    params.require(:entry).permit(:date, :project, :duration, :billable, :description)
  end
end
