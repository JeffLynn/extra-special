class CreateApplications < ActiveRecord::Migration
  def self.up
    create_table :applications do |t|
      t.string :name_of_applicant
      t.string :address_of_applicant
      t.string :name_of_applicants_supporter
      t.string :contact_details_of_supporter
      t.text :what_applicant_is_applying_for
      t.text :relevant_information
      t.text :details_of_cost
      t.string :other_contributions, :limit => 100
      t.string :amount_requested_from_extra_special_trust, :limit => 100
      t.boolean :registered_care_allowance, :default => '0', :null => false
      t.boolean :supported_living_allowance, :default => '0', :null => false
      t.boolean :domiciliary_allowance, :default => '0', :null => false
      t.datetime :accepted_terms_and_conditions

      t.timestamps
    end
  end

  def self.down
    drop_table :applications
  end
end
