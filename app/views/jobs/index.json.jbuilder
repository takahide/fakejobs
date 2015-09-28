json.array!(@jobs) do |job|
  json.extract! job, :id, :url, :ref_id, :title, :location, :category, :ticket_id
  json.url job_url(job, format: :json)
end
