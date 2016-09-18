module GistsHelper
	def format_gist(gist)
		formated_gist = Hash.new

		formated_gist["owner"] = gist["owner"].nil? ? "anonymous" : gist["owner"]["login"]
		formated_gist["description"] = gist["description"].to_s == '' ? "no description" : gist["description"]
		formated_gist["created_at"] = _format_date(gist["created_at"])
		formated_gist["updated_at"] = _format_date(gist["updated_at"])
		formated_gist["number_of_files"] = gist["files"].nil? ? "0" : gist["files"].length
		formated_gist["number_of_comments"] = gist["comments"].nil? ? "0" : gist["comments"]

		return formated_gist
	end

	private
	def _format_date(datetime_string)
		DateTime.parse(datetime_string).strftime("%e %b %Y %T")
	end
end
