class Requisition < ApplicationRecord

  belongs_to :user
  has_many :personalreferences, inverse_of: :requisition

  accepts_nested_attributes_for :personalreferences, reject_if: :all_blank, allow_destroy: true

  validates :incomes, :marital_status, :requested_amount, :payment_terms, :comment,
    :company_name, :company_position, :company_phone_number,
    :presence => true

end
