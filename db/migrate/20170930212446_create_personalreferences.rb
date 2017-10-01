class CreatePersonalreferences < ActiveRecord::Migration[5.0]
  def change
    create_table :personalreferences do |t|
      t.references :requisition, index: true, foreign_key: true
      t.string :first_name,             default: ""
      t.string :second_name,             default: ""
      t.string :first_last_name,             default: ""
      t.string :second_last_name,             default: ""
      t.string :cell_phone_number,             default: ""
    end
  end
end
