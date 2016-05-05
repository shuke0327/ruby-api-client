#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Inserts an existing item/group into group of given `groupId`.
  #
  class InsertToGroup < ApiRequest
    attr_reader :group_id, :item_type, :item_id, :cascade_create
    attr_accessor :timeout
  
  ##
  # * *Required arguments*
  #   - +group_id+ -> ID of the group to be inserted into.
  #   - +item_type+ -> `item` iff the regular item from the catalog is to be inserted, `group` iff group is inserted as the item.
  #   - +item_id+ -> ID of the item iff `itemType` is `item`. ID of the group iff `itemType` is `group`.
  #
  # * *Optional arguments (given as hash optional)*
  #   - +cascadeCreate+ -> Indicates that any non-existing entity specified within the request should be created (as is corresponding PUT requests were invoked). This concerns both the `groupId` and the `groupId`. If `cascadeCreate` is set true, the behavior also depends on the `itemType`. Either items or group may be created if not present in the database.
  #
    def initialize(group_id, item_type, item_id, optional = {})
      @group_id = group_id
      @item_type = item_type
      @item_id = item_id
      @cascade_create = optional['cascadeCreate']
      @optional = optional
      @timeout = 1000
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["cascadeCreate"].include? par
      end
    end
  
    # HTTP method
    def method
      :post
    end
  
    # Values of body parameters as a Hash
    def body_parameters
      p = Hash.new
      p['itemType'] = @item_type
      p['itemId'] = @item_id
      p['cascadeCreate'] = @optional['cascadeCreate'] if @optional['cascadeCreate']
      p
    end
  
    # Values of query path parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      params = {}
      params
    end
  
    # Relative path to the endpoint
    def basic_path
      "/{databaseId}/groups/#{@group_id}/items/"
    end
  
    # Relative path to the endpoint including query parameters
    def path
      p = "/{databaseId}/groups/#{@group_id}/items/"
      p
    end
  end
end