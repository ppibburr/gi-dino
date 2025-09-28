 namespace GIDX {
  using Gee;
  using Dino;
  using Dino.Entities;
  
  public class Application : Dino.Application, Gtk.Application {
	public Application(string id, GLib.ApplicationFlags flags) {
		Object(application_id: id, flags: flags);
		
		activate.connect(()=>{
		  stdout.printf("works\n");
		});
	}  
	
	public void handle_uri(string a, string b, Gee.Map<string,string> c) {
		
	}
  }
  
  static int main() {
	  var app = new Application("org.wwoof.Ree", GLib.ApplicationFlags.HANDLES_OPEN);
	  app.run();
	  return 0;
  }
}

