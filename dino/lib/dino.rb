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
