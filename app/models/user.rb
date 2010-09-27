
require 'digest/sha1'

class User < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :account
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  validates_uniqueness_of :account
  validates_confirmation_of :password

  attr_accessor :password_confirmation

  def validate
    if !password.blank?
      # As we don't always update the password we only check it when provided.
      errors.add(:password, 'must contain at least 5 characters.') if password.length < 5
      errors.add(:password, 'must contain at least 1 numeric character.') unless password =~ /\d/
    end
    errors.add_to_base('Missing password') if hashed_password.blank?
  end

  def password
    return @password
  end

  def password=(pwd)
    @password = pwd
    return if pwd.blank?

    create_new_salt()
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end

  def self.authenticate(account, password)
    user = self.find_by_account(account)
    if user != nil
      if user.hashed_password != encrypted_password(password, user.salt)
        user = nil
      end
    end
    return user
  end


  private

  def self.encrypted_password(password, salt)
    string_to_hash = "#{password}gfdfguoweoijk#{salt}"
    return Digest::SHA1.hexdigest(string_to_hash)
  end

  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
end

