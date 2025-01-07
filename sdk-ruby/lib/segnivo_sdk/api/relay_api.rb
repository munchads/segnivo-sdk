=begin
#Segnivo Developer API

#**API Version**: 1.7  **Date**: 9th July, 2024  ## 📄 Getting Started  This API is based on the REST API architecture, allowing the user to easily manage their data with this resource-based approach.  Every API call is established on which specific request type (GET, POST, PUT, DELETE) will be used.  The API must not be abused and should be used within acceptable limits.  To start using this API, you will need not create or access an existing Segnivo account to obtain your API key ([retrievable from your account settings](https://messaging.segnivo.com/account/api)).  - You must use a valid API Key to send requests to the API endpoints.      - The API only responds to HTTPS-secured communications. Any requests sent via HTTP return an HTTP 301 redirect to the corresponding HTTPS resources.      - The API returns request responses in JSON format. When an API request returns an error, it is sent in the JSON response as an error key or with details in the message key.       ### 🔖 **Need some help?**  In case you have questions or need clarity with interacting with some endpoints feel free to create a support ticket on your account or you can send an email ([<i>developers@segnivo.com</i>](https://mailto:developers@segnivo.com)) directly and we would be happy to help.  ---  ## Authentication  As noted earlier, this API uses API keys for authentication. You can generate a Segnivo API key in the [API](https://messaging.segnivo.com/account/api) section of your account settings.  You must include an API key in each request to this API with the `X-API-KEY` request header.  ### Authentication error response  If an API key is missing, malformed, or invalid, you will receive an HTTP 401 Unauthorized response code.  ## Rate and usage limits  API access rate limits apply on a per-API endpoint basis in unit time. The limit is 10k requests per hour for most endpoints and 1m requests per hour for transactional/relay email-sending endpoints. Also, depending on your plan, you may have usage limits. If you exceed either limit, your request will return an HTTP 429 Too Many Requests status code or HTTP 403 if sending credits have been exhausted.  ### 503 response  An HTTP `503` response from our servers may indicate there is an unexpected spike in API access traffic, while this rarely happens, we ensure the server is usually operational within the next two to five minutes. If the outage persists or you receive any other form of an HTTP `5XX` error, contact support ([<i>developers@segnivo.com</i>](https://mailto:developers@segnivo.com)).  ### Request headers  To make a successful request, some or all of the following headers must be passed with the request.  | **Header** | **Description** | | --- | --- | | Content-Type | Required and should be `application/json` in most cases. | | Accept | Required and should be `application/json` in most cases | | Content-Length | Required for `POST`, `PATCH`, and `PUT` requests containing a request body. The value must be the number of bytes rather than the number of characters in the request body. | | X-API-KEY | Required. Specifies the API key used for authorization. |  ##### 🔖 Note with example requests and code snippets  If/when you use the code snippets used as example requests, remember to calculate and add the `Content-Length` header. Some request libraries, frameworks, and tools automatically add this header for you while a few do not. Kindly check and ensure yours does or add it yourself.

The version of the OpenAPI document: 1.0.0

Generated by: https://openapi-generator.tech
Generator version: 7.10.0

=end

require 'cgi'

