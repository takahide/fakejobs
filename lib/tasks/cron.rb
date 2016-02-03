class Cron
  def self.watson120
    for i in 1..100
      Job.where(ref_id: i).first_or_create do |j|
        j.url = "#{i}"
        j.title = "QA Manager #{i}"
        j.category = "QA Manager for Team #{i}"
        j.location = "Ebisu, Tokyo"
        j.ticket_id = 2
      end
    end
  end
end
