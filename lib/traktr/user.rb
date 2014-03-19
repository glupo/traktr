module Traktr
  class User
    include HTTParty
    base_uri File.join(Traktr.base_uri, "user")

    def initialize(client)
      @client = client
      @auth = { :username => @client.username, :password => @client.password }
    end

    def calendar
      @calendar ||= Traktr::User::Calendar.new(@client)
    end

    def lastactivity(user = @client.username)
      response = self.class.get("/" + File.join("lastactivity.json", @client.api_key, user), :basic_auth => @auth)
      raise ResponseError.new(response) if response.code != 200

      Mash.new(response.parsed_response)
    end

    def list(slug, user = @client.username)
      response = self.class.get("/" + File.join("list.json", @client.api_key, user, slug), :basic_auth => @auth)
      raise ResponseError.new(response) if response.code != 200

      Mash.new(response.parsed_response)
    end

    def lists(user = @client.username)
      response = self.class.get("/" + File.join("lists.json", @client.api_key, user), :basic_auth => @auth)
      raise ResponseError.new(response) if response.code != 200

      response.parsed_response.collect do |item|
        Mash.new(item)
      end
    end

    def profile(user = @client.username)
      response = self.class.get("/" + File.join("profile.json", @client.api_key, user), :basic_auth => @auth)
      raise ResponseError.new(response) if response.code != 200

      Mash.new(response.parsed_response)
    end

    def watching(user = @client.username)
      response = self.class.get("/" + File.join("watching.json", @client.api_key, user), :basic_auth => @auth)
      raise ResponseError.new(response) if response.code != 200

      response.parsed_response.collect do |item|
        Mash.new(item)
      end
    end
  end
end
