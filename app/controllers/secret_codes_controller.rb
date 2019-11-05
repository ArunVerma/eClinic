class SecretCodesController < ApplicationController

  def index
    @secret_codes = SecretCode.includes(:user).all
  end

  def create
    number_of_codes = params[:number_of_codes].to_i
    number_of_codes.times do |i|
      new_code = [*('A'..'Z')].sample(8).join
      SecretCode.new(code: new_code).save
    end
    redirect_to root_url
  end
end
