require File.expand_path(File.dirname(__FILE__)+'/../../xmpp/lib/xmpp.rb')
require File.expand_path(File.dirname(__FILE__)+'/../../dino/lib/dino.rb')

module GIDX
  class Loader < GObjectIntrospection::Loader
  end

  Loader.load("GIDX", self)
end
