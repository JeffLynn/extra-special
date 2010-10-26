# == Schema Information
#
# Table name: applications
#
#  id                                        :integer(4)      not null, primary key
#  name_of_applicant                         :string(255)
#  address_of_applicant                      :string(255)
#  name_of_applicants_supporter              :string(255)
#  contact_details_of_supporter              :string(255)
#  what_applicant_is_applying_for            :text
#  relevant_information                      :text
#  details_of_cost                           :text
#  other_contributions                       :string(100)
#  amount_requested_from_extra_special_trust :string(100)
#  registered_care_allowance                 :boolean(1)      default(FALSE), not null
#  supported_living_allowance                :boolean(1)      default(FALSE), not null
#  domiciliary_allowance                     :boolean(1)      default(FALSE), not null
#  accepted_terms_and_conditions             :datetime
#  created_at                                :datetime
#  updated_at                                :datetime
#

class Application < ActiveRecord::Base
  validates_presence_of :name_of_applicant
  validates_presence_of :address_of_applicant
  validates_presence_of :name_of_applicants_supporter
  validates_presence_of :contact_details_of_supporter
  validates_presence_of :what_applicant_is_applying_for
  validates_presence_of :relevant_information
  validates_presence_of :details_of_cost
  validates_presence_of :other_contributions
  validates_presence_of :amount_requested_from_extra_special_trust
  validates_presence_of :accepted_terms_and_conditions
  validates_length_of :name_of_applicant, :maximum => 255, :allow_nil => true
  validates_length_of :address_of_applicant, :maximum => 255, :allow_nil => true
  validates_length_of :name_of_applicants_supporter, :maximum => 255, :allow_nil => true
  validates_length_of :contact_details_of_supporter, :maximum => 255, :allow_nil => true
  validates_length_of :other_contributions, :maximum => 100, :allow_nil => true
  validates_length_of :amount_requested_from_extra_special_trust, :maximum => 100, :allow_nil => true

  attr_accessor :no_additional_funding

  before_validation :normalize_params
  before_save :validate

  def normalize_params
    if self.no_additional_funding != true
      self.no_additional_funding = (self.no_additional_funding == "1" ) ? true : false
    end
    true
  end
  
  def validate    
    unless no_additional_funding || registered_care_allowance || supported_living_allowance || domiciliary_allowance
      errors.add_to_base("Need to provide one of 'Registered Care allowance', 'Supported living allowance', 'Domiciliary allowance' or 'None'")
    else
      if no_additional_funding && (registered_care_allowance || supported_living_allowance || domiciliary_allowance)
        errors.add_to_base("Cannot be 'None' if any of 'Registered Care allowance', 'Supported living allowance', 'Domiciliary allowance' are selected.")
      end
    end
  end

  def after_find
    # Set the no additional funding flag after the record is loaded.
    @no_additional_funding = !(registered_care_allowance || supported_living_allowance || domiciliary_allowance)
  end

  def accept_terms_and_conditions
    !self.accepted_terms_and_conditions.nil?
  end
  
  def accept_terms_and_conditions=(value)
    if self.accepted_terms_and_conditions.nil? && value && value.to_i == 1
      self.accepted_terms_and_conditions = Time.now
    end
  end
end

