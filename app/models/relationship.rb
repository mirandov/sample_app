class Relationship < ActiveRecord::Base
  belongs_to :grape_sort
  belongs_to :wine_sort, inverse_of: :relationships

  validates :ratio, :grape_sort_id,  presence: true

end
