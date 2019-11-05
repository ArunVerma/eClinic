class CreateSecretCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :secret_codes do |t|
      t.belongs_to :user
      t.string :code
      t.timestamps
    end
  end
end
