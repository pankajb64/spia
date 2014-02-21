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
		
  end
  
  def save
  end
  
  def delete
  end
end
