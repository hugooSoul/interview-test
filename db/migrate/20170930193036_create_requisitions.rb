class CreateRequisitions < ActiveRecord::Migration[5.0]
  def change
    create_table :requisitions do |t|
      t.string :incomes,              default: ""
      t.string :marital_status,       default: ""
      t.string :requested_amount,     default: ""
      t.string :payment_terms,        default: ""
      t.text   :comment,              default: ""
      t.string :company_name,         default: ""
      t.string :company_position,     default: ""
      t.string :company_phone_number, default: ""
    end
  end
end
