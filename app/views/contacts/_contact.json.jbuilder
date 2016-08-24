json.extract! contact, :id, :contacttype, :company, :department, :person, :duration, :notes, :created_at, :updated_at
json.url contact_url(contact, format: :json)