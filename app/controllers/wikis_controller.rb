class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end



  def show
    @wiki = Wiki.find(params[:id])
  end



  def new
    @wiki = Wiki.new
  end



  def edit
    @wiki = Wiki.find(params[:id])
  end



  def create

    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to [@wiki]

    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end



  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)

    if @wiki.save
      flash[:notice] = "Wiki was updated."
      redirect_to [@wiki]

    else
      flash[:error] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end



  def destroy
    @wiki = Wiki.find(params[:id])
    @wiki.destroy

    redirect_to wikis_path
    #redirecting to index action template "app/views/wikis/index.html.erb"
  end


   #Add private methods to the bottom of the file.
   #Any method defined below private, will be private.
   private
     def wiki_params
       params.require(:wiki).permit(:title, :body)
     end
end


