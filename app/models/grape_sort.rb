class GrapeSort < ActiveRecord::Base
  has_many :relationships
  has_many :wine_sorts, through: :relationships
  validates :name, :place_of_growth, :date_of_collection, presence: true
  validates :name, :place_of_growth, length: {in: 0..64}
  validates :name, uniqueness: {scope: [:place_of_growth ,:date_of_collection]}


  validate :date_of_collection_cannot_be_in_the_future

  def date_of_collection_cannot_be_in_the_future
    unless date_of_collection.nil?
      if date_of_collection > Date.today
        errors.add(:date_of_collection, "не может быть установленна будущим временем")
      end
    end
  end

end
