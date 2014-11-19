class User < ActiveRecord::Base
  has_many :user_roles, :dependent => :destroy
  has_many :roles, through: :user_roles
  validates :first_name, presence: true, length: { in: 3..20 }
  validates :last_name, presence: true, length: { in: 3..20 }
  validates :birth_date, presence: true
  validates :email, presence: true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
  validate :has_role
  
  private 
  
  def has_role
    unless roles.detect {|d| !d.marked_for_destruction? }
      errors.add(:roles, "must select least one")
    end
  end  
end
