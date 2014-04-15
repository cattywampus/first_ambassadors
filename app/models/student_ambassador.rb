class StudentAmbassador < ActiveRecord::Base
  # Include devise modules
  devise :trackable, :confirmable

  belongs_to :event
  has_many :available_shifts

  accepts_nested_attributes_for :available_shifts, reject_if: :all_blank, allow_destroy: true

  validates :email, presence: true, uniqueness: true, format: { with: Devise.email_regexp, allow_blank: true }
  validate :requires_full_name
  validates :phone_number, presence: true

  before_validation :clean_up_phone_number

  private

  def clean_up_phone_number
    phone_number.gsub! /[^0-9x+]/, '' if phone_number.present?
  end

  def requires_full_name
    fields = [:first_name, :last_name]
    errors.add_on_blank(fields)
    validates_presence_of_group :name, fields do |missing|
      humanized_fields = missing.map { |f| f.to_s.humanize.downcase }.join(', ')
      "is missing #{humanized_fields}"
    end
  end

  def validates_presence_of_group(name, fields)
    missing_fields = errors.keys & fields
    if missing_fields.present?
      errors.add(name, block_given? ? yield(missing_fields) : "is incomplete")
      false
    end
    true
  end
end
