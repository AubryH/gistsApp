require 'date'

class GistsController < ApplicationController
	include GistsHelper

	def index
		gists = HTTParty.get("https://api.github.com/gists/public?per_page=100", :verify => false).parsed_response
		@gists = Array.new
		gists.each do |gist|
			@gists.push format_gist(gist)
		end
	end
end
