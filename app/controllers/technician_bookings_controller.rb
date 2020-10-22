class TechnicianBookingsController < ApplicationController
    before_action :can_book_tech
    
    def new        
        @bookable_technicians = current_user.vendor.users.select{ |user| user.bookable? }.sort_by{|user| user.permission_class.title}
        @show = Show.find(params[:show_id])
        @technician_booking = TechnicianBooking.new(call_time: @show.start, out_time: @show.end)
    end

    def create
        @show = Show.find(tb_params[:show_id])
        @technician_booking = TechnicianBooking.new(tb_params)
        @bookable_technicians = current_user.vendor.users.select{ |user| user.bookable? }.sort_by{|user| user.permission_class.title}
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

    def can_book_tech
        if !current_user.permission_class.book_technician
        flash[:alert] = "You dont have permission to book techs on a show"
        return redirect_to request.referrer unless request.referrer == nil
        redirect_to '/'
        end
      end
end
