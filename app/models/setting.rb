class Setting < ApplicationRecord
  validates :course, presence: true
  validates :date_to, comparison: {greater_than: DateTime.current}
end
