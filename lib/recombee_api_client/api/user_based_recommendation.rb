#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Based on user's past interactions (purchases, ratings, etc.) with the items, recommends top-N items that are most likely to be of high value for a given user.
  #
  class UserBasedRecommendation < ApiRequest
    attr_reader :user_id, :count, :filter, :booster, :allow_nonexistent, :diversity, :min_relevance, :rotation_rate, :rotation_time
    attr_accessor :timeout
  
  ##
  # * *Required arguments*
  #   - +user_id+ -> ID of the user whose personalized recommendations are to be generated.
  #   - +count+ -> Number of items to be recommended (N for the top-N recommendation).
  #
  # * *Optional arguments (given as hash optional)*
  #   - +filter+ -> Boolean-returning [ReQL](https://docs.recombee.com/reql.html) expression which allows you to filter recommended items based on the values of their attributes.
  #   - +booster+ -> Number-returning [ReQL](https://docs.recombee.com/reql.html) expression which allows you to boost recommendation rate of some items based on the values of their attributes.
  #   - +allowNonexistent+ -> If the user does not exist in the database, returns a list of non-personalized recommendations instead of causing HTTP 404 error.
  #   - +diversity+ -> **Expert option** Real number from [0.0, 1.0] which determines how much mutually dissimilar should the recommended items be. The default value is 0.0, i.e., no diversification. Value 1.0 means maximal diversification.
  #
  #   - +minRelevance+ -> **Expert option** Specifies the threshold of how much relevant must the recommended items be to the user. Possible values one of: "low", "medium", "high". The default value is "low", meaning that the system attempts to recommend number of items equal to *count* at any cost. If there are not enough data (such as interactions or item properties), this may even lead to bestseller-based recommendations to be appended to reach the full *count*. This behavior may be suppressed by using "medium" or "high" values. In such case, the system only recommends items of at least the requested qualit, and may return less than *count* items when there is not enough data to fulfill it.
  #
  #   - +rotationRate+ -> **Expert option** If your users browse the system in real-time, it may easily happen that you wish to offer them recommendations multiple times. Here comes the question: how much should the recommendations change? Should they remain the same, or should they rotate? Recombee API allows you to control this per-request in backward fashion. You may penalize an item for being recommended in the near past. For the specific user, `rotationRate=1` means maximal rotation, `rotationRate=0` means absolutely no rotation. You may also use, for example `rotationRate=0.2` for only slight rotation of recommended items.
  #
  #   - +rotationTime+ -> **Expert option** Taking *rotationRate* into account, specifies how long time it takes to an item to fully recover from the penalization. By example, `rotationTime=7200.0` means that items recommended more than 2 hours ago are definitely not penalized anymore. Currently, the penalization is linear, so for `rotationTime=7200.0`, an item is still penalized by `0.5` to the user after 1 hour. |
  #
  #
    def initialize(user_id, count, optional = {})
      @user_id = user_id
      @count = count
      @filter = optional['filter']
      @booster = optional['booster']
      @allow_nonexistent = optional['allowNonexistent']
      @diversity = optional['diversity']
      @min_relevance = optional['minRelevance']
      @rotation_rate = optional['rotationRate']
      @rotation_time = optional['rotationTime']
      @optional = optional
      @timeout = 3000
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["filter","booster","allowNonexistent","diversity","minRelevance","rotationRate","rotationTime"].include? par
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
  
    # Values of query path parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      params = {}
      params['count'] = @count
      params['filter'] = @optional['filter'] if @optional['filter']
      params['booster'] = @optional['booster'] if @optional['booster']
      params['allowNonexistent'] = @optional['allowNonexistent'] if @optional['allowNonexistent']
      params['diversity'] = @optional['diversity'] if @optional['diversity']
      params['minRelevance'] = @optional['minRelevance'] if @optional['minRelevance']
      params['rotationRate'] = @optional['rotationRate'] if @optional['rotationRate']
      params['rotationTime'] = @optional['rotationTime'] if @optional['rotationTime']
      params
    end
  
    # Relative path to the endpoint
    def basic_path
      "/{databaseId}/users/#{@user_id}/recomms/"
    end
  
    # Relative path to the endpoint including query parameters
    def path
      p = "/{databaseId}/users/#{@user_id}/recomms/?count=#{@count}"
      if @optional.include? 'filter'
        p += (p.include? '?') ? '&' : '?'
        p += "filter=#{@optional['filter']}"
      end
      if @optional.include? 'booster'
        p += (p.include? '?') ? '&' : '?'
        p += "booster=#{@optional['booster']}"
      end
      if @optional.include? 'allowNonexistent'
        p += (p.include? '?') ? '&' : '?'
        p += "allowNonexistent=#{@optional['allowNonexistent']}"
      end
      if @optional.include? 'diversity'
        p += (p.include? '?') ? '&' : '?'
        p += "diversity=#{@optional['diversity']}"
      end
      if @optional.include? 'minRelevance'
        p += (p.include? '?') ? '&' : '?'
        p += "minRelevance=#{@optional['minRelevance']}"
      end
      if @optional.include? 'rotationRate'
        p += (p.include? '?') ? '&' : '?'
        p += "rotationRate=#{@optional['rotationRate']}"
      end
      if @optional.include? 'rotationTime'
        p += (p.include? '?') ? '&' : '?'
        p += "rotationTime=#{@optional['rotationTime']}"
      end
      p
    end
  end
end