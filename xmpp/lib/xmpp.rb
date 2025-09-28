require 'gobject-introspection'

module Xmpp
  class Loader < GObjectIntrospection::Loader
  
    def define_constant name,info
     
      return if [
                 "XepMucROOM_CONFIGURATION_CODES",
                 "XepMucUSER_REMOVED_CODES",
                 "XepJingleReasonElementNORMAL_TERMINATE_REASONS", 
                ].index(name)
      super
    end
  end

  Loader.load("Xmpp", self)
end

class Xmpp::StanzaEntry
  def [] k
    get_attribute k
  end
  
  def []= k,v
    put_attribute k, v
  end
  
  def << n
    put_node n
    self
  end
  
  def type; self[:type];end
  def id; self[:id];end
  def to; self[:to];end
  def from; self[:from];end
end

class Xmpp::StanzaNode  
  alias _get_subnodes_real get_subnodes
  def get_subnodes(*o)
    _get_subnodes_real(*o).map do |ptr|
      Xmpp::Loader.instantiate_gobject_pointer(ptr)
    end 
  end
end

class Xmpp::XmppStream
  def flags
    get_property(:flags).map do |ptr|
      Xmpp::Loader.instantiate_gobject_pointer(ptr)
    end
  end
end

if !Object.const_defined?("Gee")
module Gee
  class Loader < GObjectIntrospection::Loader
  end

  Loader.load("Gee", self)
end

class Gee::ArrayList
  include Enumerable
  def each
    (0..(size-1)).each do |i|
      x = get(i)
      yield x
    end
  end
  
  def [] i
    get(i)
  end
end

class Gee::HashMap
  def [] k
    get(k)
  end
  
  def []= k,v
    set(k,v)
  end
end
end
