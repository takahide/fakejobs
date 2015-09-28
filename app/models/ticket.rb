class Ticket < ActiveRecord::Base
  has_many :jobs
end
