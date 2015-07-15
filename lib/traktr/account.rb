module Traktr
  class Account < Endpoint
    def settings
      response = self.class.post("/" + File.join("settings", @client.api_key), body: @auth.to_json, headers: { 'Content-Type' => 'application/json', 'trakt-api-key' => File.join("settings", @client.api_key), 'trakt-api-version' => 2})
      parse_response(response)
    end

    def test
      response = self.class.post("/" + File.join("settings", @client.api_key), body: @auth.to_json, headers: { 'Content-Type' => 'application/json', 'trakt-api-key' => File.join("settings", @client.api_key), 'trakt-api-version' => 2})
      parse_response(response)
    end
  end
end
