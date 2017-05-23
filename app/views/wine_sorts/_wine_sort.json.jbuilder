json.extract! wine_sort, :id, :name, :type_of_wine, :color, :barrel_extract, :bottle_extract, :created_at, :updated_at
json.url wine_sort_url(wine_sort, format: :json)
