class CreatePractices < ActiveRecord::Migration[7.0]
  def change
    create_table :practices do |t|
      # t.string :nickname,           null: false
      t.integer    :player_id,  null: false
      t.integer    :attempt_id, null: false
      t.text       :point,      null: false
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
