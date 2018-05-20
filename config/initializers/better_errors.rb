if Rails.env.development?
    BetterErrors::Middleware.allow_ip! '0.0.0.0/0' if defined? BetterErrors
end