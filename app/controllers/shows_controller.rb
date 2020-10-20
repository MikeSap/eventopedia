class ShowsController < ApplicationController
    def index
        @shows = current_user.vendor.shows
    end

    def show
        @show = Show.find(params[:id])
    end

    def new
        @show = Show.new
    end

    def create
        @show = Show.new(show_params.merge(vendor: current_user.vendor))
        return render :new unless @show.save
        redirect_to shows_path
    end

    def edit
        @show = Show.find(params[:id])
    end

    def update
        @show = Show.find(params[:id])
        @show.update(show_params)
        redirect_to show_path(@show)
    end

    def destroy
        @show = Show.find(params[:id])
        @show.destroy
        redirect_to shows_path
    end

    private

    def show_params
        params.require(:show).permit(:name, :venue, :client, :start, :end)
    end
end
