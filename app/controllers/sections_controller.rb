class SectionsController < ApplicationController
  
  layout "admin"
  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  before_action :find_section

  def index
    #@sections = Section.sorted
    @sections = @page.sections.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new({:name => "Default"})
    @pages = Section.order('position ASC')
    @section_count = Section.count + 1
  end

  def create
     @section = Section.new(section_params)
     if @section.save
      flash[:notice] = "New Section has been created"
       redirect_to(:action => 'index', :page_id => @page.id)
     else
      @pages = Section.order('position ASC')
      @section_count = Section.count + 1
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
    @pages = Section.order('position ASC')
    @section_count = Section.count
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section has been edited"
      redirect_to(:action => 'show', :id => @section.id, :page_id => @page.id)
    else
      @pages = Section.order('position ASC')
      @section_count = Section.count
      render('new')
    end
  end

  def delete
      @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id]).destroy
    flash[:notice] = "Section has been deleted"
    redirect_to(:action => 'index', :page_id => @page.id)
  end

  private
    def section_params
      params.require(:section).permit(:page_id, :name, :content_type, :content, :visible, :position, :created_at)
    end

    def find_section

      if params[:page_id]

        @page = Page.find(params[:page_id])

      end

    end
end
