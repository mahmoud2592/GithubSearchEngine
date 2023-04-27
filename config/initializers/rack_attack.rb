Rack::Attack.throttle('requests/ip', limit: 5, period: 5) do |req|
  req.ip
end
