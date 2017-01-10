class BankAccount < ApplicationRecord
  belongs_to :owner, class_name: "User", :validate => true, :foreign_key => 'owner_id'
  before_save :validate_model

  private
    def validate_model
      errors.add(:name, "Bank account is required") if self.name.blank?
    end
end
