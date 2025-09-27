 namespace GIDX {
  using Gee;
  using Dino;
  using Dino.Entities;
  
  public class Application : Dino.Application, Gtk.Application {
	public Application() {
		activate.connect(()=>{
			stdout.printf("WORKS\n");
			quit();
		});
	}  
	
	public void handle_uri(string a, string b, Gee.Map<string,string> c) {
		
	}
  }
  
  static int main() {
	  var app = new Application();
	  app.run();
	  return 0;
  }
}

