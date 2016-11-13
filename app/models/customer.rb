class Customer < ApplicationRecord
	has_many :orders

	validates :first_name, presence: true
end
