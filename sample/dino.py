# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301
# USA


import codecs
import os
import sys
import textwrap
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
		self.sp=Dino.SearchPathGenerator.new(exec_path="/usr/lib/gi-dino/")

		self.pr = Dino.PluginsRegistry()

		self.init()
		
		self.loader = Dino.PluginsLoader.new(self)
		self.loader.load_all()
		
	def on_stanza_send(self,xs,s):
		print(s.to_xml()) 
		
	def on_account(self, si, a, s):
		print(a.get_full_jid().to_string()+" connected\n")
		s.connect_after('stanza-send', self.on_stanza_send)
		
	def on_call_incoming(self,calls,c,s,co,v,m):
		s.accept()
		
		self.w=DinoUI.UiCallWindow()
		self.w.controller = DinoUI.UiCallWindowController.new(self.w,s,self.get_stream_interactor())
		
		self.w.present()
		
	def on_activate(self, app):
		mp=self.get_stream_interactor().get_module_by_type(Dino.MessageProcessor)
		mp.connect('message-received',self.on_message)
		
		calls=self.get_stream_interactor().get_module_by_type(Dino.Calls)
		calls.connect('call-incoming',self.on_call_incoming)
		
		self.get_stream_interactor().connect('stream-negotiated', self.on_account)
		
		self.hold()
		
	def on_message(self,mp,m,c):
		print("MESSAGE - from: "+c.get_account().get_full_jid().to_string()+"\n"+m.get_body()+"\n")
		
	def run(self, argv):
		self.connect('activate', self.on_activate)
		return super(Application, self).run(argv)
		

def main(argv):
	dino = Application('dino.im.PyDino', Gio.ApplicationFlags.HANDLES_OPEN)
	dino.run(argv)


if __name__ == '__main__':
    SystemExit(main(sys.argv))
