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
require 'spec_helper'

describe Application do

  it "should create a new instance given valid attributes" do
    Factory.build(:application).should be_valid
  end

  it "will not create with invalid attributes" do
    application = Application.new()
    application.should_not be_valid
  end

  describe "additional funding" do
    it "raises a validation error if none are set" do
      application = Factory.build(:application,
        :registered_care_allowance => false,
        :supported_living_allowance => false,
        :domiciliary_allowance => false
      )
      application.should_not be_valid
    end

    it "will return no_additional_funding as true if the others aren't set" do
      application = Factory.create(:application,
        :registered_care_allowance => false,
        :supported_living_allowance => false,
        :domiciliary_allowance => false,
        :no_additional_funding => true
      )
      application = Application.find(application.id)
      application.no_additional_funding.should be_true
    end

    it "will return no_additional_funding as false if any of the others aren set" do
      application = Factory.create(:application,
        :registered_care_allowance => true,
        :supported_living_allowance => false,
        :domiciliary_allowance => false
      )
      application = Application.find(application.id)
      application.no_additional_funding.should be_false
    end

    
    it "will not allow any of the others to be selected if none is set" do
      application = Factory.build(:application,
        :registered_care_allowance => false,
        :supported_living_allowance => true,
        :domiciliary_allowance => false,
        :no_additional_funding => true
      )
      application.should_not be_valid
    end
    
    it "will allow any of the others to be selected if none is not set" do
      application = Factory.build(:application,
        :registered_care_allowance => false,
        :supported_living_allowance => true,
        :domiciliary_allowance => true,
        :no_additional_funding => false
      )
      application.should be_valid
    end
  end
end



