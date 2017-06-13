class TopController < ApplicationController
  protect_from_forgery except: :mecab

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
    katakana = ""
    nm.parse(text) do |n|
      yomi = n.feature.split(",")[-2]
      if yomi == "*"
        yomi = n.surface
      end
      katakana += yomi
    end

    hiragana = katakana.tr('ァ-ンーヴ', 'ぁ-んーゔ')

    render json: { hiragana: hiragana }, callback: "jsonCallback"
  end
end
