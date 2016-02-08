class EntriesController < ApplicationController

  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.valid?
      @entry.save
      flash[:success] = "Entry added successfully"   
    else
      flash.now[:error] = @entry.errors.full_messages.join("<br>").html_safe
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
  
  def entry_params
    params.require(:entry).permit(:date, :project_id, :duration, :billable, :description, :user_id)
  end
  
  def params_for_update
    params.require(:entry).permit(:date, :project, :duration, :billable, :description)
  end
end
