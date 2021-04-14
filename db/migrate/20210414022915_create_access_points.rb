class CreateAccessPoints < ActiveRecord::Migration[6.1]
  def change
    create_table :access_points do |t|
      t.datetime :check
      t.integer :status, default: 0
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
