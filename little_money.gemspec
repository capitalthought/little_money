# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{little_money}
  s.version = "0.0.1.20110317132241"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Robert Rasmussen"]
  s.date = %q{2011-03-17}
  s.default_executable = %q{little_money}
  s.description = %q{The problem: I needed non-floating point calculations to 4 decimal places. 
Much like the money gem, this gem allows you to avoid floating point
errors by performing calculations using whole numbers. Unlike the money
gem, this one supports an arbitrary number of decimal places for things
with sub-cent prices (commodities, etc.)}
  s.email = ["rob.rasmussen@gmail.com"]
  s.executables = ["little_money"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = [".autotest", "History.txt", "Manifest.txt", "README.txt", "Rakefile", "bin/little_money", "lib/little_money.rb", "test/test_little_money.rb", ".gemtest"]
  s.homepage = %q{https://github.com/robrasmussen/little_money}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{little_money}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{The problem: I needed non-floating point calculations to 4 decimal places}
  s.test_files = ["test/test_little_money.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 2.9.1"])
    else
      s.add_dependency(%q<hoe>, [">= 2.9.1"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 2.9.1"])
  end
end
