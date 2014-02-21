require 'active_support'

class PadController < ApplicationController
  def index
  end
  
  def new
	@pad = Pad.create!
	@pad.base36_id = Pad.get_base36_id(pad)
	@pad.save!
	redirect_to pad_get_path(:b36id => @pad.base_36_id), notice: "New Pad Created"
  end
  
  def edit
	id = Pad.get_id(params[:b36id])
	@pad = Pad.find(id)

	if @pad.nil? 
		render :invalid_pad
  end
  
  def save
	j = ActiveSupport::JSON
	@data = j.decode(params[:data], :symbolize_keys => true)
	@pad = Pad.find_by_b36id(@data[:key])
	if not @pad.nil? and @data.has_key?(:value)
		@pad.contents = data[:value]
		@pad.save!
		flash[:notice] = "Data saved successfully."
		render :json, => j.encode(Pad.create_successs_hash(@pad.id))
	else
		render :json => j.encode(Pad.create_error_hash)
	end
  end
  
  def delete
	id = Pad.get_id[:b36id)
	@pad = Pad.find(id)
	
	if @pad.nil?
		return :invalid_pad
	else
		@pad.delete!
		flash[:notice] = "Pad deleted successfully."
		redirect_to root_path	
  end
end
