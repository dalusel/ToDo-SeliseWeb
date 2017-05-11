class MyTask < ApplicationRecord
	validates :task, :tasktime,:meridiem, presence: true
end
