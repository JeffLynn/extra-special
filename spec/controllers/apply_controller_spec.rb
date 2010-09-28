require 'spec_helper'

describe ApplyController do
  integrate_views

  #Delete these examples and add some real ones
  it "should use ApplyController" do
    controller.should be_an_instance_of(ApplyController)
  end


  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "should be successful" do
      post 'create'
      response.should be_success
      response.should render_template('new')
    end

    it "should redirect when valid data entered" do
      lambda {
        post :create, 'application' => {
          :name_of_applicant => 'Fred',
          :address_of_applicant => '1 Somewhere Place, Elsewhere',
          :name_of_applicants_supporter => 'Wilma',
          :contact_details_of_supporter => '92018218',
          :what_applicant_is_applying_for => 'Loadsamoney',
          :relevant_information => 'Addicted to it',
          :details_of_cost => 'Peanuts',
          :other_contributions => '£0',
          :amount_requested_from_extra_special_trust => '£999999999',
          :registered_care_allowance => '1',
          :supported_living_allowance => '0',
          :domiciliary_allowance => '0',
          :accept_terms_and_conditions => '1'}
      
        response.should be_redirect
      }.should change(Application, :count).by(1)
    end

    it "should reshow the new template with invalid data" do
      lambda {
        post :create, 'application' => {
          :name_of_applicant => 'Fred',
          :address_of_applicant => '',
          :name_of_applicants_supporter => 'Wilma',
          :contact_details_of_supporter => '92018218',
          :what_applicant_is_applying_for => 'Loadsamoney',
          :relevant_information => 'Addicted to it',
          :details_of_cost => 'Peanuts',
          :other_contributions => '£0',
          :amount_requested_from_extra_special_trust => '£999999999',
          :registered_care_allowance => '1',
          :supported_living_allowance => '0',
          :domiciliary_allowance => '0',
          :accept_terms_and_conditions => '1'}

      response.should be_success
      response.should render_template('new')
      }.should change(Application, :count).by(0)
    end

    it "should reshow the new template when T & Cs are not accepted." do
      lambda {
        post :create, 'application' => {
          :name_of_applicant => 'Fred',
          :address_of_applicant => 'Somewhere',
          :name_of_applicants_supporter => 'Wilma',
          :contact_details_of_supporter => '92018218',
          :what_applicant_is_applying_for => 'Loadsamoney',
          :relevant_information => 'Addicted to it',
          :details_of_cost => 'Peanuts',
          :other_contributions => '£0',
          :amount_requested_from_extra_special_trust => '£999999999',
          :registered_care_allowance => '1',
          :supported_living_allowance => '0',
          :domiciliary_allowance => '0',
          :accept_terms_and_conditions => '0'}

      response.should be_success
      response.should render_template('new')
      }.should change(Application, :count).by(0)
    end
  end
end
