class LogsController < ApplicationController
  
  def index
  redirect_to :action => 'show'
  end

  def show
    @active = (params[:id] || "syslog")
    lm = LogMentor.new Kallisto::BASEOS
    @data = lm.prettylines @active.gsub("_",".")
    render :action => 'show'
  end
end
