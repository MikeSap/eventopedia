class TechnicianBookingsController < ApplicationController
    def new
        @technician_booking = TechnicianBooking.new
        @show = Show.find(params[:show_id])
    end

    def create
        @show = Show.find(tb_params[:show_id])
        @technician_booking = TechnicianBooking.new(tb_params)
        return render :new unless @technician_booking.save
        redirect_to show_path(tb_params[:show_id])
    end

    def destroy
        technician_booking = TechnicianBooking.find(params[:id])
        show = technician_booking.show
        technician_booking.destroy
        redirect_to show_path(show)
    end


    private

    def tb_params
        params.require(:technician_booking).permit(:user_id, :show_id, :call_time, :out_time)
    end
end
