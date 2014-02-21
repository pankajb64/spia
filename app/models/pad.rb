class Pad < ActiveRecord::Base

def self.get_base36_id(pad)
	return pad.id.to_s(36)
end

def self.get_id(base36_str)
	return base36_str.to_i(36)
end

def self.find_by_b36id(b36id)
	return Pad.find(self.get_id(b36id))
end
