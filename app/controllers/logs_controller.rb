class LogsController < ApplicationController
  
  def index
  redirect_to :action => 'show'
  end

  def show
    @active = (params[:id] || "syslog")
    puts @active
    lm = LogMentor.new Kallisto::BASEOS
    @data = lm.poll @active.gsub("_",".")
    render :action => 'show'
  end
end
