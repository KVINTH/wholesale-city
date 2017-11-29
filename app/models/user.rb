class User < ApplicationRecord
  has_secure_password
  belongs_to :province
  has_many :order


  def self.current_user
    Thread.current[:user]
  end

  def self.current_user=(user)
    Thread.current[:user] = user
  end
end
