require 'date'

class GistsController < ApplicationController
	include GistsHelper

	def index
		gists = HTTParty.get(gists_host + "/gists/public?per_page=100", :verify => false).parsed_response
		@gists = format_gists(gists)
	end

	def show
		@gist = gists = HTTParty.get(gists_host + "/gists/" + params["id"], :verify => false).parsed_response
	end
end
