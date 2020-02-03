require 'json'
require 'net/http'

require "thor"

BASE_URI = 'https://note.com/api/v2'

module Nt
  class CLI < Thor
    desc 'version', 'version'
    def version
      puts Nt.gem_version
    end

    desc 'categories', 'show categories'
    def categories
      res = Net::HTTP.get(URI("#{BASE_URI}/categories"))
      puts JSON.parse(res)["data"]["categories"].to_json
    end

    desc 'notes', 'show notes'
    def notes
      res = Net::HTTP.get(URI("#{BASE_URI}/notes"))
      puts JSON.parse(res)["data"]["contents"].to_json
    end

    desc 'users', 'show users'
    def users
      res = Net::HTTP.get(URI("#{BASE_URI}/users"))
      puts JSON.parse(res)["data"]["contents"].to_json
    end

    desc 'search', 'search notes'
    def search(query)
      res = Net::HTTP.get(URI("#{BASE_URI}/searches?q=#{query}"))
      puts JSON.parse(res)["data"]["notes"].to_json
    end
  end
end
