require 'net/http'
require 'json'

def lookup(domain)
    parts = domain.split('.')
    output = Net::HTTP.get("api.namevine.com","/domain?q=#{parts[0]}&x=#{parts[1]}") 
    output = JSON.parse(output)
    return output["status"]
end

if ARGV.empty?
    exit 
else
    domain = ARGV[0]
    puts "Your domain (#{domain}) is #{lookup(domain)}"
end

