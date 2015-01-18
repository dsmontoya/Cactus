module ApplicationHelper

	def human_readable_boolean(boolean)
		boolean ? "Yes" : "No"
	end

	def human_readable_status(status)
		status = ['Undecided', 'Accepted', 'Rejected', 'Waitlisted', 'Cancelled']
	end

end
