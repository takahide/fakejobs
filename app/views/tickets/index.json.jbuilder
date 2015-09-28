json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :number, :title
  json.url ticket_url(ticket, format: :json)
end
