class EpisodesController < ApplicationController
  def new
    @episode = Episode.new
  end

  def show
    @episode = Episode.find(params[:id])
  end

  def index
  end

  def create
    @episode = Episode.new(episode_params)
    if @episode.save
      Resque.enqueue(DurationGetter, @episode.id)
      redirect_to @episode
    else
      render :new
    end
  end

  private
   def episode_params
     params.require(:episode).permit(:asset_url)
   end
end
