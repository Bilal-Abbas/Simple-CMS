class SubjectsController < ApplicationController
  
  layout "admin"

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new()
    @subject_count = Subject.count + 1
  end

  def create

      #Instantiate a new object using form paramerers
      @subject = Subject.new(subject_params)
      #Save the object
        if @subject.save
        #If save succeeds, redirect to other page by an action
          flash[:notice] = "Subject has saved successfully."
          redirect_to(:action => 'index')
        else
        #If the save fails, redisplay the form again to fix the problem
          @subject_count = Subject.count + 1
          render('new')
        end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update

      #Find existing object using form paramerers
      @subject = Subject.find(params[:id])
      #Update the object
        if @subject.update_attributes(subject_params)
        #If update succeeds, redirect to other page by an action
          flash[:notice] = "Subject has updated successfully."

          redirect_to(:action => 'show', :id => @subject.id )
        else
        #If the update fails, redisplay the form again to fix the problem
          @subject_count = Subject.count
          render('new')
        end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy

    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject '#{subject.name}' deletd successfully."
    redirect_to(:action => 'index')

  end

  private

    def subject_params

      params.require(:subject).permit(:name, :position, :visible, :created_at)

    end

end
