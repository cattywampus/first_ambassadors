class AvailableShift < ActiveRecord::Base
  belongs_to :student_ambassador

  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validate :dates_are_in_order
  validate :shift_is_at_least_half_hour

  private

  def dates_are_in_order
    return true if starts_at.blank? || ends_at.blank?

    if starts_at >= ends_at
      errors.add(:base, "Start date/time must be less than end date/time")
      false
    else
      true
    end
  end

  def shift_is_at_least_half_hour
    return true if starts_at.blank? || ends_at.blank?
    
    minutes = (ends_at - starts_at) / 60
    if minutes < 30
      errors.add(:base, "Shift must be at least 30 minutes long")
      false
    else
      true
    end
  end

end
