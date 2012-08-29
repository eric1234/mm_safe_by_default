Gem::Specification.new do |s|
  s.name = 'mm_safe_by_default'
  s.version = '0.0.1'
  s.author = 'Eric Anderson'
  s.email = 'eric@pixelwareinc.com'
  s.add_dependency 'mongo_mapper'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'bson_ext'
  s.files = Dir['lib/**/*.rb']
  s.extra_rdoc_files << 'README.rdoc'
  s.rdoc_options << '--main' << 'README.rdoc'
  s.summary = 'Models are safe unless unsafe is called'
  s.description = <<-DESCRIPTION
    The opposite of the built-in 'safe' plugin. All models are safe by default.
    Only if unsafe is called can you fire and forget.
  DESCRIPTION
end
