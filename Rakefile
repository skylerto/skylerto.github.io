require 'net/http'
require 'uri'

task :build do
  puts "Building Jekyll"
  sh "bundle exec jekyll build"
  sh "bin/build.sh"
end

task :run do
  sh "docker ps -a -q --filter=\"name=nginx_1.skylerto.github.io\""
  sh "docker run --name nginx_1.skylerto.github.io -d -p 80:80 skylerto.github.io:$(cat VERSION)"
end

task :covid do
  address = 'https://data.ontario.ca/dataset/f4112442-bdc8-45d2-be3c-12efae72fb27/resource/4f39b02b-47fe-4e66-95b6-e6da879c6910/download/conposcovidloc.geojson'
  data_path = '_data/conposcovidloc.json'
  sh "curl -s #{address} > #{data_path}"
end
