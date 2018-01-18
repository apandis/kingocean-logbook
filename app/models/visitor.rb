class Visitor < ApplicationRecord
  
  validates :name, :company, :purpose, presence: true
  
  scope :today, -> { where(:created_at => Time.now.beginning_of_day..Time.now.end_of_day) }
  scope :yesterday, -> { where(:created_at => 1.days.ago.beginning_of_day..1.days.ago.end_of_day) }
  scope :this_week, -> { where(:created_at => Time.now.beginning_of_week..Time.now.end_of_week) }
  scope :this_month, -> { where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month) }
  scope :this_year, -> { where(:created_at => Time.now.beginning_of_year..Time.now.end_of_year) }
  scope :last_hour, -> { where(:created_at => 1.hour.ago..Time.now) }
  scope :last_week, -> { where(:created_at => 1.weeks.ago.beginning_of_week..1.weeks.ago.end_of_week) }
  scope :last_month, -> { where(:created_at => 1.months.ago.beginning_of_month..1.months.ago.end_of_month) }
  scope :last_year, -> { where(:created_at => 1.years.ago.beginning_of_year..1.years.ago.end_of_year) }
  
end
