#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Gets a list of IDs of items currently present in the catalog.
  class ListItems < ApiRequest
    attr_reader :filter
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  #
  # * *Optional arguments (given as hash optional)*
  #   - +filter+ -> Boolean-returning [ReQL](https://docs.recombee.com/reql.html) expression, which allows you to filter items to be listed. Only the items for which the expression is *true* will be returned.
  #
    def initialize(optional = {})
      @filter = optional['filter']
      @optional = optional
      @timeout = 30000
      @ensure_https = false
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["filter"].include? par
      end
    end
  
    # HTTP method
    def method
      :get
    end
  
    # Values of body parameters as a Hash
    def body_parameters
      p = Hash.new
      p
    end
  
    # Values of query parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      params = {}
      params['filter'] = @optional['filter'] if @optional['filter']
      params
    end
  
    # Relative path to the endpoint
    def path
      "/{databaseId}/items/list/"
    end
  end
end
