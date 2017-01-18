require "rubygems"
require "net/http"
require "uri"
require 'unicode'
uri = URI.parse("http://localhost:3000/quiz")
response = Net::HTTP.post_form(uri, 
{  
"question" => "Отчизны внемлем призыванье",
"id"       => 64,
"level"    => 1,
})


