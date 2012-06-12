#knife role modify -- Knife plugin to modify role
#Copyright (C) 2012 James Keener
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.
require 'jsonpath'

class RoleModify < Chef::Knife
	banner "knife role modify ROLE JSONPath VALUE"
	deps { require 'chef/search/query' }

	def run
		if ARGV.length < 5
			ui.err "Must supply a role, path, and value"
			return
		end
		Chef::Search::Query.new.search('role', "name:#{ARGV[2]}") do |r|
			r = Chef::Role.json_create JsonPath.for(r.to_json).gsub(ARGV[3]){|v| ARGV[4] }.to_hash
			r.save
		end
	end
end
