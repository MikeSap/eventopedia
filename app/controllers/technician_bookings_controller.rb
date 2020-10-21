class TechnicianBookingsController < ApplicationController
    def new
        @technician_booking = TechnicianBooking.new
        @show = Show.find(params[:show_id])
    end

    def create
        @technician_booking = TechnicianBooking.find_or_create_by(show_id: eb_params[:show_id], user_id: eb_params[:user_id])
        @technician_booking.call_time = eb_params[:call_time]
        @technician_booking.out_time = eb_params[:out_time]
        return render :new unless @technician_booking.save
        redirect_to show_path(eb_params[:show_id])
    end

    private

    def eb_params
        params.require(:technician_booking).permit(:user_id, :show_id, :call_time, :out_time)
    end
end