module SegnivoSDK
  class RelayApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Fetch Emails
    # The `/emails` endpoint lets you fetch one or more marketing/transactional email(s) from your `Segnivo Messaging` account and it accepts two **optional** parameters.  - The `id` string of the email to fetch provided as a path variable      - The `limit` on the number of records to fetch (if email id is not provided) as a query string parameter. This value defaults to 100 if not provided.
    # @param id [String] The ID of the email to fetch
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit The number of records to fetch
    # @return [Object]
    def relay_emails_id_get(id, opts = {})
      data, _status_code, _headers = relay_emails_id_get_with_http_info(id, opts)
      data
    end

    # Fetch Emails
    # The &#x60;/emails&#x60; endpoint lets you fetch one or more marketing/transactional email(s) from your &#x60;Segnivo Messaging&#x60; account and it accepts two **optional** parameters.  - The &#x60;id&#x60; string of the email to fetch provided as a path variable      - The &#x60;limit&#x60; on the number of records to fetch (if email id is not provided) as a query string parameter. This value defaults to 100 if not provided.
    # @param id [String] The ID of the email to fetch
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit The number of records to fetch
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def relay_emails_id_get_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RelayApi.relay_emails_id_get ...'
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling RelayApi.relay_emails_id_get"
      end
      # resource path
      local_var_path = '/relay/emails/{id}'.sub('{' + 'id' + '}', CGI.escape(id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['apiKeyAuth']

      new_options = opts.merge(
        :operation => :"RelayApi.relay_emails_id_get",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: RelayApi#relay_emails_id_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Send a Raw Email Message
    # The `/raw` endpoint lets you send marketing and transactional emails from your `Segnivo Messaging` account by passing a raw RFC822 message to the `message` attribute in the request body.  The following parameters should be passed as a form data to the endpoint  - **message** - A raw RFC822 message      - **sign_dkim** (optional, defaults to `true`) - A boolean value on if a DKIM signature should be included in this message      - **track_click** (optional, defaults to `true`) - A boolean value on if email clicks should be tracked. If `true` links in the email will be rewritten to enable tracking      - **track_open** (optional, defaults to `true`) - A boolean value on if the email opens should be tracked      - **is_transactional** (optional, defaults to `false`) - A boolean value to flag this email as a transactional email
    # @param [Hash] opts the optional parameters
    # @option opts [String] :message 
    # @option opts [Boolean] :is_transactional 
    # @option opts [Boolean] :track_click 
    # @option opts [Boolean] :track_open 
    # @option opts [Boolean] :sign_dkim 
    # @return [Object]
    def relay_raw_post(opts = {})
      data, _status_code, _headers = relay_raw_post_with_http_info(opts)
      data
    end

    # Send a Raw Email Message
    # The &#x60;/raw&#x60; endpoint lets you send marketing and transactional emails from your &#x60;Segnivo Messaging&#x60; account by passing a raw RFC822 message to the &#x60;message&#x60; attribute in the request body.  The following parameters should be passed as a form data to the endpoint  - **message** - A raw RFC822 message      - **sign_dkim** (optional, defaults to &#x60;true&#x60;) - A boolean value on if a DKIM signature should be included in this message      - **track_click** (optional, defaults to &#x60;true&#x60;) - A boolean value on if email clicks should be tracked. If &#x60;true&#x60; links in the email will be rewritten to enable tracking      - **track_open** (optional, defaults to &#x60;true&#x60;) - A boolean value on if the email opens should be tracked      - **is_transactional** (optional, defaults to &#x60;false&#x60;) - A boolean value to flag this email as a transactional email
    # @param [Hash] opts the optional parameters
    # @option opts [String] :message 
    # @option opts [Boolean] :is_transactional 
    # @option opts [Boolean] :track_click 
    # @option opts [Boolean] :track_open 
    # @option opts [Boolean] :sign_dkim 
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def relay_raw_post_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RelayApi.relay_raw_post ...'
      end
      # resource path
      local_var_path = '/relay/raw'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['multipart/form-data'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}
      form_params['message'] = opts[:'message'] if !opts[:'message'].nil?
      form_params['is_transactional'] = opts[:'is_transactional'] if !opts[:'is_transactional'].nil?
      form_params['track_click'] = opts[:'track_click'] if !opts[:'track_click'].nil?
      form_params['track_open'] = opts[:'track_open'] if !opts[:'track_open'].nil?
      form_params['sign_dkim'] = opts[:'sign_dkim'] if !opts[:'sign_dkim'].nil?

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['apiKeyAuth']

      new_options = opts.merge(
        :operation => :"RelayApi.relay_raw_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: RelayApi#relay_raw_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
