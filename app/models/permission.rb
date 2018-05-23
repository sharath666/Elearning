class Permission < ApplicationRecord
	belongs_to :role
	belongs_to :model_list
end
