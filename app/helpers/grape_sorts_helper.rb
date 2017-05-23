module GrapeSortsHelper
  def grape_sort_options()
    GrapeSort.all.pluck('id, place_of_growth, name, date_of_collection')
  end
end
