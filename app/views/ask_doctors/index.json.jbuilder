json.array!(@ask_doctors) do |ask_doctor|
  json.extract! ask_doctor, :id, :name, :title, :description
  json.url ask_doctor_url(ask_doctor, format: :json)
end
