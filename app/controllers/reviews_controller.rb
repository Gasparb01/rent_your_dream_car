class ReviewsController < ApplicationController
  def new
    @car = Car.find(params[:car_id])
    @review = Review.new
    authorize @review
  end

  def create
    @reservation = Reservation.find(params[:reservation_id])
    @review = current_user.reviews.build(review_params)
    @review.car = @reservation.car
    if @review.save!
      flash[:success] = "Thanks for your review!"
      redirect_to car_path(@reservation.car)
    else
      render 'reservations/show'
    end
    authorize @review
  end

private

  def review_params
    params.require(:review).permit(:content)
  end
end
