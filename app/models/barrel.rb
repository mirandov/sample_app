class Barrel < ActiveRecord::Base
  belongs_to :wine_sort
  accepts_nested_attributes_for :wine_sort, allow_destroy: true

  validates :location, :date_of_manufacture, :amount, :is_empty, :date_of_completion,  presence: true
  validates :is_empty, inclusion: {in: ['Пустая','Не пустая']}
  validates :amount, numericality: {greater_than_or_equal_to: 0 }


  validate :date_of_manufacture_cannot_be_in_the_future, :date_of_completion_cannot_be_in_the_future
  validate :date_of_manufacture_cannot_be_more_than_date_of_completion

  def date_of_manufacture_cannot_be_in_the_future
    if date_of_manufacture > Date.today
      errors.add(:date_of_manufacture, "не может быть установленна будущим временем")
    end
  end

  def date_of_completion_cannot_be_in_the_future
    if date_of_completion > Date.today
      errors.add(:date_of_completion, "не может быть установленна будущим временем")
    end
  end

  def date_of_manufacture_cannot_be_more_than_date_of_completion
    if date_of_completion < date_of_manufacture
      errors.add(:date_of_completion, "не может быть раньше даты изготовления")
    end
  end

  def self.search(params)
     result = Barrel.includes(:wine_sort => {:relationships => :grape_sort}).references(:wine_sort => {:relationships => :grape_sort})
     if params['location'].present?
       result = result.where(location: params['location'])
     end
     if params['date_of_manufacture'].present?
       result = result.where(date_of_manufacture: params['date_of_manufacture'])
     end
     if params['date_of_completion'].present?
       result = result.where(date_of_completion: params['date_of_completion'])
     end
     if params['amount'].present?
       result = result.where(amount: params['amount'])
     end
     if params['is_empty'].present?
       result = result.where(is_empty: params['is_empty'])
     end
     if params['type_of_wine'].present?
       result = result.where(wine_sorts: {type_of_wine: params['type_of_wine']})
     end
     if params['wine_name'].present?
       result = result.where(wine_sorts: {name: params['wine_name']})
     end
     if params['color'].present?
       result = result.where(wine_sorts: {color: params['color']})
     end
     if params['barrel_extract'].present?
       result = result.where(wine_sorts: {barrel_extract: params['barrel_extract']})
     end
     if params['bottle_extract'].present?
       result = result.where(wine_sorts: {bottle_extract: params['bottle_extract']})
     end
     if params['ratio'].present?
       result = result.where(relationships: {ratio: params['ratio']})
     end
     if params['grape_name'].present?
       result = result.where(grape_sorts: {name: params['grape_name']})
     end
     if params['place_of_growth'].present?
       result = result.where(grape_sorts: {place_of_growth: params['place_of_growth']})
     end
     if params['date_of_collection'].present?
       result = result.where(grape_sorts: {date_of_collection: params['date_of_collection']})
     end


     result.all
  end

  # def data=(value)
  #  self[:data] = {data: value}
  # end
end
