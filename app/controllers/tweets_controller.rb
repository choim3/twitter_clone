class TweetsController < ApplicationController
    before_action :set_tweet, only: [:show]

    def index
        @tweets = Tweet.all
    end

    def show
    end

    def new
        @tweet = Tweet.new
    end 

    def create
        @tweet = Tweet.new(tweet_params)
        if @tweet.save
            flash[:notice] = "Tweet Posted!"
            redirect_to home_path
        else 
            render :new, status: :unprocessable_entity
        end
    end

    private

    def tweet_params
        params.require(:tweet).permit(:description)
    end

    def set_tweet
        @tweets = Tweet.find(params[:id])
    end
end