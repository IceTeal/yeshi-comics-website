class Customer < ApplicationRecord
	has_many :orders

	validates :first_name, presence: true

	def to_s
		"#{first_name} #{last_name} (ID:#{id})"
	end
end
