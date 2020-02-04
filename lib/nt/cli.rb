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

    desc 'hashtags', 'show hashtags'
    def hashtags
      res = Net::HTTP.get(URI("#{BASE_URI}/hashtags"))
      puts JSON.parse(res)["data"]["contents"].to_json
    end

    desc 'notes', 'show notes'
    def notes
      res = Net::HTTP.get(URI("#{BASE_URI}/notes"))
      puts JSON.parse(res)["data"]["contents"].to_json
    end

    desc 'open', 'open a note'
    def open(urlname, key)
      url = "https://note.com/#{urlname}/n/#{key}"
      puts "opend: #{url}"
      system("open #{url}")
    end

    desc 'users', 'show users'
    options :size => :numeric
    def users
      if options.empty?
        res = Net::HTTP.get(URI("#{BASE_URI}/users"))
      else
        res = Net::HTTP.get(URI("#{BASE_URI}/users?size=#{options[:size]}"))
      end
      puts JSON.parse(res)["data"]["contents"].to_json
    end

    desc 'search', 'search notes'
    def search(query)
      res = Net::HTTP.get(URI("#{BASE_URI}/searches?q=#{query}"))
      puts JSON.parse(res)["data"]["notes"].to_json
    end
  end
end
