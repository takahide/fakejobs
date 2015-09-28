class TopController < ApplicationController
  def index

  end
  def ticket
     @ticket = Ticket.find_by(number: params[:number])
  end
end
