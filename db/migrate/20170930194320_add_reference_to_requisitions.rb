class AddReferenceToRequisitions < ActiveRecord::Migration[5.0]
  def change
    add_reference :requisitions, :user, index: true, foreign_key: true
  end
end
