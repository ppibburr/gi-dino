import os
import sys
import gi

gi.require_version("Dino", "0.1")

from gi.repository import GLib, GObject, Pango, GdkPixbuf, Gtk, Gio, Qlite,Xmpp,Dino, DinoUI, Adw

def init_dino():
	Qlite.Database
	Xmpp.Jid
	Dino.Application
	

init_dino()

class Application(Gtk.Application, Dino.Application):
	__gtype_name__ = 'PyDinoApplication'
	
	plugin_registry       = GObject.Property(type=Dino.PluginsRegistry)
	search_path_generator = GObject.Property(type=Dino.SearchPathGenerator)
	db                    = GObject.Property(type=Dino.Database)
	stream_interactor     = GObject.Property(type=Dino.StreamInteractor)
	settings              = GObject.Property(type=Dino.EntitiesSettings)
	
	@search_path_generator.getter
	def search_path_generator(self):
		return self.sp
		
	@plugin_registry.getter
	def plugin_registry(self):
		return self.pr
	
	def __init__(self, n,f):
		super(Application,self).__init__(application_id=n, flags=f)
		
		self.sp=Dino.SearchPathGenerator.new(exec_path="/home/bidenboi/git/gi-dino/git/dino/build/plugins")

		self.pr = Dino.PluginsRegistry()

		self.init()
		
		self.connect("activate", self.on_activate)
		
		self.loader = Dino.PluginsLoader.new(self)
		self.loader.load_all()

	def on_activate(self, app):
		mp    = self.get_stream_interactor().get_module_by_type(Dino.MessageProcessor)
		calls = self.get_stream_interactor().get_module_by_type(Dino.Calls)
		
		self.quit()
		

def main(argv):
	dino = Application('dino.im.PyDino', Gio.ApplicationFlags.HANDLES_OPEN)
	dino.run(argv)


if __name__ == '__main__':
    SystemExit(main(sys.argv))
