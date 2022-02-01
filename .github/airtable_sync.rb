require 'uri'
require 'cgi'
require 'net/http'
require 'json'
require 'time'

GITHUB_BASE_URL = "https://github.com"
AIRTABLE_BASE_URL = 'https://api.airtable.com/v0/app894pLWQm9EIzpy'
CHALLENGE = "chitter"

repo_name = ARGV[0]
pr_url = "#{GITHUB_BASE_URL}/#{repo_name}/pull/#{ARGV[1]}"

puts "Adding review record to Airtable for PR #{pr_url}."

# def retrieve_apprentice(github_username)
#   uri = URI(AIRTABLE_BASE_URL + '/Cohorts?filterByFormula=%28%7BGitHub%20Profile%7D%20%3D%20%27' + github_username + '%27%29')
#   req = Net::HTTP::Get.new(uri)
#   req['Authorization'] = 'Bearer ' + ENV['AIRTABLE_API_KEY']
#   res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
#     http.request(req)
#   end
#   raise 'failed to retrieve apprentice' unless res.is_a?(Net::HTTPSuccess)

#   data = JSON.parse(res.body)
#   data['records'].first
# end

# def build_record(apprentice, solution_url)
#   {
#     'fields' => {
#       'apprentice' => apprentice,
#       'challenge' => challenge,
#       'solution_url' => CHALLENGE
#     }
#   }
# end

# # tasks = { :name, :start_time, :duration_in_sec, :external_owner }
# def create_review(github_username, pr)
#   apprentice = retrieve_apprentice(github_username)
#   if apprentice.nil?
#     puts "Failed to resolve apprentice name from github username, proceeding without."
#     apprentice = ""
#   end

#   uri = URI(AIRTABLE_BASE_URL + '/end_of_mod_challenges')
#   req = Net::HTTP::Post.new(uri)
#   req['Authorization'] = 'Bearer ' + ENV['AIRTABLE_API_KEY']
#   req['Content-Type'] = 'application/json'
#   req.body = {
#     'records' => [ build_record(apprentice, pr) ]
#   }.to_json

#   res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
#     http.request(req)
#   end

#   raise "failed to create record: #{pr} - #{res.body}" unless res.is_a?(Net::HTTPSuccess)

#   puts "Created end of module review for Apprentice #{github_username} for PR #{pr}"

#   JSON.parse(res.body)
# end