class CreateSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :settings do |t|
      t.string :course
      t.datetime :date_to
      t.timestamps
    end
  end
end
