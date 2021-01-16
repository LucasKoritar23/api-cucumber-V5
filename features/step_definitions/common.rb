# General
def prepare_request(token, payload, custom_headers = nil)
  token == nil ? header_send = { 'Content-Type' => 'application/json' } : header_send = { 'Content-Type' => 'application/json', 'Authorization' => token }
  if custom_headers == nil
    { body: payload == nil ? nil : payload.to_json, headers: { 'Content-Type' => 'application/json', 'Authorization' => token } }
    request = { body: payload == nil ? nil : payload.to_json, headers: header_send }
  else
    custom_headers.each do |key, value|
      header_send[key] = value
    end
    { body: payload == nil ? nil : payload.to_json, headers: header_send }
    request = { body: payload == nil ? nil : payload.to_json, headers: header_send }
  end
  request
end

def prepare_request_put(token, payload)
  { query: payload, headers: { 'Content-Type' => 'application/json', 'Authorization' => token } }
end

def prepare_request_archive(token, payload)
  { body: payload, headers: { 'Content-Type' => 'application/pdf', 'Authorization' => token } }
end

def prepare_request_image(token, payload)
  { body: payload, headers: { 'Content-Type' => 'image/jpeg', 'Authorization' => token } }
end

# Protocolos HTTP
def execute_post(http_party, token, url, payload, headers = nil)
  http_party.class.post(url, prepare_request(token, payload, headers))
end

def execute_patch(http_party, token, url, payload, headers = nil)
  http_party.class.patch(url, prepare_request(token, payload, headers))
end

def execute_post_archive(http_party, token, url, payload)
  http_party.class.post(url, prepare_request_archive(token, payload))
end

def execute_post_image(http_party, token, url, payload)
  http_party.class.post(url, prepare_request_image(token, payload))
end

def execute_get(http_party, token, url, headers = nil)
  http_party.class.get(URI.parse(URI.encode(url)), prepare_request(token, nil, headers))
end

def execute_get_without_redirects(http_party, token, url, headers = nil)
  request = prepare_request(token, nil, headers)
  request[:follow_redirects] = false
  http_party.class.get(URI.parse(URI.encode(url)), request)
end

def execute_get_download_with_redirects(url)
  HTTParty.get(url)
end

def execute_delete(http_party, token, url, headers = nil)
  http_party.class.delete(URI.parse(URI.encode(url)), prepare_request(token, nil, headers))
end

def log_util(message)
  time = Time.now.strftime("%d-%m-%y %H:%M:%S")
  log_message = "[RED-FIVE][#{time}] - #{message}"
  log(log_message)
  Allure.add_attachment(name: "log", source: log_message, type: Allure::ContentType::TXT)
end
