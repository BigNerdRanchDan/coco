# -*- encoding: utf-8 -*-

require 'rake'

Gem::Specification.new do |s|
  s.name = 'coco'
  s.version = File.read('VERSION').strip
  s.authors = ['Xavier Nayrac']
  s.email = 'xavier.nayrac@gmail.com'
  s.summary = 'Code coverage tool for ruby 1.9.2 to 2.0'
  s.homepage = 'http://lkdjiin.github.com/coco/'
  s.description = %q{"Code coverage tool for ruby 1.9.2 to 2.0.
Use it by "require 'coco'" from rspec or unit/test.
It display names of uncovered files on console.
It builds simple html report.
It reports sources that have no tests.
It's configurable with a simple yaml file.}
	
	readmes = FileList.new('*') do |list|
		list.exclude(/(^|[^.a-z])[a-z]+/)
		list.exclude('TODO')
	end.to_a
  s.files = FileList['lib/**/*.rb', 'template/**/*', '[A-Z]*'].to_a + readmes
	s.license = 'GPL-3'
	s.required_ruby_version = '>= 1.9.2'
end
