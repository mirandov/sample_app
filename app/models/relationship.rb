class Relationship < ActiveRecord::Base
  belongs_to :grape_sort
  belongs_to :wine_sort, inverse_of: :relationships

  validates :ratio, presence: true

  accepts_nested_attributes_for :grape_sort, allow_destroy: true

end
