lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include? lib
require 'team_bugzilla_metrics/version'

Gem::Specification.new do |spec|

  # Get authors from git commits
  authors_hash = Hash[`git log --no-merges --reverse --format='%an,%ae'`.split("\n").uniq.collect {|i| i.split(",")}]

  spec.name             = "team_bugzilla_metrics"
  spec.version          = TeamBugzillaMetrics::VERSION
  spec.authors          = authors_hash.keys
  spec.email            = authors_hash.values
  spec.description      = %q{
Team Bugzilla Metrics creates a number of different reports used to judge the
health of the ManageIQ project with relation to how many bugs are in Bugzilla.
}
  spec.summary          = %q{Team Bugzilla Metrics creates reports from Bugzilla for the ManageIQ project.}
  spec.homepage         = "http://github/blomquisg/team_bugzilla_metrics"
  spec.license          = "MIT"

  spec.files            = `git ls-files -- lib/*`.split("\n")
  spec.files            = %w[README.md LICENSE.txt]
  #spec.executables      =
  spec.test_files       = `git ls-files -- spec/*`.split("\n")
  spec.require_paths    = ["lib"]

  spec.required_ruby_version = ">= 2.0.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "rubocop"

  spec.add_dependency "active_bugzilla"
  spec.add_dependency "more_core_extensions", "~> 3.0"
end
