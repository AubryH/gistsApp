class GistsController < ApplicationController
	def index
		gists = HTTParty.get("https://api.github.com/gists/public?per_page=100", :verify => false).parsed_response
		@gists = Array.new
		gists.each do |gist|
			formated_gist = Hash.new

			formated_gist["owner"] = gist["owner"].nil? ? "anonymous" : gist["owner"]["login"]
			formated_gist["description"] = gist["description"].to_s == '' ? "no description" : gist["description"]
			formated_gist["updated_at"] = gist["updated_at"]
			formated_gist["number_of_files"] = gist["files"].nil? ? "0" : gist["files"].length
			formated_gist["number_of_comments"] = gist["comments"].nil? ? "0" : gist["comments"]
			@gists.push formated_gist
		end
	end
end
