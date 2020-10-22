class ShowsController < ApplicationController
    before_action :can_create_show, only: [:new, :create, :edit, :destroy]
    
    def index
        @shows = current_user.vendor.shows.order(:start)
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

    def can_create_show
        if !current_user.permission_class.create_show
        flash[:alert] = "You dont have permission to access show records"
        return redirect_to request.referrer unless request.referrer == nil
        redirect_to '/'
        end
    end
end
