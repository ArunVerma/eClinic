class SecretCodesController < ApplicationController
  load_and_authorize_resource

  def index
    @secret_codes = SecretCode.includes(:user).all.order('updated_at desc')
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
