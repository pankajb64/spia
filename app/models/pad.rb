class Pad < ActiveRecord::Base

def self.get_base36_id(id)
	return id.to_s(36)
end

def self.get_id(base36_str)
	return base36_str.to_i(36)
end

def self.find_by_b36id(b36id)
	return Pad.find(self.get_id(b36id))
end

def self.create_success_hash(id)
	return {:message => "Data saved successfully"}
end

def self.create_error_hash
	return {:message => "Data could not be save due to an error", }
end		
		
end
