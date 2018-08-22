class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end
end
