repositories.remote << 'http://www.ibiblio.org/maven2'
repositories.release_to = File.readlines('release_to')[0]

require 'time'

THIS_VERSION = '20110525'

ant_layout = Layout.new

ant_layout[:source, :main, :java] = 'src'
ant_layout[:source, :main, :resources] = 'resource'
ant_layout[:source, :test, :java] = 'test'

desc 'json'
define 'json', :layout=>ant_layout do
  project.group = 'org.json'
  project.version = THIS_VERSION
  package :sources
  package :javadoc
  package(:jar).with :manifest=>
  { 
    'Project' => project.id,
    'Version' => THIS_VERSION,
    'Creation' => Time.now.strftime("%a, %d %b %Y %H:%M:%S %z")
  }

end
