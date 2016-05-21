json.array!(@doctorlocations) do |doctorlocation|
  json.extract! doctorlocation, :id, :doctorname, :address, :latitude, :longitude
  json.url doctorlocation_url(doctorlocation, format: :json)
end
