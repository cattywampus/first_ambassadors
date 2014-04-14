class Ambassador < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :trackable, :confirmable

  has_many :authentications, as: :authenticatable

  validates :email, presence: true, uniqueness: true, format: { with: Devise.email_regexp }
  validate :requires_full_name
  validates :phone_number, presence: true, A

  before_validate :clean_up_phone_number

  private

  def clean_up_phone_number
    phone_number.gsub! /[^0-9x+]/, '' if phone_number.present?
  end

  def requires_full_name
    fields = [:first_name, :last_name]
    errors.add_on_blank(fields)
    validates_presence_of_group :name, fields do |missing|
      humanized_fields = missing_map { |f| f.to_s.humanize.downcase }.join(', ')
      "is missing #{humanized_fields}"
    end
  end
end
