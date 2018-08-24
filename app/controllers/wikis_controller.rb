class WikisController < ApplicationController

  after_action :verify_authorized
  #if you forgot 'authorize @wiki' & you want to make sure your controller is still locked down
  #use this method - 'after_action :verify_authorized' - which pundit provides
  #It makes sure that you've called the authorize method in each and every1 of ur actions!
  # rails s error message = Pundit::AuthorizationNotPerformedError (WikisController): MEANS no1 called pundit's authorize method inside of that action!
  #Took from wikis_controller and placed into application_controller to make sure every single action, in our entire application, is verified for authorization!

  def index
    @wikis = Wiki.all
    authorize @wikis
  end



  def show #will automatically be authorized!!
    set_wiki
  end



  def new
    @wiki = Wiki.new
    authorize @wiki
  end



  def edit #will automatically be authorized!!
    set_wiki
  end



  def create
    @wiki = Wiki.new(wiki_params)
    authorize @wiki

    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to [@wiki]
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end



  def update #will automatically be authorized!!
    set_wiki
    @wiki.assign_attributes(wiki_params)

    if @wiki.save
      flash[:notice] = "Wiki was updated."
      redirect_to [@wiki]
    else
      flash[:error] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end



  def destroy #will automatically be authorized!!
    set_wiki
    @wiki.destroy
    redirect_to wikis_path
    #redirecting to index action template "app/views/wikis/index.html.erb"
  end



   private
   #Add private methods to the bottom of the file.
   #Any method defined below private, will be private.


    def set_wiki
      @wiki = Wiki.find(params[:id])
      authorize @wiki
    end
    #When we set the wiki that means it will authorize automatically!!!!
    #This allows: destroy, update, edit, and show actions - will automatically be authorized!!
    #And the ones that have @wiki, inside of the action, u can lock those down, and that's it!


    def wiki_params
      params.require(:wiki).permit(:title, :body)
    end
end
