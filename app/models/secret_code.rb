class SecretCode < ApplicationRecord

  validates :code, presence: true
  validates :code, uniqueness: true

  belongs_to :user, optional: true

  scope :available, -> { where('user_id IS null') }

  OPTIONS_FOR_NEW_CODES = %w[1 10 20 50 100]

  def self.options_for_new_codes
    OPTIONS_FOR_NEW_CODES
  end
end
