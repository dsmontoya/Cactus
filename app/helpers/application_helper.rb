module ApplicationHelper

	def human_readable_boolean(boolean)
		boolean ? "Yes" : "No"
	end

	def human_readable_status(status)
		status_options = ['Undecided', 'Accepted', 'Rejected', 'Waitlisted', 'Cancelled']
		return status_options[status]
	end

end
