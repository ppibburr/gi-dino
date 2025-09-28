require 'gobject-introspection'

module Qlite
  class Loader < GObjectIntrospection::Loader
  end

  Loader.load("Qlite", self)
end

module Dino
  class Loader < GObjectIntrospection::Loader
  end

  Loader.load("Dino", self)
end

module DinoUI
  class Loader < GObjectIntrospection::Loader
  end

  Loader.load("DinoUI", self)
end

class Dino::Database
  alias :_accounts_real :accounts 
  def accounts
    _accounts_real.map do |ptr|
      Dino::Loader.instantiate_gobject_pointer(ptr)
    end
  end
  
  alias _get_conversations_real get_conversations
  def get_conversations(acct)
    _get_conversations_real(acct).map do |ptr|
      Dino::Loader.instantiate_gobject_pointer(ptr)
    end
  end
end

class Dino::StreamInteractor
  def interaction_modules
    get_property(:interaction_modules).map do |ptr|
      Dino::Loader.instantiate_gobject_pointer ptr
    end
  end
end
