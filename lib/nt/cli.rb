require "thor"

module Nt
  class CLI < Thor
    desc 'version', 'version'
    def version
      puts Nt.gem_version
    end
  end
end
