  task :build do
    puts "Building Jekyll"
    sh "bundle exec jekyll build"
    sh "bin/build.sh"
  end

  task :run do
    sh "docker ps -a -q --filter=\"name=nginx_1.skylerto.github.io\""
    sh "docker run --name nginx_1.skylerto.github.io -d -p 80:80 skylerto.github.io:$(cat VERSION)"
  end
