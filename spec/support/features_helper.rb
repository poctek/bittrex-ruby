def set_bittrex_api_token
  if !ENV['API_KEY'] or !ENV['API_SECRET']
    skip "[WARNING] If you want run 'spec/features', you must set 'spec/.env' file from 'spec/.env.template'."
    return
  end

  Bittrex.config do |c|
    c.key = ENV['API_KEY']
    c.secret = ENV['API_SECRET']
  end
end
