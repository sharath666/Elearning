class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         before_validation :assign_def_role
         has_many :comments
         belongs_to :role
         has_many :lecture_counts
         def role?(role)
          self.role.name.include?(role)
    	end



         def assign_def_role
          self.is_present = true
         	self.role_id = Role.last.id
         end
end
