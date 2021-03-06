class Mission < ApplicationRecord
  geocoded_by :place
  after_validation :geocode, if: :will_save_change_to_place?

  belongs_to :user
  has_many :participations, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :reward, presence: true, numericality: { only_integer: true }
  validates :place, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number_of_participants, presence: true
end
