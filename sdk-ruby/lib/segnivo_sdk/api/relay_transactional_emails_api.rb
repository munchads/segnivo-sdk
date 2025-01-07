=begin
#Segnivo Developer API

#**API Version**: 1.7  **Date**: 9th July, 2024  ## 📄 Getting Started  This API is based on the REST API architecture, allowing the user to easily manage their data with this resource-based approach.  Every API call is established on which specific request type (GET, POST, PUT, DELETE) will be used.  The API must not be abused and should be used within acceptable limits.  To start using this API, you will need not create or access an existing Segnivo account to obtain your API key ([retrievable from your account settings](https://messaging.segnivo.com/account/api)).  - You must use a valid API Key to send requests to the API endpoints.      - The API only responds to HTTPS-secured communications. Any requests sent via HTTP return an HTTP 301 redirect to the corresponding HTTPS resources.      - The API returns request responses in JSON format. When an API request returns an error, it is sent in the JSON response as an error key or with details in the message key.       ### 🔖 **Need some help?**  In case you have questions or need clarity with interacting with some endpoints feel free to create a support ticket on your account or you can send an email ([<i>developers@segnivo.com</i>](https://mailto:developers@segnivo.com)) directly and we would be happy to help.  ---  ## Authentication  As noted earlier, this API uses API keys for authentication. You can generate a Segnivo API key in the [API](https://messaging.segnivo.com/account/api) section of your account settings.  You must include an API key in each request to this API with the `X-API-KEY` request header.  ### Authentication error response  If an API key is missing, malformed, or invalid, you will receive an HTTP 401 Unauthorized response code.  ## Rate and usage limits  API access rate limits apply on a per-API endpoint basis in unit time. The limit is 10k requests per hour for most endpoints and 1m requests per hour for transactional/relay email-sending endpoints. Also, depending on your plan, you may have usage limits. If you exceed either limit, your request will return an HTTP 429 Too Many Requests status code or HTTP 403 if sending credits have been exhausted.  ### 503 response  An HTTP `503` response from our servers may indicate there is an unexpected spike in API access traffic, while this rarely happens, we ensure the server is usually operational within the next two to five minutes. If the outage persists or you receive any other form of an HTTP `5XX` error, contact support ([<i>developers@segnivo.com</i>](https://mailto:developers@segnivo.com)).  ### Request headers  To make a successful request, some or all of the following headers must be passed with the request.  | **Header** | **Description** | | --- | --- | | Content-Type | Required and should be `application/json` in most cases. | | Accept | Required and should be `application/json` in most cases | | Content-Length | Required for `POST`, `PATCH`, and `PUT` requests containing a request body. The value must be the number of bytes rather than the number of characters in the request body. | | X-API-KEY | Required. Specifies the API key used for authorization. |  ##### 🔖 Note with example requests and code snippets  If/when you use the code snippets used as example requests, remember to calculate and add the `Content-Length` header. Some request libraries, frameworks, and tools automatically add this header for you while a few do not. Kindly check and ensure yours does or add it yourself.

The version of the OpenAPI document: 1.0.0

Generated by: https://openapi-generator.tech
Generator version: 7.10.0

=end

require 'cgi'

module SegnivoSDK
  class RelayTransactionalEmailsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Send an Email
    # The `/send` endpoint lets you send marketing and transactional emails from your `Segnivo Messaging` account.  The following data should be passed in JSON format in the request body  - **subject** - The subject of the email      - **from_name** (optional) - The full name of the sender      - **from_email** - The email of the sender      - **reply_to** (optional) - The email to which replies should be sent      - **content_type** (optional, defaults to `html`) - The content type of the email body. Accepts either `text` or `html`      - **recipients** - An array/collection of email addresses to deliver this message, max. 50      - **content** - The HTML or plain text content of the email      - **preheader** (optional) - The email preheader      - **custom_headers** (optional) - An object of custom headers to add to the email      - **delivery_at** (optional) - The 10-digit unix timestamp of the date/time at which this email should be delivered      - **attachments** (optional) - An array/collection of the URLs of files to attach to the email      - **sign_dkim** (optional, defaults to `true`) - A boolean value on if a DKIM signature should be included in this message      - **track_click** (optional, defaults to `true`) - A boolean value on if email clicks should be tracked. If `true` links in the email will be rewritten to enable tracking      - **track_open** (optional, defaults to `true`) - A boolean value on if the email opens should be tracked      - **is_transactional** (optional, defaults to `false`) - A boolean value to flag this email as a transactional email       #### 🔖 Important  **`is_transactional`** must only be set to `true` for transactional emails. Setting this to `true` for marketing emails will result in your API access being revoked and your account disabled.
    # @param [Hash] opts the optional parameters
    # @option opts [Object] :body 
    # @return [Object]
    def relay_send_post(opts = {})
      data, _status_code, _headers = relay_send_post_with_http_info(opts)
      data
    end

    # Send an Email
    # The &#x60;/send&#x60; endpoint lets you send marketing and transactional emails from your &#x60;Segnivo Messaging&#x60; account.  The following data should be passed in JSON format in the request body  - **subject** - The subject of the email      - **from_name** (optional) - The full name of the sender      - **from_email** - The email of the sender      - **reply_to** (optional) - The email to which replies should be sent      - **content_type** (optional, defaults to &#x60;html&#x60;) - The content type of the email body. Accepts either &#x60;text&#x60; or &#x60;html&#x60;      - **recipients** - An array/collection of email addresses to deliver this message, max. 50      - **content** - The HTML or plain text content of the email      - **preheader** (optional) - The email preheader      - **custom_headers** (optional) - An object of custom headers to add to the email      - **delivery_at** (optional) - The 10-digit unix timestamp of the date/time at which this email should be delivered      - **attachments** (optional) - An array/collection of the URLs of files to attach to the email      - **sign_dkim** (optional, defaults to &#x60;true&#x60;) - A boolean value on if a DKIM signature should be included in this message      - **track_click** (optional, defaults to &#x60;true&#x60;) - A boolean value on if email clicks should be tracked. If &#x60;true&#x60; links in the email will be rewritten to enable tracking      - **track_open** (optional, defaults to &#x60;true&#x60;) - A boolean value on if the email opens should be tracked      - **is_transactional** (optional, defaults to &#x60;false&#x60;) - A boolean value to flag this email as a transactional email       #### 🔖 Important  **&#x60;is_transactional&#x60;** must only be set to &#x60;true&#x60; for transactional emails. Setting this to &#x60;true&#x60; for marketing emails will result in your API access being revoked and your account disabled.
    # @param [Hash] opts the optional parameters
    # @option opts [Object] :body 
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def relay_send_post_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: RelayTransactionalEmailsApi.relay_send_post ...'
      end
      # resource path
      local_var_path = '/relay/send'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(opts[:'body'])

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['apiKeyAuth']

      new_options = opts.merge(
        :operation => :"RelayTransactionalEmailsApi.relay_send_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: RelayTransactionalEmailsApi#relay_send_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end