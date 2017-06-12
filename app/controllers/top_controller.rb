class TopController < ApplicationController
  def index

  end

  def redirect
    redirect_to '/'
  end

  def ticket
    page = 1
    if params[:page].present?
      page = params[:page].to_i
    end
     @ticket = Ticket.find_by(number: params[:number])
     @jobs = Job.where(ticket_id: @ticket.id).page(page)
  end

  def job
     @job = Job.find_by(url: params[:id])
  end

  def mecab
    text = params[:word]

    nm = Natto::MeCab.new
    result = []
    nm.parse(text) do |n|
      result.push "#{n.surface}\t#{n.feature}"
    end

    render json: result
  end
end
