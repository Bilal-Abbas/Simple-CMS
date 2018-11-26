class DemoController < ApplicationController
	layout 'admin'
  def index
  		@array = [1,2,3,4,5,6,7,8,9,10]
   		@idindex = params['id']
   		@pageindex = params[:page].to_i
   		@name = params[:name]
  end
   def hello
   	@array = [1,2,3,4,5,6,7,8,9,10]
   	@id = params['id']
   	@page = params[:page].to_i
   	@name = params[:name]

   end
  def other_hello
  	redirect_to(:controller => 'demo', :action => 'hello')
  end
  
  def text_helper

  end
end
