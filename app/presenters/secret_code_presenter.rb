class SecretCodePresenter < ApplicationPresenter
  def user_email
  	return nil unless  @model.user.present?
    @model.user.email
  end

  def status
    @model.user_id.present? ? 'No' : 'Yes'
  end
end
